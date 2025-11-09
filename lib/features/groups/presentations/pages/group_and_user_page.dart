import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../config/constants/app_user_role.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/number_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/utils/app_modal_bottom_sheet.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/debouncer.dart';
import '../../../../core/utils/flexible_bottom_sheet.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../shared/widgets/textfield_without_border_widget.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../../users/presentations/providers/get_users_notifier.dart';
import '../../../users/presentations/providers/user_providers.dart';
import '../providers/get_groups_notifier.dart';
import 'group_page.dart';

class GroupAndUserPage extends StatefulWidget {
  static const String path = '/superadmin/group-and-user';
  final int selectedIndex;
  const GroupAndUserPage({super.key, this.selectedIndex = 0});

  @override
  State<GroupAndUserPage> createState() => _GroupAndUserPageState();
}

class _GroupAndUserPageState extends State<GroupAndUserPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.selectedIndex,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(child: _buildHeaderInfo()),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyTabBarDelegate(
                    TabBar(
                      labelColor: context.colors.secondary,
                      unselectedLabelColor: context.colors.textSecondary,
                      unselectedLabelStyle: context.textStyles.body,
                      indicatorColor: context.colors.secondary,
                      dividerColor: context.colors.divider,
                      labelStyle: context.textStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: [
                        Tab(text: 'Grup Arisan'),
                        Tab(text: 'Pengguna'),
                      ],
                    ),
                  ),
                ),
              ];
            },

            body: const TabBarView(children: [_GroupPage(), _UserPage()]),
          ),
        ),
      ),
    );
  }

  // Your "detail info" section below AppBar
  Widget _buildHeaderInfo() {
    return Container(
      padding: EdgeInsets.all(context.spacing.lg),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(context.assets.textureBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Grup dan Pengguna',
            maxLines: 1,
            style: context.textStyles.header,
          ),
          Text(
            'Semua grup dan pengguna aplikasi',
            maxLines: 1,
            style: context.textStyles.body,
          ),
        ],
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  _StickyTabBarDelegate(this._tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: _tabBar);
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _StickyTabBarDelegate oldDelegate) {
    return false;
  }
}

class _GroupPage extends ConsumerStatefulWidget {
  const _GroupPage();

  @override
  ConsumerState<_GroupPage> createState() => __GroupPageState();
}

