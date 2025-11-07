import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../domain/entities/group_entity.dart';
import '../providers/get_group_detail_provider.dart';
import 'group_detail_page.dart';
import 'group_history_page.dart';
import 'group_member_page.dart';

class GroupPage extends ConsumerStatefulWidget {
  static const String path = '/group';
  final String groupId;
  const GroupPage({super.key, required this.groupId});

  @override
  ConsumerState<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends ConsumerState<GroupPage> {
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    final groupDetail = ref.watch(getGroupDetailProvider(widget.groupId));
    return groupDetail.when(
      loading: () => Scaffold(body: Center(child: LoadingIconAnimation())),
      error: (err, _) => Scaffold(body: Center(child: LoadingIconAnimation())),
      data: (result) {
        if (result.isFailed) {
          return Scaffold(body: Center(child: LoadingIconAnimation()));
        }

        final group = result.resultValue!;

        return DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              bottom: false,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverToBoxAdapter(child: _buildHeaderInfo(group)),
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
                            Tab(text: 'Detail Grup'),
                            Tab(text: 'Peserta'),
                            Tab(text: 'Riwayat'),
                          ],
                        ),
                      ),
                    ),
                  ];
                },

                body: TabBarView(
                  children: [
                    GroupDetailPage(group: group),
                    GroupMemberPage(group: group),
                    GroupHistoryPage(group: group),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Your "detail info" section below AppBar
  Widget _buildHeaderInfo(GroupEntity group) {
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
                        group.name ?? '',
                        maxLines: 1,
                        style: context.textStyles.header.copyWith(
                          color: context.colors.primary,
                        ),
                      ),
                      Text(
                        '#${group.code}',
                        maxLines: 1,
                        style: context.textStyles.body,
                      ),
                      SizedBox(height: context.spacing.lg),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                group.description ?? '',
                                maxLines: showMore ? null : 3,
                                overflow: showMore
                                    ? null
                                    : TextOverflow.ellipsis,
                                style: context.textStyles.bodySmall.copyWith(
                                  color: context.colors.textSecondary,
                                ),
                              ),
                              SizedBox(height: context.spacing.xs),
                              GestureDetector(
                                onTap: () {
                                  setState(() => showMore = !showMore);
                                },
                                child: Text(
                                  showMore ? 'Sembunyikan' : 'Lihat lebih',
                                  style: context.textStyles.bodySmall.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.shuffle,
                                color: context.colors.primary,
                              ),
                              Text(
                                group.periodsDate?.toIdDate ?? '',
                                style: context.textStyles.bodySmall.copyWith(
                                  color: context.colors.textSecondary,
                                ),
                              ),
                            ],
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
