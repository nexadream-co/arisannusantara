import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../auth/presentations/pages/login_page.dart';
import '../../../faq/presentations/pages/faq_page.dart';
import '../../../privacy_policy/presentations/pages/privacy_policy_page.dart';
import '../../../term_conditions/presentations/pages/term_condition_page.dart';
import 'profile_edit_page.dart';

class ProfilePage extends StatefulWidget {
  static const String path = '/profile';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(context.assets.textureBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                bottom: false,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: context.spacing.lg),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Profil',
                              maxLines: 1,
                              style: context.textStyles.header,
                            ),
                            Text(
                              'Pengaturan Profil',
                              maxLines: 1,
                              style: context.textStyles.body,
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info_outlined,
                        color: context.colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.appSize.s24),
              SizedBox(
                width: context.appSize.s124,
                height: context.appSize.s124,
                child: Stack(
                  children: [
                    SizedBox(
                      width: context.appSize.s124,
                      height: context.appSize.s124,
                      child: CircleAvatar(
                        backgroundColor: context.colors.accent,
                        child: Icon(
                          Icons.person_outline,
                          size: context.appSize.s64,
                          color: context.colors.secondary,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.spacing.md,
                          vertical: context.spacing.xs,
                        ),
                        decoration: BoxDecoration(
                          color: context.colors.secondary,
                          borderRadius: BorderRadius.circular(
                            context.radius.medium,
                          ),
                        ),
                        child: Text(
                          'Pengguna',
                          style: context.textStyles.body.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.appSize.s16),
              Text(
                'Rudi Aldo',
                style: context.textStyles.body.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('rudialdo@gmail.com', style: context.textStyles.body),
              SizedBox(height: context.appSize.s24),
              Container(
                margin: EdgeInsets.only(
                  left: context.spacing.lg,
                  right: context.spacing.lg,
                  bottom: context.spacing.lg,
                ),
                padding: EdgeInsets.only(
                  left: context.spacing.lg,
                  top: context.spacing.lg,
                  right: context.spacing.lg,
                  bottom: context.spacing.md,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.radius.medium),
                  boxShadow: [context.shadow.medium],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Akun',
                      style: context.textStyles.title.copyWith(
                        color: context.colors.secondary,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: context.colors.divider),
                        ),
                      ),
                      child: ListTile(
                        onTap: () {
                          context.push(ProfileEditPage.path);
                        },
                        title: Text('Edit Profil'),
                        subtitle: Text(
                          'Informasi akun anda',
                          style: context.textStyles.body.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Ubah Password'),
                      subtitle: Text(
                        'Perbarui password anda',
                        style: context.textStyles.body.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: context.colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: context.spacing.lg,
                  right: context.spacing.lg,
                  bottom: context.spacing.lg,
                ),
                padding: EdgeInsets.only(
                  left: context.spacing.lg,
                  top: context.spacing.lg,
                  right: context.spacing.lg,
                  bottom: context.spacing.md,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.radius.medium),
                  boxShadow: [context.shadow.medium],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lainnya',
                      style: context.textStyles.title.copyWith(
                        color: context.colors.secondary,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: context.colors.divider),
                        ),
                      ),
                      child: ListTile(
                        onTap: () {
                          context.push(PrivacyPolicyPage.path);
                        },
                        title: Text('Kebijakan Privasi'),
                        subtitle: Text(
                          'Kebijakan privasi aplikasi',
                          style: context.textStyles.body.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: context.colors.divider),
                        ),
                      ),
                      child: ListTile(
                        onTap: () {
                          context.push(TermConditionPage.path);
                        },
                        title: Text('Syarat dan Ketentuan'),
                        subtitle: Text(
                          'Ketentuan aplikasi yang harus di sepakati',
                          style: context.textStyles.body.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: context.colors.divider),
                        ),
                      ),
                      child: ListTile(
                        onTap: () {
                          context.push(FaqPage.path);
                        },
                        title: Text('FAQ'),
                        subtitle: Text(
                          'Pertanyaan yang sering ditanyakan',
                          style: context.textStyles.body.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: context.colors.divider),
                        ),
                      ),
                      child: ListTile(
                        title: Text('Feedback'),
                        subtitle: Text(
                          'Kritik dan masukan anda',
                          style: context.textStyles.body.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: context.colors.divider),
                        ),
                      ),
                      child: ListTile(
                        title: Text('Hapus Akun'),
                        subtitle: Text(
                          'Semua data akun ini akan dihapus',
                          style: context.textStyles.body.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right,
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Versi Aplikasi'),
                      subtitle: Text(
                        'Pastikan anda install versi terbaru',
                        style: context.textStyles.body.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                      trailing: Text(
                        '1.1.2 (32)',
                        style: context.textStyles.body,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: context.spacing.lg,
                  right: context.spacing.lg,
                  bottom: context.spacing.lg,
                ),
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    context.go(LoginPage.path);
                  },
                  child: Text('Keluar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
