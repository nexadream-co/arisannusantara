import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/string_extensions.dart';
import '../../../core/utils/app_modal_bottom_sheet.dart';
import '../../../shared/widgets/textfield_without_border_widget.dart';
import '../domain/entities/payment_account_entity.dart';

class PaymentAccountWidget extends StatefulWidget {
  final List<PaymentAccountEntity>? initialValue;
  final ValueChanged<List<PaymentAccountEntity>>? onChanged;

  const PaymentAccountWidget({super.key, this.initialValue, this.onChanged});

  @override
  State<PaymentAccountWidget> createState() => _PaymentAccountWidgetState();
}

class _PaymentAccountWidgetState extends State<PaymentAccountWidget> {
  late List<PaymentAccountEntity> _paymentAccounts;

  @override
  void initState() {
    super.initState();
    _paymentAccounts = List.from(widget.initialValue ?? []);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header row
        Row(
          children: [
            Text('Pembayaran', style: context.textStyles.title),
            const Spacer(),
            TextButton.icon(
              onPressed: () => _addPayment(),
              icon: const Icon(Icons.add_circle_outline, size: 16),
              label: Text(
                'Tambah',
                style: context.textStyles.body.copyWith(
                  color: context.colors.primary,
                  fontWeight: FontWeight.bold,
                ),
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
          child: _paymentAccounts.isEmpty
              ? Text(
                  'Belum ada akun pembayaran',
                  textAlign: TextAlign.center,
                  style: context.textStyles.body,
                )
              : Column(
                  spacing: context.spacing.md,
                  children: [
                    for (var i = 0; i < _paymentAccounts.length; i++)
                      Container(
                        padding: i == _paymentAccounts.length - 1
                            ? null
                            : EdgeInsets.only(bottom: context.spacing.md),
                        decoration: i == _paymentAccounts.length - 1
                            ? null
                            : BoxDecoration(
                                border: Border(
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
                                _paymentAccounts[i].accountName?.initials ?? '',
                                style: context.textStyles.body.copyWith(
                                  color: context.colors.primary,
                                ),
                              ),
                            ),
                            SizedBox(width: context.spacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_paymentAccounts[i].bankName} - ${_paymentAccounts[i].accountName}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyles.bodySmall
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: context.spacing.xs),
                                  Text(
                                    _paymentAccounts[i].bankNumber
                                            ?.toString() ??
                                        '-',
                                    style: context.textStyles.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () => _removePayment(i),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: context.spacing.sm,
                                  horizontal: context.spacing.md,
                                ),
                                minimumSize: Size.zero,
                              ),
                              child: const Text('Hapus'),
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

  void _addPayment() {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    final bankController = TextEditingController();

    showAppModalBottomSheet(
      context: context,
      child: StatefulBuilder(
        builder: (context, setModalState) {
          return Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.all(context.spacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
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

                  // Info box
                  Container(
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
                        const Icon(Icons.info_outline),
                        SizedBox(width: context.spacing.sm),
                        Expanded(
                          child: Text(
                            'Pastikan data rekening sudah benar agar tidak terjadi kesalahan transfer.',
                            style: context.textStyles.body,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: context.appSize.s16),

                  // Input fields
                  _textField(
                    context,
                    label: 'Nama',
                    hintText: 'Masukkan nama rekening...',
                    controller: nameController,
                  ),
                  _textField(
                    context,
                    label: 'Nomor Rekening',
                    hintText: 'Masukkan nomor rekening...',
                    controller: numberController,
                  ),
                  _textField(
                    context,
                    label: 'Bank',
                    hintText: 'Masukkan nama bank...',
                    controller: bankController,
                  ),

                  // Buttons
                  Container(
                    margin: EdgeInsets.only(
                      top: context.spacing.lg,
                      bottom: context.spacing.sm,
                    ),
                    child: Row(
                      spacing: context.spacing.sm,
                      children: [
                        OutlinedButton(
                          onPressed: () => Navigator.pop(context),
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
                          child: const Text('Batal'),
                        ),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              if (!formKey.currentState!.validate()) return;
                              final newAccount = PaymentAccountEntity(
                                accountName: nameController.text,
                                bankNumber: numberController.text,
                                bankName: bankController.text,
                              );

                              setState(() {
                                _paymentAccounts.add(newAccount);
                              });

                              widget.onChanged?.call(_paymentAccounts);
                              Navigator.pop(context);
                            },
                            child: const Text('Simpan'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _removePayment(int index) {
    setState(() => _paymentAccounts.removeAt(index));
    widget.onChanged?.call(_paymentAccounts);
  }
}

Widget _textField(
  BuildContext context, {
  required String label,
  required String hintText,
  bool required = true,
  TextEditingController? controller,
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
            label: label,
            required: required,
            hintText: hintText,
            maxLines: 1,
          ),
        ),
      ],
    ),
  );
}
