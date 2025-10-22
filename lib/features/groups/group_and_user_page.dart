import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../core/utils/app_modal_bottom_sheet.dart';
import '../../core/utils/flexible_bottom_sheet.dart';
import '../../shared/widgets/textfield_without_border_widget.dart';
import 'presentations/pages/group_page.dart';

class GroupAndUserPage extends StatefulWidget {
  static const String path = '/superadmin/group-and-user';
  const GroupAndUserPage({super.key});

  @override
  State<GroupAndUserPage> createState() => _GroupAndUserPageState();
}

class _GroupAndUserPageState extends State<GroupAndUserPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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

class _GroupPage extends StatefulWidget {
  const _GroupPage();

  @override
  State<_GroupPage> createState() => __GroupPageState();
}

class __GroupPageState extends State<_GroupPage> {
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
          MasonryGridView.count(
            padding: EdgeInsets.only(top: context.spacing.md),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: context.spacing.md,
            crossAxisSpacing: context.spacing.md,
            itemCount: 20,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.push(GroupPage.path);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.spacing.sm,
                    vertical: context.spacing.md,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colors.surface),
                    borderRadius: BorderRadius.circular(context.radius.medium),
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
                                'AC',
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Arisan Ceria',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.bodySmall.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'KODE GRUP',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Iuran',
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyles.bodySmall
                                        .copyWith(fontSize: 8),
                                  ),
                                  Text(
                                    'Rp12.000',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tanggal Kocok',
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyles.bodySmall
                                        .copyWith(fontSize: 8),
                                  ),
                                  Text(
                                    '12 Oktober 2025',
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
                      if (index % 2 == 0)
                        Container(
                          margin: EdgeInsets.only(top: context.spacing.md),
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: context.spacing.sm,
                              ),
                              minimumSize: Size(0, 0),
                            ),
                            onPressed: () {},
                            child: Text('Lihat Detail'),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _UserPage extends StatefulWidget {
  const _UserPage();

  @override
  State<_UserPage> createState() => __UserPageState();
}

class __UserPageState extends State<_UserPage> {
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
            MasonryGridView.count(
              padding: EdgeInsets.only(top: context.spacing.md),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: context.spacing.md,
              crossAxisSpacing: context.spacing.md,
              itemCount: 20,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _detailMember();
                  },
                  child: Container(
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
                                  'AC',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Agus Hermanto',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyles.bodySmall
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'agushermanto@gmail.com',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyles.bodySmall,
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: context.colors.primary,
        heroTag: 'add-user',
        onPressed: _addMember,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addMember() {
    showFlexibleBottomSheet(
      context: context,
      builder: (scrollController) {
        return SingleChildScrollView(
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
                          'Ardi Sanjaya',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.title.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.colors.primary,
                          ),
                        ),
                        Text(
                          'ardisanjaya@gmail.com',
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
                        borderRadius: BorderRadius.circular(
                          context.radius.medium,
                        ),
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
                      label: 'Nama',
                      hintText: 'Masukkan nama anda...',
                    ),
                    _textField(
                      label: 'Jenis Kelamin',
                      hintText: 'Masukkan jenis kelamin...',
                    ),
                    _textField(label: 'No Telp', hintText: 'No telp anda...'),

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
                      label: 'Password',
                      hintText: 'Masukkan password anda...',
                    ),
                    _textField(
                      label: 'Konfirmasi Password',
                      hintText: 'Masukkan konfirmasi password...',
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
                          controlAffinity: ListTileControlAffinity.leading,
                          value: true,
                          onChanged: (value) {},
                          title: Text('Pengguna'),
                        ),
                        CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          value: false,
                          onChanged: (value) {},
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
                              onPressed: () {},
                              child: Text('Simpan'),
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
        );
      },
    );
  }

  void _detailMember() {
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
                  'Ardi Sanjaya',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.title.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.primary,
                  ),
                ),
                Text(
                  'ardisanjaya@gmail.com',
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

            Text('Infomasi Peserta', style: context.textStyles.title),
            SizedBox(height: context.spacing.md),
            _groupInformationItem('Nama', 'John Doe'),
            _groupInformationItem('Email', 'johndoe@gmail.com'),
            _groupInformationItem('Jenis kelamin', 'Laki-laki'),
            _groupInformationItem('No telp', '45464654'),
            Container(
              margin: EdgeInsets.only(
                top: context.spacing.lg,
                bottom: context.spacing.sm,
              ),
              child: Row(
                spacing: context.spacing.sm,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: context.spacing.md,
                        horizontal: context.spacing.xl,
                      ),
                      foregroundColor: context.colors.error,
                      side: BorderSide(color: context.colors.error, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          context.radius.medium,
                        ),
                      ),
                    ),
                    child: Text('Hapus'),
                  ),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      child: Text('Simpan'),
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

  Widget _textField({required String label, required String hintText}) {
    return Container(
      padding: EdgeInsets.only(bottom: context.spacing.sm),
      margin: EdgeInsets.only(bottom: context.spacing.xs),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.colors.divider)),
      ),
      child: Row(
        spacing: context.spacing.md,
        children: [
          Text(label, style: context.textStyles.body),
          Expanded(
            child: TextfieldWithoutBorderWidget(
              hintText: hintText,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
