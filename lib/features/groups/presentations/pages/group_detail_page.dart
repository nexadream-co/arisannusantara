import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/number_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/utils/app_modal_bottom_sheet.dart';
import '../../../../core/utils/custom_alert.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../shared/widgets/textfield_without_border_widget.dart';
import '../../domain/entities/group_entity.dart';
import '../../domain/entities/payment_account_entity.dart';
import '../providers/get_group_detail_provider.dart';
import '../providers/group_providers.dart';
import 'group_manager_create_page.dart';
import 'group_shuffle_winner_page.dart';

class GroupDetailPage extends ConsumerStatefulWidget {
  final GroupEntity group;
  const GroupDetailPage({super.key, required this.group});

  @override
  ConsumerState<GroupDetailPage> createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends ConsumerState<GroupDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Informasi Grup', style: context.textStyles.title),
            SizedBox(height: context.spacing.md),
            _groupInformationItem(
              'Iuran',
              widget.group.dues?.toIdrWithPrefix ?? '',
            ),
            _groupInformationItem(
              'Periode',
              widget.group.periodsType?.toPeriodsTypeId() ?? '-',
            ),
            _groupInformationItem('Hadiah', widget.group.reward ?? '-'),
            _groupInformationItem(
              'Maksimal pemenang',
              '${widget.group.maxWinner ?? 0} Orang',
            ),
            _groupInformationItem(
              'Tanggal kocok',
              widget.group.periodsDate.toIdDate,
            ),
            _groupInformationItem(
              'Biaya admin',
              widget.group.adminFee?.toIdrWithPrefix ?? '',
            ),
            _groupInformationItem(
              'Dibuat pada',
              widget.group.createdAt?.toIdDate ?? '-',
            ),
            SizedBox(height: context.spacing.lg),
            _groupPayment(),
            SizedBox(height: context.spacing.lg),
            _groupManager(),
          ],
        ),
      ),

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: context.spacing.md,
        children: [
          FloatingActionButton(
            heroTag: "shuffle",
            backgroundColor: context.colors.primary,
            child: const Icon(Icons.shuffle),
            onPressed: () {
              context.push(GroupShuffleWinnerPage.path);
            },
          ),
        ],
      ),
    );
  }

  Widget _groupInformationItem(String label, String value) {
    return Container(
      padding: EdgeInsets.only(bottom: context.spacing.sm),
      margin: EdgeInsets.only(bottom: context.spacing.sm),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.colors.divider)),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label, style: context.textStyles.body)),
          Text(
            value,
            style: context.textStyles.body.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _groupPayment() {
    final paymentAccounts = widget.group.paymentAccounts ?? [];
    return Column(
      children: [
        Row(
          children: [
            Text('Pembayaran', style: context.textStyles.title),
            Spacer(),
            TextButton(
              onPressed: () {
                _paymentAccountModal();
              },
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Wrap(
                children: [
                  Icon(
                    Icons.add_circle_outlined,
                    size: context.appSize.s16,
                    color: context.colors.primary,
                  ),
                  SizedBox(width: context.appSize.s4),
                  Text(
                    'Tambah',
                    style: context.textStyles.body.copyWith(
                      color: context.colors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: context.spacing.md),
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing.md,
            vertical: context.spacing.md,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [context.shadow.small],
            borderRadius: BorderRadius.circular(context.radius.medium),
          ),
          child: Column(
            spacing: context.spacing.md,
            children: [
              if (paymentAccounts.isEmpty)
                Text(
                  'Belum ada akun pembayaran',
                  textAlign: TextAlign.center,
                  style: context.textStyles.body,
                ),
              for (var i = 0; i < paymentAccounts.length; i++)
                Container(
                  padding: i == 2 || i == paymentAccounts.length - 1
                      ? null
                      : EdgeInsets.only(bottom: context.spacing.md),
                  decoration: BoxDecoration(
                    border: i == 2 || i == paymentAccounts.length - 1
                        ? null
                        : Border(
                            bottom: BorderSide(color: context.colors.divider),
                          ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: context.colors.surface,
                        child: Text(
                          paymentAccounts[i].accountName?.initials ?? '',
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
                              '${paymentAccounts[i].bankName} - ${paymentAccounts[i].accountName}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyles.bodySmall.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: context.spacing.xs),
                            Text(
                              paymentAccounts[i].bankNumber ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyles.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _paymentAccountModal(account: paymentAccounts[i]);
                        },
                        icon: Icon(
                          Icons.edit_outlined,
                          color: context.colors.primary,
                        ),
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
                          child: Text('Salin'),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _groupManager() {
    return Consumer(
      builder: (context, ref, child) {
        final provider = ref.watch(getGroupOwnersProvider(widget.group.id!));
        return provider.when(
          data: (result) {
            final groupOwners = result.resultValue ?? [];
            return Column(
              children: [
                Row(
                  children: [
                    Text('Pengelola', style: context.textStyles.title),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        context.push(
                          GroupManagerCreatePage.path,
                          extra: widget.group,
                        );
                      },
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: Wrap(
                        children: [
                          Icon(
                            Icons.add_circle_outlined,
                            size: context.appSize.s16,
                            color: context.colors.primary,
                          ),
                          SizedBox(width: context.appSize.s4),
                          Text(
                            'Tambah',
                            style: context.textStyles.body.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: context.spacing.md),
                  padding: EdgeInsets.symmetric(vertical: context.spacing.xs),
                  child: Column(
                    spacing: context.spacing.md,
                    children: [
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
                                'Lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
                                style: context.textStyles.body,
                              ),
                            ),
                          ],
                        ),
                      ),
                      for (var i = 0; i < groupOwners.length; i++)
                        Container(
                          padding: i == 2
                              ? null
                              : EdgeInsets.only(bottom: context.spacing.md),
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
                                backgroundColor: context.colors.surface,
                                child: Text(
                                  groupOwners[i].name?.initials ?? '',
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
                                      groupOwners[i].name ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textStyles.bodySmall
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    SizedBox(height: context.spacing.xs),
                                    Text(
                                      groupOwners[i].phoneNumber ??
                                          groupOwners[i].email ??
                                          '-',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textStyles.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: groupOwners.length == 1
                                    ? null
                                    : () {
                                        CustomAlert.show(
                                          context,
                                          title: 'Hapus pengelola',
                                          description:
                                              'Apakah Anda yakin ingin menghapus pengelola ini?',
                                          onYes: () {
                                            LoadingOverlay.show(context);
                                            ref
                                                .read(
                                                  removeGroupOwnerUsecaseProvider,
                                                )
                                                .call(
                                                  widget.group.id!,
                                                  groupOwners[i].id!,
                                                )
                                                .then((result) {
                                                  LoadingOverlay.hide();
                                                  if (result.isSuccess) {
                                                    CustomSnackbar.success(
                                                      message:
                                                          result.resultValue,
                                                    );
                                                    ref.invalidate(
                                                      getGroupOwnersProvider(
                                                        widget.group.id!,
                                                      ),
                                                    );
                                                  } else {
                                                    CustomSnackbar.error(
                                                      message:
                                                          result.errorMessage,
                                                    );
                                                  }
                                                });
                                          },
                                        );
                                      },
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: groupOwners.length == 1
                                      ? null
                                      : context.colors.primary,
                                ),
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
                                  child: Text('Hubungi'),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
          error: (_, __) => const SizedBox(),
          loading: () => const SizedBox(),
        );
      },
    );
  }

  void _paymentAccountModal({PaymentAccountEntity? account}) {
    final formKey = GlobalKey<FormState>();
    final accountNameController = TextEditingController(
      text: account?.accountName,
    );
    final bankNameController = TextEditingController(text: account?.bankName);
    final bankNumberController = TextEditingController(
      text: account?.bankNumber,
    );

    showAppModalBottomSheet(
      context: context,
      child: Container(
        padding: EdgeInsets.all(context.spacing.md),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tambah Metode Pembayaran',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.title.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colors.primary,
                    ),
                  ),
                  Text(
                    'Masukkan informasi pembayaran grup arisan anda',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.body,
                  ),
                ],
              ),
              SizedBox(height: context.appSize.s16),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: context.spacing.sm,
                  horizontal: context.spacing.md,
                ),
                decoration: BoxDecoration(
                  color: context.colors.accent,
                  borderRadius: BorderRadius.circular(context.radius.medium),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(width: context.spacing.sm),
                    Expanded(
                      child: Text(
                        'Lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
                        style: context.textStyles.body,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.appSize.s16),
              _textField(
                controller: accountNameController,
                label: 'Nama',
                hintText: 'Masukkan nama rekening...',
                required: true,
              ),
              _textField(
                controller: bankNumberController,
                label: 'Nomor Rekening',
                hintText: 'Masukkan nomor rekening...',
                required: true,
              ),
              _textField(
                controller: bankNameController,
                label: 'Bank',
                hintText: 'Masukkan nama bank...',
                required: true,
              ),

              Container(
                margin: EdgeInsets.only(
                  top: context.spacing.lg,
                  bottom: context.spacing.sm,
                ),
                child: Row(
                  spacing: context.spacing.sm,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        // Close modal
                        if (account == null) {
                          Navigator.pop(context);
                          return;
                        }

                        // Delete payment account
                        CustomAlert.show(
                          context,
                          title: 'Hapus Metode Pembayaran',
                          description:
                              'Apakah anda yakin ingin menghapus metode pembayaran ini?',
                          onYes: () {
                            LoadingOverlay.show(context);
                            ref
                                .read(deletePaymentAccountUsecaseProvider)
                                .call(
                                  groupId: widget.group.id!,
                                  accountId: account.id!,
                                )
                                .then((result) {
                                  LoadingOverlay.hide();
                                  if (result.isSuccess) {
                                    Navigator.pop(context);
                                    CustomSnackbar.success(
                                      message: result.resultValue,
                                    );

                                    ref.invalidate(
                                      getGroupDetailProvider(widget.group.id!),
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
                      child: Text(account == null ? 'Batal' : 'Hapus'),
                    ),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          if (!formKey.currentState!.validate()) return;
                          LoadingOverlay.show(context);
                          final PaymentAccountEntity paymentAccount =
                              PaymentAccountEntity(
                                id: account?.id,
                                accountName: accountNameController.text,
                                bankName: bankNameController.text,
                                bankNumber: bankNumberController.text,
                              );

                          LoadingOverlay.show(context);
                          if (account != null) {
                            // Update payment account
                            ref
                                .read(updatePaymentAccountUsecaseProvider)
                                .call(
                                  groupId: widget.group.id!,
                                  account: paymentAccount,
                                )
                                .then((result) {
                                  LoadingOverlay.hide();
                                  if (result.isSuccess) {
                                    Navigator.pop(context);
                                    CustomSnackbar.success(
                                      message: result.resultValue,
                                    );

                                    ref.invalidate(
                                      getGroupDetailProvider(widget.group.id!),
                                    );
                                  } else {
                                    CustomSnackbar.error(
                                      message: result.errorMessage,
                                    );
                                  }
                                });
                          } else {
                            // Create payment account
                            ref
                                .read(addPaymentAccountUsecaseProvider)
                                .call(
                                  groupId: widget.group.id!,
                                  account: paymentAccount,
                                )
                                .then((result) {
                                  LoadingOverlay.hide();
                                  if (result.isSuccess) {
                                    Navigator.pop(context);
                                    CustomSnackbar.success(
                                      message: result.resultValue,
                                    );

                                    ref.invalidate(
                                      getGroupDetailProvider(widget.group.id!),
                                    );
                                  } else {
                                    CustomSnackbar.error(
                                      message: result.errorMessage,
                                    );
                                  }
                                });
                          }
                        },
                        child: Text('Simpan'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField({
    TextEditingController? controller,
    bool required = false,
    required String label,
    required String hintText,
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
              maxLines: 1,
              controller: controller,
              required: required,
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
