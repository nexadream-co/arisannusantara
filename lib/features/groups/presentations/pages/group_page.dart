import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';

class GroupPage extends StatefulWidget {
  static const String path = '/group';
  const GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                      indicatorColor: context.colors.secondary,
                      dividerColor: context.colors.divider,
                      labelStyle: context.textStyles.body,
                      tabs: [
                        Tab(text: 'Detail Grup'),
                        Tab(text: 'Peserta'),
                        Tab(text: 'Riwayat'),
                      ],
                    ),
                  ),
                ),
              ];
            },

            body: const TabBarView(
              children: [
                _TabContent(title: 'Overview Content'),
                _TabContent(title: 'Gallery Content'),
                _TabContent(title: 'Reviews Content'),
              ],
            ),
          ),
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: context.spacing.md,
          children: [
            FloatingActionButton(
              heroTag: "shuffle",
              backgroundColor: context.colors.primary,
              child: const Icon(Icons.shuffle),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  // Your "detail info" section below AppBar
  Widget _buildHeaderInfo() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(context.assets.textureBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: context.spacing.sm),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: context.colors.textPrimary,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      color: context.colors.textPrimary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.delete_outlined,
                      color: context.colors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: context.appSize.s8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    right: context.spacing.lg,
                    left: context.spacing.lg,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Hai, John Doe',
                        maxLines: 1,
                        style: context.textStyles.header.copyWith(
                          color: context.colors.primary,
                        ),
                      ),
                      Text(
                        'johndoe@gmail.com',
                        maxLines: 1,
                        style: context.textStyles.body,
                      ),
                      SizedBox(height: context.spacing.lg),
                      Text(
                        'Lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.bodySmall.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                      SizedBox(height: context.spacing.xs),
                      Text(
                        'Lihat lebih',
                        style: context.textStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: context.spacing.sm),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.person_outlined,
                            color: context.colors.primary,
                          ),
                          Text(
                            '20 Peserta',
                            style: context.textStyles.bodySmall.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                          SizedBox(width: context.spacing.sm),
                          Icon(Icons.shuffle, color: context.colors.primary),
                          Text(
                            '16 Oktober 2023',
                            style: context.textStyles.bodySmall.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                          SizedBox(width: context.spacing.sm),
                        ],
                      ),

                      SizedBox(height: context.spacing.md),
                      Text(
                        'Saldo Arisan',
                        style: context.textStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rp 1.000.000',
                        style: context.textStyles.header.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.only(right: context.spacing.lg),
                color: Colors.white,
                elevation: 0,
                child: Container(
                  padding: EdgeInsets.all(context.spacing.md),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Icon(Icons.qr_code, size: context.appSize.s80),

                      Container(
                        margin: EdgeInsets.only(top: context.spacing.sm),
                        padding: EdgeInsets.symmetric(
                          horizontal: context.spacing.md,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: context.colors.primary),
                          borderRadius: BorderRadius.circular(
                            context.radius.medium,
                          ),
                        ),
                        child: Text(
                          'Bagikan',
                          style: context.textStyles.body.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.colors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: context.appSize.s24),
        ],
      ),
    );
  }
}

class _TabContent extends StatelessWidget {
  final String title;
  const _TabContent({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 30,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: context.spacing.md),
          title: Text('$title #$index'),
        ),
      ),
    );
  }
}

/// 👇 This delegate makes the TabBar "stick" to the top
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
