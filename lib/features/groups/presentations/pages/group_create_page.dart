import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/widgets/textfield_without_border_widget.dart';

class GroupCreatePage extends StatefulWidget {
  static const String path = '/group/create';
  const GroupCreatePage({super.key});

  @override
  State<GroupCreatePage> createState() => _GroupCreatePageState();
}

class _GroupCreatePageState extends State<GroupCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
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
                      label: "Nama grup",
                      hintText: 'Masukkan nama grup...',
                    ),
                    _textField(
                      label: "Deskripsi grup",
                      hintText: 'Masukkan deskripsi grup...',
                    ),
                    SizedBox(height: context.spacing.lg),
                    Text('Infomasi Arisan', style: context.textStyles.title),
                    _textField(
                      label: "Iuran",
                      hintText: 'Masukkan jumlah iuran...',
                    ),
                    _textField(
                      label: "Target",
                      hintText: 'Masukkan target arisan...',
                    ),
                    _textField(
                      label: "Periode",
                      hintText: 'Masukkan periode arisan...',
                    ),
                    _textField(
                      label: "Maksimal pemenang",
                      hintText: 'Tentukan maksimal pemenang...',
                    ),
                    _textField(
                      label: "Tanggal kocok",
                      hintText: 'Tanggal kocok arisan...',
                    ),
                    _textField(
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
                    Row(
                      children: [
                        Text('Pembayaran', style: context.textStyles.title),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
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
                    _groupPayment(),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: true,
                      onChanged: (value) {},
                      title: Text(
                        'Saya menyetujui syarat dan ketentuan aplikasi',
                        style: context.textStyles.body,
                      ),
                    ),
                    SizedBox(height: context.appSize.s24),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          context.pop();
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

  Widget _groupPayment() {
    return Container(
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
          for (var i = 0; i < 3; i++)
            Container(
              padding: i == 2
                  ? null
                  : EdgeInsets.only(bottom: context.spacing.md),
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
                          'BCA - Yasmin Arhan',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: context.spacing.xs),
                        Text(
                          '3445466565',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
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
    );
  }
}
