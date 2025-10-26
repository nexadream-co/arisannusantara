import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../shared/widgets/divider_widget.dart';
import '../../../../shared/widgets/textfield_primary_widget.dart';
import '../../../../shared/widgets/title_widget.dart';
import '../provider/auth_providers.dart';
import 'forgot_password_page.dart';
import 'register_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  static const String path = '/login';
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

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
        body: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(paddingPage),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(
                    title: "Login",
                    subtitle: "Mulai kelola arisanmu!",
                  ),
                  SizedBox(height: context.appSize.s40),
                  TextFieldPrimaryWidget(
                    controller: _emailController,
                    required: true,
                    label: 'Email',
                    hintText: 'Masukkan email kamu',
                    suffixIcon: Icon(
                      Icons.person_outline,
                      color: context.colors.primary,
                    ),
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return TextFieldPrimaryWidget(
                        controller: _passwordController,
                        label: 'Password',
                        required: true,
                        obscureText: _obscurePassword,
                        hintText: 'Masukkan password kamu',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          child: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: context.colors.primary,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: context.appSize.s8),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _handleLoginEmailPassword,
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(height: context.appSize.s16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: _handleLoginByGoogle,
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
      ),
    );
  }

  Future<void> _handleLoginEmailPassword() async {
    if (!_formKey.currentState!.validate()) return;
    final loginUsecase = ref.read(loginEmailPasswordUsecaseProvider);

    LoadingOverlay.show(context);
    await loginUsecase
        .call(email: _emailController.text, password: _passwordController.text)
        .then((result) {
          LoadingOverlay.hide();
          if (result.isSuccess) {
            CustomSnackbar.success(
              context,
              message: result.resultValue,
              mounted: mounted,
            );

            // Redirect after login handled by middleware,
            // See `middleware()` in `router.dart`
          } else {
            CustomSnackbar.error(
              context,
              message: result.errorMessage,
              mounted: mounted,
            );
          }
        });
  }

  Future<void> _handleLoginByGoogle() async {
    if (!_formKey.currentState!.validate()) return;
    final loginUsecase = ref.read(loginGoogleUsecaseProvider);

    LoadingOverlay.show(context);
    await loginUsecase.call().then((result) {
      LoadingOverlay.hide();
      if (result.isSuccess) {
        CustomSnackbar.success(
          context,
          message: result.resultValue,
          mounted: mounted,
        );

        // Redirect after login handled by middleware,
        // See `middleware()` in `router.dart`
      } else {
        CustomSnackbar.error(
          context,
          message: result.errorMessage,
          mounted: mounted,
        );
      }
    });
  }
}
