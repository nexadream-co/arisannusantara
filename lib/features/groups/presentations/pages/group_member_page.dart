import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/app_modal_bottom_sheet.dart';
import '../../../../shared/widgets/textfield_without_border_widget.dart';

class GroupMemberPage extends StatefulWidget {
  const GroupMemberPage({super.key});

  @override
  State<GroupMemberPage> createState() => _GroupMemberPageState();
}

class _GroupMemberPageState extends State<GroupMemberPage> {
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

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: context.spacing.md,
        children: [
          FloatingActionButton(
            heroTag: "add-member",
            backgroundColor: context.colors.primary,
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _groupMember() {
    return Container(
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
          for (var i = 0; i < 10; i++)
            Container(
              padding: EdgeInsets.only(bottom: context.spacing.md),
              decoration: BoxDecoration(
                border: i == 2
                    ? null
                    : Border(bottom: BorderSide(color: context.colors.divider)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: context.colors.surface,
                    child: Text(
                      'AC',
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
                          'Ardi Sanjaya',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: context.spacing.xs),
                        Text(
                          'ardisanjaya@gmail.com',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _editMember();
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
                      child: Text('Sudah Bayar'),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _editMember() {
    showAppModalBottomSheet(
      context: context,
      child: Container(
        padding: EdgeInsets.all(context.spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ardi Sanjaya',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.title.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colors.primary,
                        ),
                      ),
                      Text(
                        'ardisanjaya@gmail.com',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.body,
                      ),
                    ],
                  ),
                ),
                Text('Status', style: context.textStyles.body),
                StatefulBuilder(
                  builder: (context, setState) {
                    String? selectedStatus = 'Aktif';

                    return SizedBox(
                      width: context.appSize.s100,
                      child: DropdownButtonFormField<String>(
                        initialValue: selectedStatus,
                        isExpanded: false,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'Aktif',
                            child: Text(
                              'Aktif',
                              style: context.textStyles.body.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.colors.success,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Tidak Aktif',
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
                          setState(() => selectedStatus = value);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: context.spacing.md),
              child: Text(
                'Infomasi Peserta',
                style: context.textStyles.body.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _textField(label: 'Nama', hintText: 'Masukkan nama anda...'),
            _textField(
              label: 'Jenis Kelamin',
              hintText: 'Masukkan jenis kelamin...',
            ),
            _textField(label: 'No Telp', hintText: 'No telp anda...'),

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
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 5,
              ),
              children: [
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: true,
                  onChanged: (value) {},
                  title: Text('Belum Bayar'),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: false,
                  onChanged: (value) {},
                  title: Text('Lunas'),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: false,
                  onChanged: (value) {},
                  title: Text('Sudah bayar'),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: false,
                  onChanged: (value) {},
                  title: Text('Lewati'),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: context.spacing.xxl,
                bottom: context.spacing.sm,
              ),
              child: Row(
                spacing: context.spacing.sm,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: context.spacing.md,
                        horizontal: context.spacing.xl,
                      ),
                      foregroundColor: context.colors.error,
                      side: BorderSide(color: context.colors.error, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          context.radius.medium,
                        ),
                      ),
                    ),
                    child: Text('Hapus'),
                  ),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      child: Text('Simpan'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField({required String label, required String hintText}) {
    return Container(
      padding: EdgeInsets.only(bottom: context.spacing.sm),
      margin: EdgeInsets.only(bottom: context.spacing.xs),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.colors.divider)),
      ),
      child: Row(
        spacing: context.spacing.md,
        children: [
          Text(label, style: context.textStyles.body),
          Expanded(
            child: TextfieldWithoutBorderWidget(
              hintText: hintText,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
