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
import '../providers/get_group_detail_provider.dart';
import '../providers/group_providers.dart';

class GroupEditPage extends ConsumerStatefulWidget {
  final GroupEntity group;
  static const String path = '/group/edit';
  const GroupEditPage({super.key, required this.group});

  @override
  ConsumerState<GroupEditPage> createState() => _GroupEditPageState();
}

class _GroupEditPageState extends ConsumerState<GroupEditPage> {
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

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.group.name ?? '';
    _descController.text = widget.group.description ?? '';
    _duesController.text = widget.group.dues?.toInt().toString() ?? '';
    _rewardController.text = widget.group.reward ?? '';
    _targetController.text = widget.group.target?.toInt().toString() ?? '';
    _maxWinnerController.text = widget.group.maxWinner?.toString() ?? '';
    _adminFeeController.text = widget.group.adminFee?.toInt().toString() ?? '';
    _period = widget.group.periodsType ?? 'weekly';
    _periodDate = widget.group.periodsDate ?? DateTime.now();
  }

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
                              'Edit Grup',
                              maxLines: 1,
                              style: context.textStyles.header.copyWith(
                                color: context.colors.primary,
                              ),
                            ),
                            Text(
                              'Ubah informasi grup arisan anda',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.info_outline),
                                  SizedBox(width: context.spacing.sm),
                                  Expanded(
                                    child: Text(
                                      'Informasi grup arisan akan terlihat pada halaman grup. Anda dapat mengubahnya kapan saja.',
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
                      SizedBox(height: context.appSize.s24),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            if (!_formKey.currentState!.validate()) return;

                            LoadingOverlay.show(context);
                            ref
                                .read(updateGroupUsecaseProvider)
                                .call(
                                  GroupEntity(
                                    id: widget.group.id,
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
                                  ),
                                )
                                .then((result) {
                                  LoadingOverlay.hide();
                                  if (result.isSuccess) {
                                    CustomSnackbar.success(
                                      message: result.resultValue,
                                    );
                                    context.pop();

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
