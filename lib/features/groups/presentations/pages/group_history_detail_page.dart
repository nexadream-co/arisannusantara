import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../config/enums/payment_status_enum.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/number_extensions.dart';
import '../../../../core/utils/download_arisan_history_excel.dart';
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
                                downloadHistoryExcel(widget.history);
                              },
                              icon: Icon(
                                Icons.download_outlined,
                                color: context.colors.textPrimary,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                final text = _buildShareTextFromHistory(
                                  widget.history,
                                );
                                SharePlus.instance.share(
                                  ShareParams(text: text),
                                );
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
                            widget.history.group?.name ?? '',
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
                                                    widget
                                                            .history
                                                            .group
                                                            ?.dues
                                                            ?.toIdrWithPrefix ??
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

  String _buildShareTextFromHistory(HistoryEntity history) {
    final buffer = StringBuffer();

    // Header
    buffer.writeln("📌 Riwayat Arisan");
    buffer.writeln("");

    // Group info
    buffer.writeln("Nama Grup : ${history.group?.name ?? '-'}");
    buffer.writeln("Kode Grup : ${history.group?.code ?? '-'}");
    buffer.writeln("Tanggal   : ${history.date.toIdFullDate}");
    buffer.writeln("Periode   : ${history.periodOrder ?? '-'}");
    buffer.writeln("Iuran     : ${history.amount?.toIdrWithPrefix}");
    buffer.writeln("Reward    : ${history.reward ?? '-'}");
    buffer.writeln("");
    buffer.writeln("-------------");
    // Winners
    buffer.writeln("🏆 Pemenang:");
    if (history.winners != null && history.winners!.isNotEmpty) {
      for (final w in history.winners!) {
        buffer.writeln("- ${w.user?.name ?? 'Tidak diketahui'}");
      }
    } else {
      buffer.writeln("- Tidak ada pemenang");
    }
    buffer.writeln("");
    buffer.writeln("-------------");

    // Members
    buffer.writeln("👥 Semua Anggota:");
    if (history.members != null && history.members!.isNotEmpty) {
      for (final m in history.members!) {
        buffer.writeln(
          "- ${m.user?.name ?? 'Tidak diketahui'} (${m.paymentStatus?.label ?? '-'})",
        );
      }
    } else {
      buffer.writeln("- Tidak ada anggota");
    }
    buffer.writeln("");

    // Notes
    // buffer.writeln("Catatan:");
    // buffer.writeln(history.notes?.isNotEmpty == true ? history.notes! : "-");

    return buffer.toString();
  }
}
