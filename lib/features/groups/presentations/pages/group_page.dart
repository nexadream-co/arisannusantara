import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/number_extensions.dart';
import '../../../../core/utils/app_modal_bottom_sheet.dart';
import '../../../../core/utils/custom_alert.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../../auth/presentations/provider/auth_state_provider.dart';
import '../../domain/entities/group_entity.dart';
import '../providers/get_group_detail_provider.dart';
import '../providers/get_groups_notifier.dart';
import '../providers/group_providers.dart';
import 'group_detail_page.dart';
import 'group_edit_page.dart';
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
                physics: const AlwaysScrollableScrollPhysics(),
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
    final auth = ref.watch(authStateProvider);
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
                  auth.when(
                    error: (err, _) => const SizedBox(),
                    loading: () => const SizedBox(),
                    data: (user) {
                      if ((group.owners ?? []).contains(user?.id)) {
                        return Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                auth.whenData((user) {
                                  if ((group.owners ?? []).contains(user?.id)) {
                                    context.push(
                                      GroupEditPage.path,
                                      extra: group,
                                    );
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.edit_outlined,
                                color: context.colors.textPrimary,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                CustomAlert.show(
                                  context,
                                  title: 'Hapus Grup',
                                  description:
                                      'Apakah anda yakin ingin menghapus Grup ini?',
                                  onYes: () async {
                                    LoadingOverlay.show(context);
                                    final usecase = ref.read(
                                      deleteGroupUsecaseProvider,
                                    );
                                    usecase.call(group.id!).then((result) {
                                      LoadingOverlay.hide();
                                      if (result.isSuccess) {
                                        CustomSnackbar.success(
                                          message: result.resultValue,
                                        );
                                        ref
                                            .read(getGroupsProvider.notifier)
                                            .refresh();
                                        context.pop();
                                      } else {
                                        CustomSnackbar.error(
                                          message: result.errorMessage,
                                        );
                                      }
                                    });
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.delete_outlined,
                                color: context.colors.textPrimary,
                              ),
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
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
                            '${(group.memberIds ?? []).length} Peserta',
                            style: context.textStyles.bodySmall.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                          SizedBox(width: context.spacing.sm),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                      Consumer(
                        builder: (context, ref, child) {
                          final totalPaidMembers = ref.watch(
                            getTotalGroupPaidAmountProvider(widget.groupId),
                          );
                          return totalPaidMembers.when(
                            loading: () => const SizedBox(),
                            error: (err, _) => const SizedBox(),
                            data: (total) {
                              return Text(
                                ((group.dues ?? 0) * (total.resultValue ?? 0))
                                    .toIdrWithPrefix,
                                style: context.textStyles.header.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.colors.secondary,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showAppModalBottomSheet(
                    context: context,
                    child: Padding(
                      padding: EdgeInsets.all(context.spacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  group.name ?? '',
                                  style: context.textStyles.title,
                                ),
                              ),
                              Text(
                                '#${group.code}',
                                style: context.textStyles.body,
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: context.spacing.lg,
                              left: context.spacing.lg,
                              right: context.spacing.lg,
                              bottom: context.spacing.xl,
                            ),
                            width: double.infinity,
                            child: PrettyQrView.data(data: group.code ?? ''),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () async {
                                final qrCode = QrCode.fromData(
                                  data: group.code ?? '',
                                  errorCorrectLevel: QrErrorCorrectLevel.H,
                                );

                                final qrImage = QrImage(qrCode);
                                ByteData? qrImageBytes = await qrImage
                                    .toImageAsBytes(
                                      size: 512,
                                      decoration: const PrettyQrDecoration(),
                                    );
                                // Convert ByteData → Uint8List
                                final Uint8List pngBytes = qrImageBytes!.buffer
                                    .asUint8List();

                                // Save to temporary file
                                final tempDir = await getTemporaryDirectory();
                                final filePath =
                                    '${tempDir.path}/qrshare${Random().nextInt(100)}.png';
                                final file = File(filePath);
                                await file.writeAsBytes(pngBytes);

                                // Share the file
                                final params = ShareParams(
                                  files: [XFile(file.path)],
                                );

                                final result = await SharePlus.instance.share(
                                  params,
                                );

                                if (result.status ==
                                    ShareResultStatus.dismissed) {
                                  // do something
                                }
                              },
                              child: Text('Bagikan'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: context.spacing.md,
                              bottom: context.spacing.lg,
                            ),
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: Text('Tutup'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.only(right: context.spacing.lg),
                  color: Colors.white,
                  elevation: 0,
                  child: Container(
                    padding: EdgeInsets.all(context.spacing.md),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          width: context.appSize.s80,
                          child: PrettyQrView.data(data: group.code ?? ''),
                        ),

                        Container(
                          margin: EdgeInsets.only(top: context.spacing.md),
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
