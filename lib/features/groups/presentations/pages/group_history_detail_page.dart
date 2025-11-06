import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/number_extensions.dart';
import '../../domain/entities/history_entity.dart';
import '../widgets/history_detail_members_widget.dart';

class GroupHistoryDetailPage extends ConsumerStatefulWidget {
  static const String path = '/group-history-detail';
  final HistoryEntity history;
  const GroupHistoryDetailPage({super.key, required this.history});

  @override
  ConsumerState<GroupHistoryDetailPage> createState() =>
      _GroupHistoryDetailPageState();
}

class _GroupHistoryDetailPageState
    extends ConsumerState<GroupHistoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                        margin: EdgeInsets.symmetric(
                          horizontal: context.spacing.sm,
                        ),
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
                                Icons.download_outlined,
                                color: context.colors.textPrimary,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: Icon(
                                Icons.share_outlined,
                                color: context.colors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: context.appSize.s8),
                    Container(
                      margin: EdgeInsets.only(
                        right: context.spacing.lg,
                        left: context.spacing.lg,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Riwayat Arisan',
                            maxLines: 1,
                            style: context.textStyles.header.copyWith(
                              color: context.colors.primary,
                            ),
                          ),
                          Text(
                            '#${widget.history.group?.code}',
                            maxLines: 1,
                            style: context.textStyles.body,
                          ),
                          SizedBox(height: context.spacing.lg),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.spacing.sm,
                              vertical: context.spacing.md,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                context.radius.medium,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: context.colors.accent,
                                      child: Icon(
                                        Icons.emoji_events_outlined,
                                        color: context.colors.secondary,
                                      ),
                                    ),
                                    SizedBox(width: context.spacing.md),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.history.date?.toIdFullDate ??
                                                '',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: context.textStyles.bodySmall
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: context.spacing.xs),
                                          Text(
                                            'Periode ${widget.history.periodOrder}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: context.textStyles.bodySmall,
                                          ),
                                          SizedBox(height: context.spacing.md),
                                          Row(
                                            spacing: context.spacing.md,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Pemenang',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: context
                                                        .textStyles
                                                        .bodySmall,
                                                  ),
                                                  Text(
                                                    '${(widget.history.winners ?? []).length} Orang',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: context
                                                        .textStyles
                                                        .bodySmall
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: context
                                                              .colors
                                                              .primary,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Iuran',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: context
                                                        .textStyles
                                                        .bodySmall,
                                                  ),
                                                  Text(
                                                    widget.history.group?.dues
                                                            ?.toString() ??
                                                        '-',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: context
                                                        .textStyles
                                                        .bodySmall
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: context
                                                              .colors
                                                              .primary,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.history.reward ?? '',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: context
                                                        .textStyles
                                                        .bodySmall,
                                                  ),
                                                  Text(
                                                    widget
                                                            .history
                                                            .amount
                                                            ?.toIdrWithPrefix ??
                                                        '',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: context
                                                        .textStyles
                                                        .bodySmall
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: context
                                                              .colors
                                                              .primary,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.appSize.s24),
                  ],
                ),
              ),
              HistoryDetailMembersWidget(history: widget.history),
            ],
          ),
        ),
      ),
    );
  }
}
