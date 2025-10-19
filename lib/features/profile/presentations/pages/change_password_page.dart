import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/widgets/textfield_primary_widget.dart';
import '../../../../shared/widgets/title_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  static const String path = '/change-password';
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
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
                  title: "Ubah\nPassword",
                  subtitle: "Ubah password anda sekarang\ndengan mudah",
                ),
                SizedBox(height: context.appSize.s40),
                TextFieldPrimaryWidget(
                  margin: EdgeInsets.only(bottom: context.spacing.sm),
                  label: 'Password lama',
                  hintText: 'Masukkan password lama kamu',
                  suffixIcon: Icon(
                    Icons.visibility_outlined,
                    color: context.colors.primary,
                  ),
                ),
                TextFieldPrimaryWidget(
                  margin: EdgeInsets.only(bottom: context.spacing.sm),
                  label: 'Password baru',
                  hintText: 'Masukkan password baru kamu',
                  suffixIcon: Icon(
                    Icons.visibility_outlined,
                    color: context.colors.primary,
                  ),
                ),
                TextFieldPrimaryWidget(
                  margin: EdgeInsets.only(bottom: context.spacing.sm),
                  label: 'Konfirmasi password baru',
                  hintText: 'Masukkan konfirmasi password baru kamu',
                  suffixIcon: Icon(
                    Icons.visibility_outlined,
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
