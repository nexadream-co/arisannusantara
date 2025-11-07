import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../shared/widgets/datefield_without_border_widget.dart';
import '../../../../shared/widgets/dropdown_without_border_widget.dart';
import '../../../../shared/widgets/textfield_without_border_widget.dart';
import '../../domain/entities/group_entity.dart';
import '../../domain/entities/payment_account_entity.dart';
import '../payment_account_widget.dart';
import '../providers/get_groups_notifier.dart';
import '../providers/group_providers.dart';

class GroupCreatePage extends ConsumerStatefulWidget {
  static const String path = '/group/create';
  const GroupCreatePage({super.key});

  @override
  ConsumerState<GroupCreatePage> createState() => _GroupCreatePageState();
}

class _GroupCreatePageState extends ConsumerState<GroupCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _duesController = TextEditingController();
  final _rewardController = TextEditingController();
  final _targetController = TextEditingController();
  final _maxWinnerController = TextEditingController(text: '1');
  final _adminFeeController = TextEditingController();
  String _period = 'weekly';
  DateTime _periodDate = DateTime.now();
  List<PaymentAccountEntity> _paymentAccounts = [];
  bool _termConditionAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(context.assets.textureBg),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
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
                      SizedBox(height: context.appSize.s8),
                      Container(
                        margin: EdgeInsets.only(
                          right: context.spacing.lg,
                          left: context.spacing.lg,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Tambah Grup',
                              maxLines: 1,
                              style: context.textStyles.header.copyWith(
                                color: context.colors.primary,
                              ),
                            ),
                            Text(
                              'Masukkan informasi grup arisan anda',
                              maxLines: 1,
                              style: context.textStyles.body,
                            ),
                            SizedBox(height: context.spacing.md),
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
                          ],
                        ),
                      ),
                      SizedBox(height: context.appSize.s8),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(context.spacing.lg),
                  child: Column(
                    spacing: context.spacing.md,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Infomasi Grup', style: context.textStyles.title),
                      _textField(
                        controller: _nameController,
                        required: true,
                        label: "Nama grup",
                        hintText: 'Masukkan nama grup...',
                      ),
                      _textField(
                        controller: _descController,
                        required: true,
                        maxLines: null,
                        label: "Deskripsi grup",
                        hintText: 'Masukkan deskripsi grup...',
                      ),
                      SizedBox(height: context.spacing.lg),
                      Text('Infomasi Arisan', style: context.textStyles.title),
                      _textField(
                        controller: _duesController,
                        required: true,
                        keyboardType: TextInputType.number,
                        label: "Iuran",
                        hintText: 'Masukkan jumlah iuran...',
                      ),
                      _textField(
                        controller: _targetController,
                        label: "Target",
                        required: true,
                        keyboardType: TextInputType.number,
                        hintText: 'Masukkan target arisan...',
                      ),
                      _textField(
                        controller: _rewardController,
                        label: "Hadiah",
                        required: true,
                        hintText: 'Contoh: Uang Tunai, Kulkas...',
                      ),
                      _dropdownPeriodField(
                        label: "Periode",
                        hintText: 'Masukkan periode arisan...',
                      ),
                      _textField(
                        controller: _maxWinnerController,
                        required: true,
                        keyboardType: TextInputType.number,
                        label: "Maksimal pemenang",
                        hintText: 'Tentukan maksimal pemenang...',
                      ),
                      _dateFieldShuffle(
                        label: "Tanggal kocok",
                        required: true,
                        hintText: 'Tanggal kocok arisan...',
                      ),
                      _textField(
                        controller: _adminFeeController,
                        required: true,
                        keyboardType: TextInputType.number,
                        label: "Biaya admin",
                        hintText: 'Masukkan biaya admin...',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.spacing.lg),
                  child: Column(
                    children: [
                      PaymentAccountWidget(
                        initialValue: _paymentAccounts,
                        onChanged: (value) {
                          _paymentAccounts = value;
                        },
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _termConditionAccepted,
                            onChanged: (value) {
                              setState(() => _termConditionAccepted = value!);
                            },
                            title: Text(
                              'Saya menyetujui syarat dan ketentuan aplikasi',
                              style: context.textStyles.body.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: context.appSize.s24),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;
                            if (!_termConditionAccepted) {
                              CustomSnackbar.error(
                                message:
                                    'Silahkan setujui syarat dan ketentuan aplikasi',
                              );
                              return;
                            }

                            LoadingOverlay.show(context);
                            ref
                                .read(createGroupUsecaseProvider)
                                .call(
                                  GroupEntity(
                                    name: _nameController.text,
                                    description: _descController.text,
                                    dues: double.tryParse(_duesController.text),
                                    target: double.tryParse(
                                      _targetController.text,
                                    ),
                                    reward: _rewardController.text,
                                    periodsType: _period,
                                    periodsDate: _periodDate,
                                    maxWinner: int.tryParse(
                                      _maxWinnerController.text,
                                    ),
                                    adminFee: double.tryParse(
                                      _adminFeeController.text,
                                    ),
                                    paymentAccounts: _paymentAccounts,
                                  ),
                                )
                                .then((result) {
                                  LoadingOverlay.hide();
                                  if (result.isSuccess) {
                                    CustomSnackbar.success(
                                      message: result.resultValue,
                                    );
                                    context.pop();

                                    ref
                                        .read(getGroupsProvider.notifier)
                                        .refresh();
                                  } else {
                                    CustomSnackbar.error(
                                      message: result.errorMessage,
                                    );
                                  }
                                });
                          },
                          child: Text('Simpan'),
                        ),
                      ),
                      SizedBox(height: context.appSize.s24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField({
    required String label,
    required String hintText,
    bool required = false,
    TextEditingController? controller,
    TextInputType? keyboardType,
    int? maxLines = 1,
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
              keyboardType: keyboardType,
              maxLines: maxLines,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dateFieldShuffle({
    required String label,
    required String hintText,
    bool required = false,
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
            child: DateFieldWithoutBorderWidget(
              initialValue: _periodDate,
              label: label,
              required: required,
              hintText: hintText,
              onChanged: (value) {
                _periodDate = value!;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _dropdownPeriodField({
    required String label,
    required String hintText,
    bool required = false,
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
            child: DropdownWithoutBorderWidget(
              value: _period,
              label: label,
              required: required,
              hintText: hintText,
              items: [
                DropdownMenuItem(
                  value: 'weekly',
                  child: Text('Mingguan', style: context.textStyles.body),
                ),
                DropdownMenuItem(
                  value: 'monthly',
                  child: Text('Bulanan', style: context.textStyles.body),
                ),
                DropdownMenuItem(
                  value: 'yearly',
                  child: Text('Tahunan', style: context.textStyles.body),
                ),
              ],
              onChanged: (value) {
                _period = value!;
              },
            ),
          ),
        ],
      ),
    );
  }
}
