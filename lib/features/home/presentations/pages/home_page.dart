import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/constants/app_user_role.dart';
import '../../../../config/enums/group_filter.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/number_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/utils/custom_alert.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../../shared/widgets/mobile_scanner_widget.dart';
import '../../../auth/presentations/provider/auth_state_provider.dart';
import '../../../groups/presentations/pages/group_create_page.dart';
import '../../../groups/presentations/pages/group_page.dart';
import '../../../groups/presentations/pages/search_group_page.dart';
import '../../../groups/presentations/providers/get_groups_notifier.dart';
import '../../../groups/presentations/providers/group_providers.dart';
import '../../../invitations/presentations/providers/invitation_providers.dart';
import '../../../notifications/domain/entities/notification_entity.dart';
import '../../../notifications/presentations/providers/notification_providers.dart';
import '../providers/get_paid_groups_percentage_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  static const String path = '/home';
  final Function(int index)? onPageChanged;
  const HomePage({super.key, this.onPageChanged});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  GroupFilter selectedFilter = GroupFilter.joined;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getGroupsProvider.notifier).fetchGroups(filter: selectedFilter);
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
                margin: EdgeInsets.only(bottom: context.spacing.lg),
                width: double.infinity,
                height: context.appSize.s200 + context.appSize.s40,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: context.appSize.s200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(context.assets.textureBg),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: context.spacing.lg,
                                left: context.spacing.lg,
                                bottom: context.appSize.s40,
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
                              margin: EdgeInsets.only(
                                top: context.spacing.lg,
                                right: context.spacing.lg,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: context.spacing.md,
                                vertical: context.spacing.xs,
                              ),
                              decoration: BoxDecoration(
                                color: context.colors.secondary.withValues(
                                  alpha: 0.8,
                                ),
                                borderRadius: BorderRadius.circular(
                                  context.radius.medium,
                                ),
                              ),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    'Cari grup...',
                                    style: context.textStyles.body.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: context.appSize.s16),
                                  Icon(Icons.search, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final percentageAsync = ref.watch(
                          getPaidGroupsPercentageProvider,
                        );
                        return percentageAsync.when(
                          loading: () => const SizedBox(),
                          error: (e, _) => const SizedBox(),
                          data: (percentageResult) {
                            if (percentageResult.isSuccess) {
                              final percentage = percentageResult.resultValue;

                              // You can use the percentage value here if needed
                              return Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: context.spacing.lg,
                                ),
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: double.infinity,
                                  height: context.appSize.s40 * 2,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      context.radius.medium,
                                    ),
                                    boxShadow: [context.shadow.medium],
                                  ),
                                  child: Row(
                                    children: [
                                      Card(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: context.spacing.md,
                                        ),
                                        color: context.colors.surface,
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                            context.spacing.sm,
                                          ),
                                          child: Icon(
                                            Icons.people_outlined,
                                            size: context.appSize.s24,
                                            color: context.colors.primary,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            right: context.spacing.md,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  text: percentage == null
                                                      ? ''
                                                      : '${percentage.toInt()}%, ',
                                                  style: context.textStyles.body
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: context
                                                            .colors
                                                            .primary,
                                                      ),
                                                  children: [
                                                    TextSpan(
                                                      text: percentage == null
                                                          ? 'Anda belum tergabung sebagai peserta'
                                                          : 'Arisan kamu sudah lunas',

                                                      style: context
                                                          .textStyles
                                                          .body
                                                          .copyWith(
                                                            color: context
                                                                .colors
                                                                .primary,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: context.appSize.s8,
                                              ),
                                              LinearProgressIndicator(
                                                backgroundColor:
                                                    context.colors.divider,
                                                color: context.colors.secondary,
                                                minHeight: context.appSize.s8,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      context.radius.medium,
                                                    ),
                                                value: (percentage ?? 0) * 0.01,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                            return const SizedBox();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

              StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    margin: EdgeInsets.only(bottom: context.spacing.lg),
                    height: context.appSize.s40,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing.lg,
                      ),
                      children: GroupFilter.values.map((filter) {
                        final bool isSelected = filter == selectedFilter;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = filter;
                            });

                            ref.read(getGroupsProvider.notifier)
                              ..reset()
                              ..fetchGroups(filter: selectedFilter);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: context.spacing.sm),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: context.spacing.md,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? context.colors.secondary
                                  : Colors.transparent,
                              border: Border.all(
                                color: context.colors.secondary,
                              ),
                              borderRadius: BorderRadius.circular(
                                context.radius.medium,
                              ),
                            ),
                            child: Text(
                              filter.label,
                              style: context.textStyles.body.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.white
                                    : context.colors.secondary,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),

              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(getGroupsProvider);
                  final notifier = ref.read(getGroupsProvider.notifier);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                    title: 'Gabung Grup',
                                    onYesText: 'Ya, Gabung',
                                    description:
                                        'Anda belum bergabung di grup ini. Silakan buat permobohan bergabung terlebih dahulu untuk melihat detail grup.',

                                    onYes: () {
                                      LoadingOverlay.show(context);
                                      ref
                                          .read(createInvitationUsecaseProvider)
                                          .call(groupId: group.id!)
                                          .then((result) {
                                            LoadingOverlay.hide();
                                            if (result.isSuccess) {
                                              if (widget.onPageChanged !=
                                                  null) {
                                                widget.onPageChanged!(1);
                                              }
                                              CustomSnackbar.success(
                                                message: result.resultValue,
                                              );
                                            } else {
                                              CustomSnackbar.error(
                                                message: result.errorMessage,
                                              );
                                            }
                                          });
                                    },
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
                                    if (group.isJoined == true ||
                                        group.isOwned == true)
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
                        Center(
                          child: Text(
                            'Grup tidak ditemukan',
                            style: context.textStyles.body,
                          ),
                        ),

                      if (state.isLoading)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      else if (state.hasMore && state.groups.isNotEmpty)
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                            horizontal: context.spacing.md,
                          ),
                          child: OutlinedButton(
                            onPressed: () => notifier.loadMore(),
                            child: const Text('Muat Lebih Banyak'),
                          ),
                        ),

                      if (state.error != null)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
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
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          final authState = ref.watch(authStateProvider);
          return authState.when(
            loading: () => const SizedBox(),
            error: (_, __) => const SizedBox(),
            data: (user) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                spacing: context.spacing.md,
                children: [
                  if (user?.role == AppUserRole.user)
                    FloatingActionButton(
                      heroTag: "qrcode",
                      backgroundColor: context.colors.primary,
                      child: const Icon(Icons.qr_code_scanner),
                      onPressed: () {
                        context.push(MobileScannerWidget.path).then((code) {
                          if (code != null) {
                            LoadingOverlay.show(context);
                            ref
                                .read(
                                  createInvitationByGroupCodeUsecaseProvider,
                                )
                                .call(code: code as String)
                                .then((result) {
                                  LoadingOverlay.hide();
                                  if (result.isSuccess) {
                                    CustomSnackbar.success(
                                      message: result.resultValue,
                                    );
                                    ref
                                        .read(
                                          getGroupDetailByCodeUsecaseProvider,
                                        )
                                        .call(code)
                                        .then((detailResult) {
                                          if (detailResult.isSuccess &&
                                              (detailResult
                                                          .resultValue
                                                          ?.owners ??
                                                      [])
                                                  .isNotEmpty) {
                                            ref
                                                .read(
                                                  createNotificationsUsecaseProvider,
                                                )
                                                .call(
                                                  userIds: detailResult
                                                      .resultValue!
                                                      .owners!,
                                                  notification: NotificationEntity(
                                                    title:
                                                        'Permintaan Gabung ${detailResult.resultValue?.name}',
                                                    description:
                                                        'Anda menerima permintaan gabung grup dari ${user?.name}',
                                                    type: 'invitation',
                                                    data: detailResult
                                                        .resultValue!
                                                        .toJson(),
                                                  ),
                                                );
                                          }
                                        });
                                    if (widget.onPageChanged != null) {
                                      widget.onPageChanged!(1);
                                    }
                                  } else {
                                    CustomSnackbar.error(
                                      message: result.errorMessage,
                                    );
                                  }
                                });
                          }
                        });
                      },
                    ),
                  if (user?.role == AppUserRole.manager)
                    FloatingActionButton(
                      heroTag: "add-group",
                      backgroundColor: context.colors.primary,
                      child: const Icon(Icons.add),
                      onPressed: () {
                        context.push(GroupCreatePage.path);
                      },
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
