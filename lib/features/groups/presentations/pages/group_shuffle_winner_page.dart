import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import 'group_choose_winner_page.dart';

class GroupShuffleWinnerPage extends StatefulWidget {
  static const String path = '/group/shuffle/winner';
  const GroupShuffleWinnerPage({super.key});

  @override
  State<GroupShuffleWinnerPage> createState() => _GroupShuffleWinnerPageState();
}

class _GroupShuffleWinnerPageState extends State<GroupShuffleWinnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(context.assets.textureBg),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                        Icons.info_outline,
                        color: context.colors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: context.spacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kocok Arisan',
                      maxLines: 1,
                      style: context.textStyles.header.copyWith(
                        color: context.colors.primary,
                      ),
                    ),
                    Text(
                      'Arisan Ceria',
                      maxLines: 1,
                      style: context.textStyles.body,
                    ),
                  ],
                ),
              ),
              Expanded(child: Center()),
              Container(
                height: context.appSize.s240,
                padding: EdgeInsets.only(
                  left: context.spacing.lg,
                  right: context.spacing.lg,
                  bottom: context.spacing.lg,
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: Scrollbar(
                        thickness: 0.6,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(
                            right: context.spacing.sm,
                            top: context.spacing.md,
                            bottom: context.spacing.md,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Pemenang',
                                    style: context.textStyles.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Maksimal 2',
                                    style: context.textStyles.body.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: context.spacing.md),
                              for (var i = 0; i < 3; i++)
                                Container(
                                  padding: i == 2
                                      ? null
                                      : EdgeInsets.only(
                                          bottom: context.spacing.md,
                                        ),
                                  decoration: BoxDecoration(
                                    border: i == 2
                                        ? null
                                        : Border(
                                            bottom: BorderSide(
                                              color: context.colors.divider,
                                            ),
                                          ),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: context.colors.surface,
                                        child: Text(
                                          'AC',
                                          style: context.textStyles.body
                                              .copyWith(
                                                color: context.colors.primary,
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
                                              'Ardi Sanjaya',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: context
                                                  .textStyles
                                                  .bodySmall
                                                  .copyWith(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            SizedBox(
                                              height: context.spacing.xs,
                                            ),
                                            Text(
                                              'Surabaya, Indonesia',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  context.textStyles.bodySmall,
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
                                          child: Text('Hapus'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          context.push(GroupChooseWinnerPage.path);
                        },
                        child: Text('Simpan Pemenang'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
