import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/layouts/superadmin_layout.dart';
import '../../../../core/layouts/user_layout.dart';
import '../../../../shared/widgets/divider_widget.dart';
import '../../../../shared/widgets/textfield_primary_widget.dart';
import '../../../../shared/widgets/title_widget.dart';
import 'forgot_password_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  static const String path = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          toolbarHeight: context.appSize.s80,
          actions: [
            Image.asset(context.assets.logoFull, height: context.appSize.s56),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(paddingPage),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWidget(title: "Login", subtitle: "Mulai kelola arisanmu!"),
                SizedBox(height: context.appSize.s40),
                TextFieldPrimaryWidget(
                  label: 'Email',
                  hintText: 'Masukkan email kamu',
                  suffixIcon: Icon(
                    Icons.person_outline,
                    color: context.colors.primary,
                  ),
                ),
                TextFieldPrimaryWidget(
                  label: 'Password',
                  hintText: 'Masukkan password kamu',
                  suffixIcon: Icon(
                    Icons.visibility_outlined,
                    color: context.colors.primary,
                  ),
                ),
                SizedBox(height: context.appSize.s8),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      context.go(UserLayout.path);
                    },
                    child: Text('Login'),
                  ),
                ),
                SizedBox(height: context.appSize.s16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      context.go(SuperadminLayout.path);
                    },
                    child: Text('Login Dengan Google'),
                  ),
                ),
                SizedBox(height: context.appSize.s24),
                DividerWidget(text: 'Atau'),
                SizedBox(height: context.appSize.s24),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      context.push(RegisterPage.path);
                    },
                    child: Text('Daftar'),
                  ),
                ),
                SizedBox(height: context.appSize.s8),
                Center(
                  child: TextButton(
                    onPressed: () {
                      context.push(ForgotPasswordPage.path);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Lupa password? ',
                        style: context.textStyles.body,
                        children: [
                          TextSpan(
                            text: 'Klik disini',
                            style: context.textStyles.body.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
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
