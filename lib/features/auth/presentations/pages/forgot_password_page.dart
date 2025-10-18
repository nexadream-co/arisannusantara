import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/widgets/textfield_primary_widget.dart';
import '../../../../shared/widgets/title_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String path = '/forgot-page';
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                  title: "Lupa\nPassword",
                  subtitle:
                      "Kami akan mengirimkan tautan ganti\npassword pada email kamu",
                ),
                SizedBox(height: context.appSize.s40),
                TextFieldPrimaryWidget(
                  label: 'Email anda',
                  hintText: 'Masukkan email kamu',
                  suffixIcon: Icon(
                    Icons.mail_outline,
                    color: context.colors.primary,
                  ),
                ),
                SizedBox(height: context.appSize.s8),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {},
                    child: Text('Kirim Permintaan'),
                  ),
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
