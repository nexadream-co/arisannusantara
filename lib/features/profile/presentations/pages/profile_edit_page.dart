import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../shared/widgets/dropdown_primary_widget.dart';
import '../../../../shared/widgets/textfield_primary_widget.dart';
import '../../../../shared/widgets/title_widget.dart';
import '../../../auth/presentations/provider/auth_state_provider.dart';
import '../providers/profile_providers.dart';

class ProfileEditPage extends ConsumerStatefulWidget {
  static const String path = '/profile-edit';
  const ProfileEditPage({super.key});

  @override
  ConsumerState<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends ConsumerState<ProfileEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _telpController = TextEditingController();
  String? _gender;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authStateAsync = ref.read(authStateProvider);
      authStateAsync.when(
        data: (user) {
          if (user != null) {
            _nameController.text = user.name ?? '';
            _telpController.text = user.phoneNumber ?? '';
            _gender = user.gender;
          }
        },
        error: (_, __) => null,
        loading: () => null,
      );
    });
  }

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
                    title: "Edit Info\nProfil Anda",
                    subtitle:
                        "Perbarui informasi akun\nyang anda gunakan saat ini",
                  ),
                  SizedBox(height: context.appSize.s40),
                  TextFieldPrimaryWidget(
                    controller: _nameController,
                    margin: EdgeInsets.only(bottom: context.spacing.sm),
                    label: 'Nama',
                    hintText: 'Masukkan nama kamu',
                    required: true,
                    suffixIcon: Icon(
                      Icons.person_outline,
                      color: context.colors.primary,
                    ),
                  ),
                  DropdownPrimaryWidget<String>(
                    value: _gender,
                    margin: EdgeInsets.only(bottom: context.spacing.sm),
                    label: 'Jenis Kelamin',
                    hintText: 'Laki-laki / Perempuan',
                    required: true,
                    items: [
                      DropdownMenuItem(
                        value: 'male',
                        child: Text(
                          'Laki-laki',
                          style: context.textStyles.body,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'female',
                        child: Text(
                          'Perempuan',
                          style: context.textStyles.body,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      _gender = value!;
                    },
                  ),
                  TextFieldPrimaryWidget(
                    controller: _telpController,
                    margin: EdgeInsets.only(bottom: context.spacing.sm),
                    label: 'No Telp',
                    hintText: 'Masukkan no telp kamu',
                    required: true,
                    suffixIcon: Icon(
                      Icons.call_outlined,
                      color: context.colors.primary,
                    ),
                  ),
                  SizedBox(height: context.appSize.s16),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        LoadingOverlay.show(context);
                        ref
                            .read(editProfileUsecaseProvider)
                            .call(
                              name: _nameController.text,
                              phoneNumber: _telpController.text,
                              gender: _gender!,
                            )
                            .then((result) {
                              LoadingOverlay.hide();
                              if (result.isSuccess) {
                                CustomSnackbar.success(
                                  message: result.resultValue,
                                );
                                ref.invalidate(authStateProvider);
                              } else {
                                CustomSnackbar.error(
                                  message: result.resultValue,
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
