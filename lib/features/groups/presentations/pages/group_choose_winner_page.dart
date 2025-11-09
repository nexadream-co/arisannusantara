import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/enums/payment_status_enum.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/utils/custom_alert.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../domain/entities/group_entity.dart';
import '../../domain/entities/member_entity.dart';
import '../providers/get_group_detail_provider.dart';
import '../providers/group_providers.dart';

class GroupChooseWinnerPage extends ConsumerStatefulWidget {
  final GroupEntity group;
  static const String path = '/group/choose/winner';
  const GroupChooseWinnerPage({super.key, required this.group});

  @override
  ConsumerState<GroupChooseWinnerPage> createState() =>
      _GroupChooseWinnerPageState();
}

class _GroupChooseWinnerPageState extends ConsumerState<GroupChooseWinnerPage> {
  final List<MemberEntity> _selectedMembers = [];

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(
      getMembersProvider(
        widget.group.id!,
        null,
        paymentStatus: PaymentStatusEnum.paid,
        hasReward: false,
        isActive: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Pemenang"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          padding: EdgeInsets.only(left: context.spacing.sm),
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actionsPadding: EdgeInsets.only(right: context.spacing.lg),
        actions: const [Icon(Icons.info_outline)],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              right: context.spacing.lg,
              left: context.spacing.lg,
              bottom: context.spacing.xl * 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pemenang Arisan',
                  maxLines: 1,
                  style: context.textStyles.header.copyWith(
                    color: context.colors.primary,
                  ),
                ),
                Text(
                  widget.group.name ?? '',
                  maxLines: 1,
                  style: context.textStyles.body,
                ),
                SizedBox(height: context.spacing.md),
                Row(
                  children: [
                    Text(
                      'Pemenang',
                      style: context.textStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Maksimal ${widget.group.maxWinner}',
                      style: context.textStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.spacing.xs),

                provider.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, _) => const SizedBox(),
                  data: (result) {
                    final members = result.resultValue ?? [];

                    return Column(
                      children: [
                        if (members.isEmpty)
                          Container(
                            margin: EdgeInsets.only(
                              bottom: context.spacing.md,
                              top: context.spacing.md,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: context.spacing.sm,
                              horizontal: context.spacing.md,
                            ),
                            decoration: BoxDecoration(
                              color: context.colors.accent,
                              borderRadius: BorderRadius.circular(
                                context.radius.medium,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.info_outline),
                                SizedBox(width: context.spacing.sm),
                                Expanded(
                                  child: Text(
                                    'Belum ada anggota yang berhak menjadi pemenang',
                                    style: context.textStyles.body,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        for (final member in members)
                          StatefulBuilder(
                            builder: (context, setStateItem) {
                              final isSelected = _selectedMembers.contains(
                                member,
                              );

                              return Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: context.spacing.sm,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: context.colors.divider,
                                    ),
                                  ),
                                ),
                                child: CheckboxListTile(
                                  value: isSelected,
                                  onChanged: (value) {
                                    if (value == true) {
                                      if (_selectedMembers.length >=
                                          (widget.group.maxWinner ?? 0)) {
                                        CustomSnackbar.warning(
                                          message:
                                              'Maksimal ${widget.group.maxWinner} pemenang!',
                                        );
                                        return;
                                      }
                                      setState(() {
                                        _selectedMembers.add(member);
                                      });
                                    } else {
                                      setState(() {
                                        _selectedMembers.remove(member);
                                      });
                                    }

                                    // update UI for this item only
                                    setStateItem(() {});
                                  },
                                  secondary: CircleAvatar(
                                    backgroundColor: context.colors.surface,
                                    child: Text(
                                      member.user?.name?.initials ?? '',
                                      style: context.textStyles.body.copyWith(
                                        color: context.colors.primary,
                                      ),
                                    ),
                                  ),
                                  title: Text(member.user?.name ?? ''),
                                  subtitle: Text(member.user?.email ?? ''),
                                ),
                              );
                            },
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          /// Bottom button
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(context.spacing.lg),
                child: FilledButton(
                  onPressed: _selectedMembers.isEmpty
                      ? null
                      : () {
                          CustomAlert.show(
                            context,
                            title: 'Simpan Pemenang',
                            description:
                                'Apakah anda yakin ingin menyimpan pemenang?',
                            onYes: () {
                              LoadingOverlay.show(context);
                              ref
                                  .read(createHistoryUsecaseProvider)
                                  .call(
                                    groupId: widget.group.id!,
                                    winners: _selectedMembers,
                                  )
                                  .then((result) {
                                    LoadingOverlay.hide();
                                    if (result.isSuccess) {
                                      CustomSnackbar.success(
                                        message: result.resultValue,
                                      );
                                      ref.invalidate(
                                        getGroupDetailProvider(
                                          widget.group.id!,
                                        ),
                                      );

                                      ref.invalidate(
                                        checkEligibleToShuffleProvider(
                                          widget.group.id!,
                                        ),
                                      );
                                      context.pop();
                                    } else {
                                      CustomSnackbar.error(
                                        message: result.errorMessage,
                                      );
                                    }
                                  });
                            },
                          );
                        },
                  child: const Text('Simpan Pemenang'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
