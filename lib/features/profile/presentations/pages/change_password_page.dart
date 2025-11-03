import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../shared/widgets/textfield_primary_widget.dart';
import '../../../../shared/widgets/title_widget.dart';
import '../providers/profile_providers.dart';

class ChangePasswordPage extends ConsumerStatefulWidget {
  static const String path = '/change-password';
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPaswordController = TextEditingController();
  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

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
        body: Form(
          key: _formKey,
          child: Container(
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
                  StatefulBuilder(
                    builder: (context, setState) {
                      return TextFieldPrimaryWidget(
                        controller: _currentPasswordController,
                        margin: EdgeInsets.only(bottom: context.spacing.sm),
                        label: 'Password lama',
                        hintText: 'Masukkan password lama kamu',
                        required: true,
                        obscureText: _obscureCurrentPassword,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureCurrentPassword =
                                  !_obscureCurrentPassword;
                            });
                          },
                          child: Icon(
                            _obscureCurrentPassword
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
                        controller: _newPasswordController,
                        margin: EdgeInsets.only(bottom: context.spacing.sm),
                        label: 'Password baru',
                        hintText: 'Masukkan password baru kamu',
                        required: true,
                        obscureText: _obscureNewPassword,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureNewPassword = !_obscureNewPassword;
                            });
                          },
                          child: Icon(
                            _obscureNewPassword
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
                        controller: _confirmPaswordController,
                        margin: EdgeInsets.only(bottom: context.spacing.sm),
                        label: 'Konfirmasi password baru',
                        required: true,
                        hintText: 'Masukkan konfirmasi password baru kamu',
                        obscureText: _obscureConfirmPassword,
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
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        LoadingOverlay.show(context);
                        ref
                            .read(updatePasswordUsecaseProvider)
                            .call(
                              currentPassword: _currentPasswordController.text,
                              newPassword: _newPasswordController.text,
                              confirmPassword: _confirmPaswordController.text,
                            )
                            .then((result) {
                              LoadingOverlay.hide();
                              if (result.isSuccess) {
                                CustomSnackbar.success(
                                  message: result.resultValue,
                                );
                                context.pop();
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
      ),
    );
  }
}
