import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import 'group_history_detail_page.dart';

class GroupHistoryPage extends StatefulWidget {
  const GroupHistoryPage({super.key});

  @override
  State<GroupHistoryPage> createState() => _GroupHistoryPageState();
}

class _GroupHistoryPageState extends State<GroupHistoryPage> {
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
    return Container(
      margin: EdgeInsets.only(bottom: context.spacing.md),
      child: Column(
        spacing: context.spacing.md,
        children: [
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
          for (var i = 0; i < 10; i++)
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
                  borderRadius: BorderRadius.circular(context.radius.medium),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: context.colors.accent,
                          child: Icon(
                            Icons.check,
                            color: context.colors.secondary,
                          ),
                        ),
                        SizedBox(width: context.spacing.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Minggu, 18 October 2025',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.textStyles.bodySmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: context.spacing.xs),
                              Text(
                                'Periode 1',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.textStyles.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Pemenang',
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.bodySmall,
                                ),
                                Text(
                                  '2 Orang',
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.bodySmall.copyWith(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hadiah',
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.bodySmall,
                                ),
                                Text(
                                  'Rp 1.000.000',
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.bodySmall.copyWith(
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
  }
}
