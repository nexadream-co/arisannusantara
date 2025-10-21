import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
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
                                  'Agus Hermanto',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.bodySmall.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
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
    );
  }
}