class __GroupPageState extends ConsumerState<_GroupPage> {
  final _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refresh();
    });
  }

  void _refresh() {
    ref.read(getGroupsProvider.notifier).reset();
    ref
        .read(getGroupsProvider.notifier)
        .fetchGroups(search: _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.radius.medium),
      borderSide: BorderSide.none,
    );
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.spacing.lg),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(context.radius.medium),
            ),
            child: TextFormField(
              controller: _searchController,
              onChanged: (value) {
                _debouncer.run(() {
                  _refresh();
                });
              },
              decoration: InputDecoration(
                hintText: "Cari grup...",
                hintStyle: context.textStyles.subtitle,
                fillColor: context.colors.surface,
                filled: true,
                enabledBorder: border,
                focusedBorder: border,
                border: border,
                suffixIcon: Icon(
                  Icons.search,
                  color: context.colors.textPrimary,
                ),
              ),
            ),
          ),

          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(getGroupsProvider);
              final notifier = ref.read(getGroupsProvider.notifier);
              return Column(
                children: [
                  if (state.groups.isNotEmpty)
                    MasonryGridView.count(
                      padding: EdgeInsets.only(
                        top: context.spacing.lg,
                        bottom: context.spacing.lg,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: context.spacing.md,
                      crossAxisSpacing: context.spacing.md,
                      itemCount: state.groups.length,
                      itemBuilder: (context, index) {
                        final group = state.groups[index];

                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.spacing.sm,
                            vertical: context.spacing.md,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: context.colors.surface),
                            borderRadius: BorderRadius.circular(
                              context.radius.medium,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: context.appSize.s32,
                                    height: context.appSize.s32,
                                    child: CircleAvatar(
                                      backgroundColor: context.colors.surface,
                                      child: Text(
                                        group.name?.initials ?? 'A',
                                        style: context.textStyles.body.copyWith(
                                          color: context.colors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: context.spacing.sm),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          group.name ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textStyles.bodySmall
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          group.code ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textStyles.bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: context.colors.textPrimary,
                                  ),
                                ],
                              ),
                              SizedBox(height: context.appSize.s16),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: context.spacing.sm,
                                  right: context.spacing.sm,
                                ),
                                child: Row(
                                  spacing: context.spacing.xs,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Iuran',
                                            overflow: TextOverflow.ellipsis,
                                            style: context.textStyles.bodySmall
                                                .copyWith(fontSize: 8),
                                          ),
                                          Text(
                                            group.dues?.toIdrWithPrefix ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            style: context.textStyles.bodySmall
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 8,
                                                  color: context.colors.primary,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tanggal Kocok',
                                            overflow: TextOverflow.ellipsis,
                                            style: context.textStyles.bodySmall
                                                .copyWith(fontSize: 8),
                                          ),
                                          Text(
                                            group.periodsDate?.toIdDate ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            style: context.textStyles.bodySmall
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 8,
                                                  color: context.colors.primary,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: context.spacing.md,
                                ),
                                width: double.infinity,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      vertical: context.spacing.sm,
                                    ),
                                    minimumSize: Size(0, 0),
                                  ),
                                  onPressed: () {
                                    context.push(
                                      GroupPage.path,
                                      extra: group.id,
                                    );
                                  },
                                  child: Text('Lihat Detail'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  if (state.groups.isEmpty && !state.isLoading)
                    Container(
                      margin: EdgeInsets.only(top: context.spacing.lg),
                      alignment: Alignment.center,
                      child: Text(
                        'Grup tidak ditemukan',
                        style: context.textStyles.body,
                      ),
                    ),

                  if (state.isLoading)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(context.spacing.lg),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (state.hasMore && state.groups.isNotEmpty)
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () =>
                            notifier.loadMore(search: _searchController.text),
                        child: const Text('Muat Lebih Banyak'),
                      ),
                    ),

                  if (state.error != null)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(context.spacing.md),
                        child: Text(
                          state.error!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _UserPage extends ConsumerStatefulWidget {
  const _UserPage();

  @override
  ConsumerState<_UserPage> createState() => __UserPageState();
}

class __UserPageState extends ConsumerState<_UserPage> {
  final _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refresh();
    });
  }

  void _refresh() {
    ref.read(getUsersProvider.notifier).reset();
    ref
        .read(getUsersProvider.notifier)
        .fetchUsers(search: _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.radius.medium),
      borderSide: BorderSide.none,
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.spacing.lg),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.radius.medium),
              ),
              child: TextFormField(
                controller: _searchController,
                onChanged: (value) {
                  _debouncer.run(() {
                    _refresh();
                  });
                },
                decoration: InputDecoration(
                  hintText: "Cari pengguna...",
                  hintStyle: context.textStyles.subtitle,
                  fillColor: context.colors.surface,
                  filled: true,
                  enabledBorder: border,
                  focusedBorder: border,
                  border: border,
                  suffixIcon: Icon(
                    Icons.search,
                    color: context.colors.textPrimary,
                  ),
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(getUsersProvider);
                final notifier = ref.read(getUsersProvider.notifier);
                return Column(
                  children: [
                    if (state.users.isNotEmpty)
                      MasonryGridView.count(
                        padding: EdgeInsets.only(
                          top: context.spacing.lg,
                          bottom: context.spacing.lg,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: context.spacing.md,
                        crossAxisSpacing: context.spacing.md,
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          final user = state.users[index];
                          return GestureDetector(
                            onTap: () {
                              _detailMember(user);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.spacing.sm,
                                vertical: context.spacing.md,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: context.colors.surface,
                                ),
                                borderRadius: BorderRadius.circular(
                                  context.radius.medium,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: context.appSize.s32,
                                        height: context.appSize.s32,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              context.colors.surface,
                                          child: Text(
                                            user.name?.initials ?? '',
                                            style: context.textStyles.body
                                                .copyWith(
                                                  color: context.colors.primary,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: context.spacing.sm),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              user.name ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: context
                                                  .textStyles
                                                  .bodySmall
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Text(
                                              user.email ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  context.textStyles.bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                    if (state.users.isEmpty && state.isLoading == false)
                      Container(
                        margin: EdgeInsets.only(top: context.spacing.lg),
                        alignment: Alignment.center,
                        child: Text(
                          'Pengguna tidak ditemukan',
                          style: context.textStyles.body,
                        ),
                      ),

                    if (state.isLoading == true)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(context.spacing.lg),
                          child: CircularProgressIndicator(),
                        ),
                      )
                    else if (state.hasMore && state.users.isNotEmpty)
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () =>
                              notifier.loadMore(search: _searchController.text),
                          child: const Text('Muat Lebih Banyak'),
                        ),
                      ),

                    if (state.error != null)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(context.spacing.md),
                          child: Text(
                            state.error!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: context.colors.primary,
        heroTag: 'add-user',
        onPressed: _addUser,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addUser() {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneNumberController = TextEditingController();
    final passwordController = TextEditingController();
    String role = 'user';
    showFlexibleBottomSheet(
      initialSize: 0.72,
      context: context,
      builder: (scrollController) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(context.spacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tambah pengguna',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.textStyles.title.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.colors.primary,
                                ),
                              ),
                              Text(
                                'Masukkan data pengguna baru',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.textStyles.body,
                              ),
                            ],
                          ),
                          SizedBox(height: context.appSize.s16),
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: context.spacing.md,
                            ),
                            child: Text(
                              'Infomasi Peserta',
                              style: context.textStyles.body.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _textField(
                            controller: nameController,
                            required: true,
                            label: 'Nama',
                            hintText: 'Masukkan nama pengguna...',
                          ),
                          _textField(
                            controller: emailController,
                            required: true,
                            label: 'Email',
                            hintText: 'Masukkan email pengguna...',
                          ),
                          _textField(
                            controller: phoneNumberController,
                            label: 'No Telp',
                            hintText: 'No telp pengguna...',
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: context.spacing.md,
                            ),
                            child: Text(
                              'Kredensial',
                              style: context.textStyles.body.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _textField(
                            controller: passwordController,
                            required: true,
                            label: 'Password',
                            hintText: 'Masukkan password pengguna...',
                          ),

                          Container(
                            margin: EdgeInsets.only(
                              top: context.spacing.lg,
                              bottom: context.spacing.sm,
                            ),
                            child: Text(
                              'Role',
                              style: context.textStyles.body.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          GridView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 5,
                                ),
                            children: [
                              CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: role == AppUserRole.user,
                                onChanged: (value) {
                                  setState(() => role = AppUserRole.user);
                                },
                                title: Text('Pengguna (Peserta)'),
                              ),
                              CheckboxListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: role == AppUserRole.manager,
                                onChanged: (value) {
                                  setState(() => role = AppUserRole.manager);
                                },
                                title: Text('Pengelola'),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: context.spacing.xxl,
                              bottom: context.spacing.sm,
                            ),
                            child: Row(
                              spacing: context.spacing.sm,
                              children: [
                                Expanded(
                                  child: FilledButton(
                                    onPressed: () {
                                      if (!formKey.currentState!.validate()) {
                                        return;
                                      }

                                      LoadingOverlay.show(context);
                                      ref
                                          .read(createUserUsecaseProvider)
                                          .call(
                                            name: nameController.text,
                                            email: emailController.text,
                                            phoneNumber:
                                                phoneNumberController.text,
                                            password: passwordController.text,
                                            role: role,
                                            confirmPassword:
                                                passwordController.text,
                                          )
                                          .then((result) {
                                            LoadingOverlay.hide();
                                            if (result.isSuccess) {
                                              CustomSnackbar.success(
                                                message: result.resultValue,
                                              );
                                              _refresh();
                                              Navigator.pop(context);
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
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: context.spacing.sm),
                            child: Row(
                              spacing: context.spacing.sm,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('Batal'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _detailMember(UserEntity user) {
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
                  user.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.title.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.primary,
                  ),
                ),
                Text(
                  user.email ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.body,
                ),
              ],
            ),
            SizedBox(height: context.appSize.s16),

            Text('Infomasi Pengguna', style: context.textStyles.title),
            SizedBox(height: context.spacing.md),
            _groupInformationItem('Nama', user.name ?? '-'),
            _groupInformationItem('Email', user.email ?? '-'),
            _groupInformationItem(
              'Jenis kelamin',
              user.gender?.toGenderId() ?? '-',
            ),
            _groupInformationItem('No telp', user.phoneNumber ?? '-'),
            _groupInformationItem(
              'Dibuat pada',
              user.createdAt?.toIdDate ?? '-',
            ),
            Container(
              margin: EdgeInsets.only(
                top: context.spacing.lg,
                bottom: context.spacing.sm,
              ),
              child: Row(
                spacing: context.spacing.sm,
                children: [
                  // OutlinedButton(
                  //   onPressed: () {

                  //   },
                  //   style: OutlinedButton.styleFrom(
                  //     padding: EdgeInsets.symmetric(
                  //       vertical: context.spacing.md,
                  //       horizontal: context.spacing.xl,
                  //     ),
                  //     foregroundColor: context.colors.error,
                  //     side: BorderSide(color: context.colors.error, width: 1.5),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(
                  //         context.radius.medium,
                  //       ),
                  //     ),
                  //   ),
                  //   child: Text('Hapus'),
                  // ),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Tutup'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _groupInformationItem(String label, String value) {
    return Container(
      padding: EdgeInsets.only(bottom: context.spacing.sm),
      margin: EdgeInsets.only(bottom: context.spacing.sm),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.colors.divider)),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label, style: context.textStyles.body)),
          Text(
            value,
            style: context.textStyles.body.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField({
    TextEditingController? controller,
    bool required = false,
    required String label,
    required String hintText,
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
          Expanded(flex: 1, child: Text(label, style: context.textStyles.body)),
          Expanded(
            flex: 2,
            child: TextfieldWithoutBorderWidget(
              controller: controller,
              required: required,
              maxLines: 1,
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }
}
