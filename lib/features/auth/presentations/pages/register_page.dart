import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../shared/widgets/textfield_primary_widget.dart';
import '../../../../shared/widgets/title_widget.dart';
import '../../../term_conditions/presentations/pages/term_condition_page.dart';
import '../provider/auth_providers.dart';

class RegisterPage extends ConsumerStatefulWidget {
  static const String path = '/register';
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _termConditionChecked = false;

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
                    title: "Daftar",
                    subtitle: "Daftar untuk kelola arisan",
                  ),
                  SizedBox(height: context.appSize.s40),
                  TextFieldPrimaryWidget(
                    controller: _nameController,
                    label: 'Nama',
                    required: true,
                    hintText: 'Masukkan nama lengkap kamu',
                    suffixIcon: Icon(
                      Icons.person_outline,
                      color: context.colors.primary,
                    ),
                  ),
                  TextFieldPrimaryWidget(
                    controller: _emailController,
                    label: 'Email',
                    required: true,
                    hintText: 'Masukkan email kamu',
                    suffixIcon: Icon(
                      Icons.mail_outline,
                      color: context.colors.primary,
                    ),
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return TextFieldPrimaryWidget(
                        controller: _passwordController,
                        label: 'Password',
                        hintText: 'Masukkan password kamu',
                        required: true,
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
                  StatefulBuilder(
                    builder: (context, setState) {
                      return TextFieldPrimaryWidget(
                        controller: _confirmPasswordController,
                        label: 'Konfirmasi Password',
                        hintText: 'Masukkan konfirmasi password kamu',
                        validator: (value) {
                          if ((value ?? '').isEmpty) {
                            return 'Konfirmasi password tidak boleh kosong';
                          }

                          if (value != _passwordController.text) {
                            return 'Konfirmasi password tidak sesuai';
                          }
                          return null;
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                          child: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: context.colors.primary,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: context.appSize.s16),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: _termConditionChecked,
                        onChanged: (value) {
                          setState(() {
                            _termConditionChecked = !_termConditionChecked;
                          });

                          if (!_termConditionChecked) {
                            context.push(TermConditionPage.path);
                          }
                        },
                        title: Text(
                          'Saya menyetujui syarat dan ketentuan aplikasi',
                          style: context.textStyles.body,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: context.appSize.s24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _handleRegister,
                      child: Text('Daftar'),
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
                  SizedBox(height: context.appSize.s8),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Sudah punya akun? ',
                          style: context.textStyles.body,
                          children: [
                            TextSpan(
                              text: 'Login disini',
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

  Future<void> _handleRegister() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_termConditionChecked) {
      CustomSnackbar.error(
        context,
        message: 'Anda harus menyetujui syarat dan ketentuan aplikasi',
        mounted: mounted,
      );
    }

    final usecase = ref.read(registerUserWithEmailPasswordUsecaseProvider);

    LoadingOverlay.show(context);
    await usecase
        .call(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
        )
        .then((result) {
          LoadingOverlay.hide();
          if (result.isSuccess) {
            CustomSnackbar.success(
              context,
              message: result.resultValue,
              mounted: mounted,
            );

            // Redirect after register handled by middleware,
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
