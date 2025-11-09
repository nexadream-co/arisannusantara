import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/enums/group_filter.dart';
import '../../../../config/enums/period_filter.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/number_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/utils/custom_alert.dart';
import '../../../auth/presentations/provider/auth_state_provider.dart';
import '../../../groups/presentations/pages/group_page.dart';
import '../../../groups/presentations/pages/search_group_page.dart';
import '../../../groups/presentations/providers/get_groups_notifier.dart';
import '../../../users/presentations/providers/get_users_notifier.dart';
import '../providers/home_providers.dart';

class SuperadminHomePage extends ConsumerStatefulWidget {
  static const String path = '/superadmin/home';
  final Function(int index, int userGroupPageIndex)? onChangePage;
  const SuperadminHomePage({super.key, this.onChangePage});

  @override
  ConsumerState<SuperadminHomePage> createState() => _SuperadminHomePageState();
}

class _SuperadminHomePageState extends ConsumerState<SuperadminHomePage> {
  GroupFilter selectedFilter = GroupFilter.all;
  PeriodFilter periodFilter = PeriodFilter.thisMonth;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(getGroupsProvider.notifier).fetchGroups(filter: selectedFilter);
      ref.read(getUsersProvider.notifier).fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  // top: context.spacing.lg,
                  bottom: context.spacing.lg,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(context.assets.textureBg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: context.spacing.lg,
                              left: context.spacing.lg,
                            ),
                            child: Consumer(
                              builder: (context, ref, child) {
                                final authStateAsync = ref.watch(
                                  authStateProvider,
                                );

                                return authStateAsync.when(
                                  loading: () =>
                                      const CircularProgressIndicator(),
                                  error: (e, _) => const SizedBox(),
                                  data: (user) {
                                    if (user == null) return const SizedBox();
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            bottom: context.spacing.sm,
                                          ),
                                          width: context.appSize.s48,
                                          height: context.appSize.s48,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                context.colors.accent,
                                            backgroundImage:
                                                user.photoUrl != null
                                                ? CachedNetworkImageProvider(
                                                    user.photoUrl!,
                                                  )
                                                : null,
                                            child: user.photoUrl == null
                                                ? Icon(
                                                    Icons.person_outline,
                                                    size: context.appSize.s32,
                                                    color: context
                                                        .colors
                                                        .secondary,
                                                  )
                                                : null,
                                          ),
                                        ),
                                        Text(
                                          'Hai, ${user.name}',
                                          maxLines: 1,
                                          style: context.textStyles.title,
                                        ),
                                        Text(
                                          '${user.email}',
                                          maxLines: 1,
                                          style: context.textStyles.body,
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.push(SearchGroupPage.path);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: context.spacing.lg),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                context.radius.medium,
                              ),
                            ),
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                return SizedBox(
                                  width: context.appSize.s124,
                                  child: DropdownButtonFormField<PeriodFilter>(
                                    initialValue: periodFilter,
                                    isExpanded: false,
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 2,
                                      ),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        value: PeriodFilter.thisMonth,
                                        child: Text(
                                          'Bulan ini',
                                          style: context.textStyles.body
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: PeriodFilter.threeMonthsAgo,
                                        child: Text(
                                          '3 Bulan lalu',
                                          style: context.textStyles.body
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: PeriodFilter.sixMonthsAgo,
                                        child: Text(
                                          '6 Bulan lalu',
                                          style: context.textStyles.body
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: PeriodFilter.oneYearAgo,
                                        child: Text(
                                          'Tahun Ini',
                                          style: context.textStyles.body
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() => periodFilter = value!);
                                      ref.invalidate(
                                        getTotalFeedbacksProvider(periodFilter),
                                      );
                                      ref.invalidate(
                                        getTotalGroupsProvider(periodFilter),
                                      );
                                      ref.invalidate(
                                        getTotalUsersProvider(periodFilter),
                                      );
                                      ref.invalidate(
                                        getTotalShuffleProvider(periodFilter),
                                      );
                                      this.setState(() {});
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: context.spacing.lg,
                        right: context.spacing.lg,
                        top: context.spacing.lg,
                        bottom: context.spacing.md,
                      ),
                      child: Row(
                        spacing: context.spacing.md,
                        children: [
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, child) {
                                final provider = ref.watch(
                                  getTotalGroupsProvider(periodFilter),
                                );
                                return _statisticItem(
                                  context,
                                  label: 'Total Grup',
                                  value: provider.when(
                                    data: (result) =>
                                        (result.resultValue ?? 0).toIdrFormat,
                                    error: (_, __) => '-',
                                    loading: () => '',
                                  ),
                                  icon: Icons.people_outline,
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, child) {
                                final provider = ref.watch(
                                  getTotalUsersProvider(periodFilter),
                                );
                                return _statisticItem(
                                  context,
                                  label: 'Total Pengguna',
                                  value: provider.when(
                                    data: (result) =>
                                        (result.resultValue ?? 0).toIdrFormat,
                                    error: (_, __) => '-',
                                    loading: () => '',
                                  ),
                                  icon: Icons.person_outline,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: context.spacing.lg,
                        right: context.spacing.lg,
                      ),
                      child: Row(
                        spacing: context.spacing.md,
                        children: [
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, child) {
                                final provider = ref.watch(
                                  getTotalFeedbacksProvider(periodFilter),
                                );
                                return _statisticItem(
                                  context,
                                  label: 'Total Feedback',
                                  value: provider.when(
                                    data: (result) =>
                                        (result.resultValue ?? 0).toIdrFormat,
                                    error: (_, __) => '-',
                                    loading: () => '',
                                  ),
                                  icon: Icons.chat_outlined,
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: Consumer(
                              builder: (context, ref, child) {
                                final provider = ref.watch(
                                  getTotalShuffleProvider(periodFilter),
                                );
                                return _statisticItem(
                                  context,
                                  label: 'Total Kocok',
                                  value: provider.when(
                                    data: (result) =>
                                        (result.resultValue ?? 0).toIdrFormat,
                                    error: (_, __) => '-',
                                    loading: () => '',
                                  ),
                                  icon: Icons.shuffle,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(getGroupsProvider);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!state.isLoading)
                        Padding(
                          padding: EdgeInsets.only(
                            left: context.spacing.lg,
                            right: context.spacing.lg,
                            top: context.spacing.lg,
                            bottom: context.spacing.md,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Grup Terbaru',
                                style: context.textStyles.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  if (widget.onChangePage != null) {
                                    widget.onChangePage!(1, 0);
                                  }
                                },
                                child: Text(
                                  'Selengkapnya',
                                  style: context.textStyles.body.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.colors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (state.groups.isNotEmpty)
                        MasonryGridView.count(
                          padding: EdgeInsets.only(
                            top: 0,
                            left: context.spacing.lg,
                            right: context.spacing.lg,
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

                            return GestureDetector(
                              onTap: () {
                                if (group.isJoined == true ||
                                    group.isOwned == true) {
                                  context.push(GroupPage.path, extra: group.id);
                                } else {
                                  CustomAlert.show(
                                    context,
                                    title: 'Info Grup',
                                    description:
                                        'Anda belum bergabung di grup ini. Silakan bergabung terlebih dahulu untuk melihat detail grup.',
                                  );
                                }
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
                                              group.name?.initials ?? 'A',
                                              style: context.textStyles.body
                                                  .copyWith(
                                                    color:
                                                        context.colors.primary,
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
                                                style: context
                                                    .textStyles
                                                    .bodySmall
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              Text(
                                                group.code ?? '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: context
                                                    .textStyles
                                                    .bodySmall,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: context
                                                      .textStyles
                                                      .bodySmall
                                                      .copyWith(fontSize: 8),
                                                ),
                                                Text(
                                                  group.dues?.toIdrWithPrefix ??
                                                      '',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: context
                                                      .textStyles
                                                      .bodySmall
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 8,
                                                        color: context
                                                            .colors
                                                            .primary,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: context
                                                      .textStyles
                                                      .bodySmall
                                                      .copyWith(fontSize: 8),
                                                ),
                                                Text(
                                                  group.periodsDate?.toIdDate ??
                                                      '',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: context
                                                      .textStyles
                                                      .bodySmall
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 8,
                                                        color: context
                                                            .colors
                                                            .primary,
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
                              ),
                            );
                          },
                        ),

                      if (state.groups.isEmpty && !state.isLoading)
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            bottom: context.spacing.xl,
                            left: context.spacing.lg,
                            right: context.spacing.lg,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: context.spacing.md,
                            vertical: context.spacing.md,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [context.shadow.small],
                            borderRadius: BorderRadius.circular(
                              context.radius.medium,
                            ),
                          ),
                          child: Column(
                            spacing: context.spacing.md,
                            children: [
                              Text(
                                'Belum ada grup',
                                textAlign: TextAlign.center,
                                style: context.textStyles.body,
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),

              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(getUsersProvider);

                  return Column(
                    children: [
                      if (state.isLoading == false)
                        Padding(
                          padding: EdgeInsets.only(
                            left: context.spacing.lg,
                            right: context.spacing.lg,
                            bottom: context.spacing.md,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Pengguna Terbaru',
                                style: context.textStyles.body.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  if (widget.onChangePage != null) {
                                    widget.onChangePage!(1, 1);
                                  }
                                },
                                child: Text(
                                  'Selengkapnya',
                                  style: context.textStyles.body.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.colors.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (state.users.isNotEmpty)
                        MasonryGridView.count(
                          padding: EdgeInsets.only(
                            left: context.spacing.lg,
                            right: context.spacing.lg,
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
                                context.push(GroupPage.path);
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
                                                    color:
                                                        context.colors.primary,
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              Text(
                                                user.email ?? '',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: context
                                                    .textStyles
                                                    .bodySmall,
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
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            bottom: context.spacing.xl,
                            left: context.spacing.lg,
                            right: context.spacing.lg,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: context.spacing.md,
                            vertical: context.spacing.md,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [context.shadow.small],
                            borderRadius: BorderRadius.circular(
                              context.radius.medium,
                            ),
                          ),
                          child: Column(
                            spacing: context.spacing.md,
                            children: [
                              Text(
                                'Belum ada pengguna',
                                textAlign: TextAlign.center,
                                style: context.textStyles.body,
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _statisticItem(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Row(
      spacing: context.spacing.md,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: context.spacing.sm),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(context.radius.medium),
              boxShadow: [context.shadow.medium],
            ),
            child: Row(
              children: [
                Card(
                  margin: EdgeInsets.symmetric(horizontal: context.spacing.md),
                  color: context.colors.surface,
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(context.spacing.sm),
                    child: Icon(
                      icon,
                      size: context.appSize.s24,
                      color: context.colors.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: context.spacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          label,
                          maxLines: 1,
                          style: context.textStyles.bodySmall.copyWith(
                            fontSize: 8,
                          ),
                        ),
                        Text(value, style: context.textStyles.title),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
