import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../../config/enums/payment_status_enum.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/utils/app_modal_bottom_sheet.dart';
import '../../../../core/utils/custom_alert.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../shared/widgets/textfield_without_border_widget.dart';
import '../../../auth/presentations/provider/auth_state_provider.dart';
import '../../domain/entities/group_entity.dart';
import '../../domain/entities/member_entity.dart';
import '../providers/group_providers.dart';

class GroupMemberPage extends ConsumerStatefulWidget {
  final GroupEntity group;
  const GroupMemberPage({super.key, required this.group});

  @override
  ConsumerState<GroupMemberPage> createState() => _GroupMemberPageState();
}

class _GroupMemberPageState extends ConsumerState<GroupMemberPage> {
  final _debouncer = Debouncer(milliseconds: 300);
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.radius.medium),
      borderSide: BorderSide.none,
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: context.spacing.md),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.radius.medium),
              ),
              child: TextFormField(
                controller: _searchController,
                onChanged: (value) {
                  _debouncer.run(() {
                    ref.invalidate(
                      getMembersProvider(
                        widget.group.id!,
                        _searchController.text,
                      ),
                    );
                  });
                },
                decoration: InputDecoration(
                  hintText: "Cari peserta...",
                  hintStyle: context.textStyles.subtitle,
                  fillColor: context.colors.surface,
                  filled: true,
                  enabledBorder: border,
                  focusedBorder: border,
                  border: border,
                  suffixIcon: Icon(
                    Icons.search,
                    color: context.colors.textPrimary,
                  ),
                ),
              ),
            ),
            _groupMember(),
          ],
        ),
      ),

      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          final auth = ref.watch(authStateProvider);
          return auth.when(
            error: (err, _) => const SizedBox(),
            loading: () => const SizedBox(),
            data: (user) {
              bool isOwner = (widget.group.owners ?? []).contains(user?.id);
              if (!isOwner) return const SizedBox();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: context.spacing.md,
                children: [
                  FloatingActionButton(
                    heroTag: "add-member",
                    backgroundColor: context.colors.primary,
                    child: const Icon(Icons.add),
                    onPressed: () {
                      _memberModal();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _groupMember() {
    return Consumer(
      builder: (context, ref, child) {
        final auth = ref.watch(authStateProvider);
        final membersRef = ref.watch(
          getMembersProvider(widget.group.id!, _searchController.text),
        );

        return Container(
          margin: EdgeInsets.only(bottom: context.spacing.md),
          padding: EdgeInsets.symmetric(vertical: context.spacing.xs),
          child: Column(
            spacing: context.spacing.md,
            children: [
              membersRef.when(
                loading: () => Text(
                  'Mohon tunggu...',
                  style: context.textStyles.body.copyWith(
                    color: context.colors.primary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                error: (err, stack) => Text(
                  'Terjadi kesalahan, mohon coba kembali',
                  style: context.textStyles.body.copyWith(
                    color: context.colors.primary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                data: (result) {
                  if (result.isFailed) return const SizedBox();
                  final members = result.resultValue ?? [];
                  return Column(
                    children: [
                      if (members.isEmpty)
                        Container(
                          margin: EdgeInsets.only(bottom: context.spacing.md),
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
                                  'Belum ada peserta di grup ini',
                                  style: context.textStyles.body,
                                ),
                              ),
                            ],
                          ),
                        ),
                      for (var i = 0; i < members.length; i++)
                        Container(
                          padding: EdgeInsets.only(bottom: context.spacing.md),
                          decoration: BoxDecoration(
                            border: i == 2
                                ? null
                                : Border(
                                    bottom: BorderSide(
                                      color: context.colors.divider,
                                    ),
                                  ),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: members[i].isActive == true
                                    ? context.colors.surface
                                    : context.colors.error.withValues(
                                        alpha: 0.4,
                                      ),
                                child: Text(
                                  members[i].user?.name?.initials ?? '',
                                  style: context.textStyles.body.copyWith(
                                    color: context.colors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: context.spacing.sm),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      members[i].user?.name ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textStyles.bodySmall
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(height: context.spacing.xs),
                                    Text(
                                      members[i].user?.email ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textStyles.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              if (members[i].hasReward == true)
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.emoji_events_outlined,
                                    color: context.colors.warning,
                                  ),
                                ),
                              auth.when(
                                loading: () => const SizedBox(),
                                error: (_, __) => const SizedBox(),
                                data: (user) {
                                  bool isOwner = (widget.group.owners ?? [])
                                      .contains(user?.id);
                                  if (!isOwner) return const SizedBox();
                                  return IconButton(
                                    onPressed: () {
                                      _memberModal(member: members[i]);
                                    },
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      color: context.colors.primary,
                                    ),
                                  );
                                },
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    vertical: context.spacing.sm,
                                  ),
                                  minimumSize: Size(0, 0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.spacing.md,
                                  ),
                                  child: Text(
                                    members[i].paymentStatus?.label ?? '',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _memberModal({MemberEntity? member}) {
    bool selectedStatus = member?.isActive == null ? true : member!.isActive!;
    PaymentStatusEnum? selectedPaymentStatus =
        member?.paymentStatus ?? PaymentStatusEnum.unpaid;
    bool hasReward = member?.hasReward ?? false;
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();

    showAppModalBottomSheet(
      context: context,
      child: Padding(
        padding: EdgeInsets.all(context.spacing.md),
        child: Form(
          key: formKey,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header with name & status
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              member != null
                                  ? (member.user?.name ?? '')
                                  : 'Tambah Peserta',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyles.title.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.colors.primary,
                              ),
                            ),
                            Text(
                              member != null
                                  ? (member.user?.email ?? '')
                                  : 'Masukkan email/username peserta',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyles.body,
                            ),
                          ],
                        ),
                      ),
                      Text('Status', style: context.textStyles.body),
                      SizedBox(width: context.spacing.sm),
                      SizedBox(
                        width: context.appSize.s100,
                        child: DropdownButtonFormField<bool>(
                          initialValue: selectedStatus,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                          ),
                          items: [
                            DropdownMenuItem(
                              value: true,
                              child: Text(
                                'Aktif',
                                style: context.textStyles.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.colors.success,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: false,
                              child: Text(
                                'Tidak Aktif',
                                style: context.textStyles.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.colors.error,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => selectedStatus = value);
                            }
                          },
                        ),
                      ),
                    ],
                  ),

                  // Info section
                  Container(
                    margin: EdgeInsets.symmetric(vertical: context.spacing.md),
                    child: Text(
                      'Informasi Peserta',
                      style: context.textStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Create new
                  if (member == null)
                    _textField(
                      controller: emailController,
                      label: 'Email',
                      hintText: 'Masukkan email/username anda...',
                      readonly: false,
                      required: true,
                    ),

                  // Edit view only
                  if (member != null)
                    Column(
                      children: [
                        _textField(
                          controller: TextEditingController(
                            text: member.user?.name,
                          ),
                          label: 'Nama',
                          hintText: 'Masukkan nama anda...',
                          readonly: true,
                        ),
                        _textField(
                          controller: TextEditingController(
                            text: member.user?.gender == null
                                ? '-'
                                : (member.user?.gender == 'male'
                                      ? 'Laki-laki'
                                      : 'Perempuan'),
                          ),
                          label: 'Jenis Kelamin',
                          hintText: 'Masukkan jenis kelamin...',
                          readonly: true,
                        ),
                        _textField(
                          controller: TextEditingController(
                            text: member.user?.phoneNumber ?? '-',
                          ),
                          label: 'No Telp',
                          hintText: 'No telp anda...',
                          readonly: true,
                        ),
                      ],
                    ),

                  // Payment status section
                  Container(
                    margin: EdgeInsets.only(
                      top: context.spacing.lg,
                      bottom: context.spacing.sm,
                    ),
                    child: Text(
                      'Status Pembayaran',
                      style: context.textStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // CheckboxListTile using PaymentStatusEnum
                  Wrap(
                    children: PaymentStatusEnum.values.map((status) {
                      return SizedBox(
                        width: context.screen.width * 0.4,
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: selectedPaymentStatus == status,
                          onChanged: (_) {
                            setState(() => selectedPaymentStatus = status);
                          },
                          title: Text(status.label),
                        ),
                      );
                    }).toList(),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                      top: context.spacing.lg,
                      bottom: context.spacing.sm,
                    ),
                    child: Text(
                      'Sudah dapat Hadiah?',
                      style: context.textStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // CheckboxListTile using PaymentStatusEnum
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: hasReward,
                    onChanged: (_) {
                      setState(() => hasReward = !hasReward);
                    },
                    title: Text("Ya, sudah"),
                  ),

                  // Buttons
                  Container(
                    margin: EdgeInsets.only(
                      top: context.spacing.xxl,
                      bottom: context.spacing.sm,
                    ),
                    child: Row(
                      spacing: context.spacing.sm,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            if (member == null) {
                              Navigator.pop(context);
                              return;
                            }
                            CustomAlert.show(
                              context,
                              title: 'Hapus Peserta',
                              description:
                                  'Apakah anda yakin ingin menghapus peserta ini?',
                              onYes: () {
                                LoadingOverlay.show(context);
                                ref
                                    .read(deleteMemberUsecaseProvider)
                                    .call(member.id!)
                                    .then((result) {
                                      LoadingOverlay.hide();
                                      if (result.isSuccess) {
                                        Navigator.pop(context);
                                        CustomSnackbar.success(
                                          message: result.resultValue,
                                        );

                                        ref.invalidate(
                                          getMembersProvider(
                                            widget.group.id!,
                                            _searchController.text,
                                          ),
                                        );
                                      } else {
                                        CustomSnackbar.error(
                                          message: result.errorMessage,
                                        );
                                      }
                                    });
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: context.spacing.md,
                              horizontal: context.spacing.xl,
                            ),
                            foregroundColor: context.colors.error,
                            side: BorderSide(
                              color: context.colors.error,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                context.radius.medium,
                              ),
                            ),
                          ),
                          child: Text(member != null ? 'Hapus' : 'Batal'),
                        ),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              // Validation
                              if (selectedPaymentStatus == null) {
                                CustomSnackbar.error(
                                  message:
                                      'Pilih salah satu status pembayaran!',
                                );
                                return;
                              }

                              if (member != null) {
                                LoadingOverlay.show(context);
                                ref
                                    .read(updateMemberUsecaseProvider)
                                    .call(
                                      member.copyWith(
                                        email: member.user?.email,
                                        paymentStatus: selectedPaymentStatus,
                                        isActive: selectedStatus,
                                        hasReward: hasReward,
                                      ),
                                    )
                                    .then((result) {
                                      LoadingOverlay.hide();
                                      if (result.isSuccess) {
                                        Navigator.pop(context);
                                        CustomSnackbar.success(
                                          message: result.resultValue,
                                        );

                                        ref.invalidate(
                                          getMembersProvider(
                                            widget.group.id!,
                                            _searchController.text,
                                          ),
                                        );
                                      } else {
                                        CustomSnackbar.error(
                                          message: result.errorMessage,
                                        );
                                      }
                                    });
                              } else {
                                if (!formKey.currentState!.validate()) return;
                                LoadingOverlay.show(context);
                                ref
                                    .read(createMemberUsecaseProvider)
                                    .call(
                                      member: MemberEntity(
                                        groupId: widget.group.id!,
                                        paymentStatus: selectedPaymentStatus,
                                        isActive: selectedStatus,
                                        hasReward: hasReward,
                                      ),
                                      userEmail: emailController.text,
                                    )
                                    .then((result) {
                                      LoadingOverlay.hide();
                                      if (result.isSuccess) {
                                        Navigator.pop(context);
                                        CustomSnackbar.success(
                                          message: result.resultValue,
                                        );

                                        ref.invalidate(
                                          getMembersProvider(
                                            widget.group.id!,
                                            _searchController.text,
                                          ),
                                        );
                                      } else {
                                        CustomSnackbar.error(
                                          message: result.errorMessage,
                                        );
                                      }
                                    });
                              }
                            },
                            child: const Text('Simpan'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _textField({
    TextEditingController? controller,
    required String label,
    required String hintText,
    bool readonly = false,
    bool required = false,
    int maxLines = 1,
  }) {
    return Container(
      padding: EdgeInsets.only(bottom: context.spacing.sm),
      margin: EdgeInsets.only(bottom: context.spacing.xs),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.colors.divider)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.spacing.md,
        children: [
          Expanded(flex: 1, child: Text(label, style: context.textStyles.body)),
          Expanded(
            flex: 2,
            child: TextfieldWithoutBorderWidget(
              controller: controller,
              hintText: hintText,
              readonly: readonly,
              maxLines: maxLines,
              required: true,
            ),
          ),
        ],
      ),
    );
  }
}
