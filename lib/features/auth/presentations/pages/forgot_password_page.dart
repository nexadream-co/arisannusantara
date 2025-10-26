import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../shared/widgets/textfield_primary_widget.dart';
import '../../../../shared/widgets/title_widget.dart';
import '../provider/auth_providers.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  static const String path = '/forgot-password';
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

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
                    title: "Lupa\nPassword",
                    subtitle:
                        "Kami akan mengirimkan tautan ganti\npassword pada email kamu",
                  ),
                  SizedBox(height: context.appSize.s40),
                  TextFieldPrimaryWidget(
                    controller: _emailController,
                    required: true,
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
                      onPressed: _sendPasswordResetEmail,
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
      ),
    );
  }

  Future<void> _sendPasswordResetEmail() async {
    if (!_formKey.currentState!.validate()) return;
    final usecase = ref.read(sendPasswordResetEmailUsecaseProvider);

    LoadingOverlay.show(context);
    await usecase.call(_emailController.text).then((result) {
      LoadingOverlay.hide();
      if (result.isSuccess) {
        CustomSnackbar.success(
          context,
          message: result.resultValue,
          mounted: mounted,
        );
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
