import 'dart:async';
import 'dart:math';

import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
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

class GroupShuffleWinnerPage extends ConsumerStatefulWidget {
  static const String path = '/group/shuffle/winner';
  final GroupEntity group;
  const GroupShuffleWinnerPage({super.key, required this.group});

  @override
  ConsumerState<GroupShuffleWinnerPage> createState() =>
      _GroupShuffleWinnerPageState();
}

class _GroupShuffleWinnerPageState
    extends ConsumerState<GroupShuffleWinnerPage> {
  List<MemberEntity> _members = [];
  final List<MemberEntity> _selectedMembers = [];
  final StreamController<int> _controller = StreamController<int>();
  int winnerIndex = 0;

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

    provider.whenData((result) {
      final members = result.resultValue ?? [];
      if (members.length < 2 && members.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          CustomAlert.show(
            context,
            title: 'Selamat, ${members[winnerIndex].user?.name ?? ''}!',
            description:
                'Telah menjadi pemenang, apakah anda ingin menyimpannya?',
            onYes: () async {
              _selectedMembers.add(members[winnerIndex]);
              await saveWinners();
              // this.context.pop();
            },
            onCancel: () {
              this.context.pop();
              this.context.pop();
            },
          );
        });
      }
    });

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(context.assets.textureBg),
              fit: BoxFit.cover,
            ),
          ),
          child: provider.when(
            loading: () => const SizedBox(),
            error: (error, stackTrace) => const SizedBox(),
            data: (result) {
              final members = result.resultValue ?? [];
              _members = [...members];
              if (members.length < 2 && members.isNotEmpty) {
                return Center(child: LoadingIconAnimation());
              }
              return StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: context.spacing.sm,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: context.colors.textPrimary,
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: Icon(
                                Icons.info_outline,
                                color: context.colors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: context.spacing.lg,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kocok Arisan',
                              maxLines: 1,
                              style: context.textStyles.header.copyWith(
                                color: context.colors.primary,
                              ),
                            ),
                            Text(
                              'Arisan Ceria',
                              maxLines: 1,
                              style: context.textStyles.body,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(context.spacing.lg),
                          child: FortuneWheel(
                            animateFirst: false,
                            selected: _controller.stream,
                            onAnimationEnd: () {
                              CustomAlert.show(
                                context,
                                title:
                                    'Selamat, ${_members[winnerIndex].user?.name ?? ''}!',
                                description:
                                    'Telah menjadi pemenang, apakah anda ingin menyimpannya?',
                                onCancelText: 'Ulangi',
                                onYes: () {
                                  setState(() {
                                    if (!_selectedMembers.contains(
                                      _members[winnerIndex],
                                    )) {
                                      _selectedMembers.add(
                                        _members[winnerIndex],
                                      );

                                      // if less than 2, fortune wheel will not work (error)
                                      if (_members.length > 2) {
                                        _members.removeAt(winnerIndex);
                                      }
                                    }
                                  });
                                },
                              );
                            },
                            items: _members
                                .map(
                                  (e) => FortuneItem(
                                    child: Text(
                                      e.user?.name ?? '',
                                      style: context.textStyles.title.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      Container(
                        height: _selectedMembers.isEmpty
                            ? context.appSize.s200
                            : context.appSize.s240,
                        padding: EdgeInsets.only(
                          left: context.spacing.lg,
                          right: context.spacing.lg,
                          bottom: context.spacing.lg,
                        ),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(
                              child: Scrollbar(
                                thickness: 0.6,
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.only(
                                    right: context.spacing.sm,
                                    top: context.spacing.md,
                                    bottom: context.spacing.md,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Total pemenang: ${_selectedMembers.length}',
                                            style: context.textStyles.body
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Spacer(),
                                          Text(
                                            'Maksimal: ${widget.group.maxWinner}',
                                            style: context.textStyles.body
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: context.spacing.md),
                                      if (_selectedMembers.isEmpty)
                                        Container(
                                          margin: EdgeInsets.only(
                                            bottom: context.spacing.md,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.info_outline),
                                              SizedBox(
                                                width: context.spacing.sm,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Pemenang belum terpilih, kocok terlebih dahulu',
                                                  style:
                                                      context.textStyles.body,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      for (
                                        var i = 0;
                                        i < _selectedMembers.length;
                                        i++
                                      )
                                        Container(
                                          padding: i == 2
                                              ? null
                                              : EdgeInsets.only(
                                                  bottom: context.spacing.md,
                                                ),
                                          decoration: BoxDecoration(
                                            border: i == 2
                                                ? null
                                                : Border(
                                                    bottom: BorderSide(
                                                      color: context
                                                          .colors
                                                          .divider,
                                                    ),
                                                  ),
                                          ),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    context.colors.surface,
                                                child: Text(
                                                  _selectedMembers[i]
                                                          .user
                                                          ?.name
                                                          ?.initials ??
                                                      '',
                                                  style: context.textStyles.body
                                                      .copyWith(
                                                        color: context
                                                            .colors
                                                            .primary,
                                                      ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: context.spacing.sm,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      _selectedMembers[i]
                                                              .user
                                                              ?.name ??
                                                          '',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: context
                                                          .textStyles
                                                          .bodySmall
                                                          .copyWith(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          context.spacing.xs,
                                                    ),
                                                    Text(
                                                      _selectedMembers[i]
                                                              .user
                                                              ?.email ??
                                                          '',
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: context
                                                          .textStyles
                                                          .bodySmall,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              OutlinedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (!_members.contains(
                                                      _selectedMembers[i],
                                                    )) {
                                                      _members.add(
                                                        _selectedMembers[i],
                                                      );
                                                    }

                                                    _selectedMembers.removeAt(
                                                      i,
                                                    );
                                                  });
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        context.spacing.sm,
                                                  ),
                                                  minimumSize: Size(0, 0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        context.spacing.md,
                                                  ),
                                                  child: Text('Hapus'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              spacing: context.spacing.sm,
                              children: [
                                if (_selectedMembers.length <
                                    (widget.group.maxWinner ?? 1))
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () {
                                        final random = Random();
                                        winnerIndex = random.nextInt(
                                          _members.length,
                                        );

                                        _controller.add(winnerIndex);
                                      },
                                      child: Text('Kocok'),
                                    ),
                                  ),
                                if (_selectedMembers.isNotEmpty)
                                  Expanded(
                                    child: FilledButton(
                                      onPressed: () {
                                        CustomAlert.show(
                                          context,
                                          title: 'Konfirmasi',
                                          description:
                                              'Apakah anda yakin ingin menyimpan pemenang?',
                                          onYes: () {
                                            saveWinners();
                                          },
                                        );
                                      },
                                      child: Text('Simpan'),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> saveWinners() async {
    LoadingOverlay.show(context);
    await ref
        .read(createHistoryUsecaseProvider)
        .call(groupId: widget.group.id!, winners: _selectedMembers)
        .then((result) {
          LoadingOverlay.hide();
          if (result.isSuccess) {
            CustomSnackbar.success(message: result.resultValue);
            ref.invalidate(getGroupDetailProvider(widget.group.id!));
            ref.invalidate(checkEligibleToShuffleProvider(widget.group.id!));
            context.pop();
          } else {
            CustomSnackbar.error(message: result.errorMessage);
          }
        });
  }
}
