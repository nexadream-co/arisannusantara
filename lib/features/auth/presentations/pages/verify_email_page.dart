import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../shared/widgets/title_widget.dart';
import '../provider/auth_providers.dart';

class VerifyEmailPage extends ConsumerStatefulWidget {
  static const String path = '/verify-email';
  const VerifyEmailPage({super.key});

  @override
  ConsumerState<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends ConsumerState<VerifyEmailPage> {
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
                  title: "Verifikasi\nEmail Anda",
                  subtitle:
                      "Kami telah mengirimkan email verifikasi ke email anda,\nLihat di folder spam jika tidak ada di inbox",
                ),
                SizedBox(height: context.appSize.s40),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _sendEmailVerification,
                    child: Text('Kirim Ulang'),
                  ),
                ),
                SizedBox(height: context.appSize.s16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: _logout,
                    child: Text('Keluar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _logout() async {
    final usecase = ref.read(logoutUsecaseProvider);

    LoadingOverlay.show(context);
    await usecase.call().then((result) {
      LoadingOverlay.hide();
      if (result.isSuccess) {
        CustomSnackbar.success(
          context,
          message: result.resultValue,
          mounted: mounted,
        );

        // Redirect after logout handled by middleware,
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

  Future<void> _sendEmailVerification() async {
    final usecase = ref.read(sendEmailVerificationUsecaseProvider);

    LoadingOverlay.show(context);
    await usecase.call().then((result) {
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
