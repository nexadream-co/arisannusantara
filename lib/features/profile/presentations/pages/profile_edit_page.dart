import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/widgets/textfield_primary_widget.dart';
import '../../../../shared/widgets/title_widget.dart';

class ProfileEditPage extends StatefulWidget {
  static const String path = '/profile-edit';
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    final paddingPage = context.spacing.xl;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(context.assets.textureBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actionsPadding: EdgeInsets.only(
            top: context.spacing.md,
            right: paddingPage,
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: context.appSize.s80,
          actions: [
            Image.asset(context.assets.logoFull, height: context.appSize.s56),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            reverse: true,
            padding: EdgeInsets.all(paddingPage),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(
                  title: "Edit Info\nProfil Anda",
                  subtitle:
                      "Perbarui informasi akun\nyang anda gunakan saat ini",
                ),
                SizedBox(height: context.appSize.s40),
                TextFieldPrimaryWidget(
                  margin: EdgeInsets.only(bottom: context.spacing.sm),
                  label: 'Nama',
                  hintText: 'Masukkan nama kamu',
                  suffixIcon: Icon(
                    Icons.person_outline,
                    color: context.colors.primary,
                  ),
                ),
                TextFieldPrimaryWidget(
                  margin: EdgeInsets.only(bottom: context.spacing.sm),
                  label: 'Jenis Kelamin',
                  hintText: 'Laki-laki / Perempuan',
                  suffixIcon: Icon(
                    Icons.person_outline,
                    color: context.colors.primary,
                  ),
                ),
                TextFieldPrimaryWidget(
                  margin: EdgeInsets.only(bottom: context.spacing.sm),
                  label: 'No Telp',
                  hintText: 'Masukkan no telp kamu',
                  suffixIcon: Icon(
                    Icons.person_outline,
                    color: context.colors.primary,
                  ),
                ),
                SizedBox(height: context.appSize.s16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(onPressed: () {}, child: Text('Simpan')),
                ),
                SizedBox(height: context.appSize.s16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('Batal'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
