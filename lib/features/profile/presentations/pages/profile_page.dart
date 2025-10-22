import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/app_modal_bottom_sheet.dart';
import '../../../../core/utils/custom_alert.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../shared/widgets/textfield_without_border_widget.dart';
import '../../../auth/presentations/pages/login_page.dart';
import '../../../faq/presentations/pages/faq_page.dart';
import '../../../privacy_policy/presentations/pages/privacy_policy_page.dart';
import '../../../term_conditions/presentations/pages/term_condition_page.dart';
import 'change_password_page.dart';
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
    return SafeArea(
      bottom: false,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(context.assets.textureBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: context.spacing.lg),
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
                        onTap: () {
                          context.push(ChangePasswordPage.path);
                        },
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
                          onTap: () {
                            _addFeedback();
                          },
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
                          onTap: () {
                            CustomAlert.show(
                              context,
                              title: "Peringatan",
                              description:
                                  "Apakah anda yakin ingin menghapus akun?",
                              onYes: () {
                                CustomSnackbar.show(
                                  context,
                                  title: "Berhasil",
                                  message: "Akun anda berhasil dihapus",
                                  type: SnackbarType.success,
                                );
                              },
                            );
                          },
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
      ),
    );
  }

  void _addFeedback() {
    showAppModalBottomSheet(
      context: context,
      child: Container(
        padding: EdgeInsets.all(context.spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Feedback',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.title.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.primary,
                  ),
                ),
                Text(
                  'Kritik dan masukkan anda',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.body,
                ),
              ],
            ),
            SizedBox(height: context.appSize.s16),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: context.spacing.sm,
                horizontal: context.spacing.md,
              ),
              decoration: BoxDecoration(
                color: context.colors.accent,
                borderRadius: BorderRadius.circular(context.radius.medium),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.info_outline),
                  SizedBox(width: context.spacing.sm),
                  Expanded(
                    child: Text(
                      'Lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
                      style: context.textStyles.body,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.appSize.s16),
            _textField(label: 'Judul', hintText: 'Masukkan judul disini...'),
            SizedBox(height: context.appSize.s8),
            _textField(
              label: 'Feedback',
              minLines: 2,
              hintText: 'Masukkan dan kritik anda...',
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: context.spacing.lg,
                bottom: context.spacing.sm,
              ),
              child: FilledButton(onPressed: () {}, child: Text('Kirim')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField({
    required String label,
    required String hintText,
    int? minLines,
  }) {
    return Container(
      padding: EdgeInsets.only(bottom: context.spacing.sm),
      margin: EdgeInsets.only(bottom: context.spacing.xs),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.colors.divider)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.spacing.md,
        children: [
          Text(label, style: context.textStyles.body),
          Expanded(
            child: TextfieldWithoutBorderWidget(
              hintText: hintText,
              minLines: minLines,
              maxLines: null,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
