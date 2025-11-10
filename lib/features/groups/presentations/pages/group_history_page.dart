import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/number_extensions.dart';
import '../../domain/entities/group_entity.dart';
import '../providers/group_providers.dart';
import 'group_history_detail_page.dart';

class GroupHistoryPage extends ConsumerStatefulWidget {
  final GroupEntity group;
  const GroupHistoryPage({super.key, required this.group});

  @override
  ConsumerState<GroupHistoryPage> createState() => _GroupHistoryPageState();
}

class _GroupHistoryPageState extends ConsumerState<GroupHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_groupHistories()],
        ),
      ),
    );
  }

  Widget _groupHistories() {
    return Consumer(
      builder: (context, ref, child) {
        final provider = ref.watch(getHistoriesProvider(widget.group.id!));

        return provider.when(
          loading: () => SizedBox(
            width: double.infinity,
            child: Text(
              'Mohon tunggu...',
              textAlign: TextAlign.center,
              style: context.textStyles.body.copyWith(
                color: context.colors.primary,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          error: (err, stack) => Text(
            'Terjadi kesalahan, mohon coba kembali',
            style: context.textStyles.body.copyWith(
              color: context.colors.primary,
              fontStyle: FontStyle.italic,
            ),
          ),
          data: (result) {
            if (result.isFailed) return const SizedBox();
            final histories = result.resultValue ?? [];

            return Container(
              margin: EdgeInsets.only(bottom: context.spacing.md),
              child: Column(
                spacing: context.spacing.md,
                children: [
                  if (histories.isEmpty)
                    Container(
                      margin: EdgeInsets.only(bottom: context.spacing.md),
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
                              'Belum ada riwayat',
                              style: context.textStyles.body,
                            ),
                          ),
                        ],
                      ),
                    ),
                  for (int i = 0; i < histories.length; i++)
                    GestureDetector(
                      onTap: () {
                        context.push(GroupHistoryDetailPage.path);
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
                                CircleAvatar(
                                  backgroundColor: context.colors.accent,
                                  child: Icon(
                                    Icons.emoji_events_outlined,
                                    color: context.colors.secondary,
                                  ),
                                ),
                                SizedBox(width: context.spacing.sm),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        histories[i].date?.toIdFullDate ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: context.textStyles.bodySmall
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      SizedBox(height: context.spacing.xs),
                                      Text(
                                        'Periode ${histories.length - i}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: context.textStyles.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    context.push(
                                      GroupHistoryDetailPage.path,
                                      extra: histories[i].copyWith(
                                        periodOrder: histories.length - i,
                                      ),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      vertical: context.spacing.sm,
                                    ),
                                    minimumSize: Size(0, 0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.spacing.md,
                                    ),
                                    child: Text('Lihat detail'),
                                  ),
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
                                          'Pemenang',
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textStyles.bodySmall,
                                        ),
                                        Text(
                                          '${(histories[i].winners ?? []).length} Orang',
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textStyles.bodySmall
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
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
                                          histories[i].reward ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textStyles.bodySmall,
                                        ),
                                        Text(
                                          histories[i]
                                                  .amount
                                                  ?.toIdrWithPrefix ??
                                              '',
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textStyles.bodySmall
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: context.colors.primary,
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
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
