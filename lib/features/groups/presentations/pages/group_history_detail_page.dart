import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';

class GroupHistoryDetailPage extends StatefulWidget {
  static const String path = '/group-history-detail';
  const GroupHistoryDetailPage({super.key});

  @override
  State<GroupHistoryDetailPage> createState() => _GroupHistoryDetailPageState();
}

class _GroupHistoryDetailPageState extends State<GroupHistoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          '#Kode grup',
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
                                          'Minggu, 18 October 2025',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textStyles.bodySmall
                                              .copyWith(
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
                                                  '2 Orang',
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
                                                  'Rp 100.000',
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
                                                  'Hadiah uang tunai',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: context
                                                      .textStyles
                                                      .bodySmall,
                                                ),
                                                Text(
                                                  'Rp 1.000.000',
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
            Container(
              margin: EdgeInsets.only(
                bottom: context.spacing.lg,
                top: context.spacing.lg,
              ),
              height: context.appSize.s40,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: context.spacing.lg),
                children: [
                  Container(
                    margin: EdgeInsets.only(right: context.spacing.sm),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.spacing.md,
                    ),
                    decoration: BoxDecoration(
                      color: context.colors.secondary,
                      borderRadius: BorderRadius.circular(
                        context.radius.medium,
                      ),
                    ),
                    child: Text(
                      'Semua',
                      style: context.textStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  for (int i = 0; i < 5; i++)
                    Container(
                      margin: EdgeInsets.only(right: context.spacing.sm),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spacing.md,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: context.colors.secondary),
                        borderRadius: BorderRadius.circular(
                          context.radius.medium,
                        ),
                      ),
                      child: Text(
                        'Pemenang',
                        style: context.textStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colors.secondary,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Column(
              spacing: context.spacing.md,
              children: [
                for (var i = 0; i < 10; i++)
                  Container(
                    padding: EdgeInsets.only(
                      bottom: context.spacing.md,
                      left: context.spacing.lg,
                      right: context.spacing.lg,
                    ),
                    decoration: BoxDecoration(
                      border: i == 2
                          ? null
                          : Border(
                              bottom: BorderSide(color: context.colors.divider),
                            ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: context.colors.surface,
                          child: Text(
                            'AC',
                            style: context.textStyles.body.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.bold,
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
                                'Ardi Sanjaya',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: context.textStyles.bodySmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: context.spacing.xs),
                              Text(
                                'ardisanjaya@gmail.com',
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
                            child: Text('Sudah Bayar'),
                          ),
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
  }
}
