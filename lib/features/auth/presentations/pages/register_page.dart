import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/widgets/textfield_primary_widget.dart';
import '../../../../shared/widgets/title_widget.dart';
import '../../../term_conditions/presentations/pages/term_condition_page.dart';

class RegisterPage extends StatefulWidget {
  static const String path = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        body: Center(
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
                  label: 'Nama',
                  hintText: 'Masukkan nama lengkap kamu',
                  suffixIcon: Icon(
                    Icons.person_outline,
                    color: context.colors.primary,
                  ),
                ),
                TextFieldPrimaryWidget(
                  label: 'Email',
                  hintText: 'Masukkan email kamu',
                  suffixIcon: Icon(
                    Icons.mail_outline,
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
                TextFieldPrimaryWidget(
                  label: 'Konfirmasi Password',
                  hintText: 'Masukkan konfirmasi password kamu',
                  suffixIcon: Icon(
                    Icons.visibility_outlined,
                    color: context.colors.primary,
                  ),
                ),
                SizedBox(height: context.appSize.s16),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  value: true,
                  onChanged: (value) {
                    context.push(TermConditionPage.path);
                  },
                  title: Text(
                    'Saya menyetujui syarat dan ketentuan aplikasi',
                    style: context.textStyles.body,
                  ),
                ),
                SizedBox(height: context.appSize.s24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(onPressed: () {}, child: Text('Daftar')),
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
    );
  }
}
