import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/extensions/context_extensions.dart';

class HomePage extends StatefulWidget {
  static const String path = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: context.spacing.sm,
                                  ),
                                  width: context.appSize.s48,
                                  height: context.appSize.s48,
                                  child: CircleAvatar(
                                    backgroundColor: context.colors.accent,
                                    child: Icon(
                                      Icons.person_outline,
                                      size: context.appSize.s32,
                                      color: context.colors.secondary,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Hai, John Doe',
                                  maxLines: 1,
                                  style: context.textStyles.title,
                                ),
                                Text(
                                  'johndoe@gmail.com',
                                  maxLines: 1,
                                  style: context.textStyles.body,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SafeArea(
                          bottom: false,
                          child: Container(
                            margin: EdgeInsets.only(right: context.spacing.lg),
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
                  Container(
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
                              padding: EdgeInsets.all(context.spacing.sm),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: '70%, ',
                                      style: context.textStyles.body.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: context.colors.primary,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: 'arisan kamu sudah lunas',
                                          style: context.textStyles.body
                                              .copyWith(
                                                color: context.colors.primary,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: context.appSize.s8),
                                  LinearProgressIndicator(
                                    backgroundColor: context.colors.divider,
                                    color: context.colors.secondary,
                                    minHeight: context.appSize.s8,
                                    borderRadius: BorderRadius.circular(
                                      context.radius.medium,
                                    ),
                                    value: 0.7,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: context.spacing.lg),
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
                      'Tergabung',
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
                        'Undangan',
                        style: context.textStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colors.secondary,
                        ),
                      ),
                    ),
                ],
              ),
            ),

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
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
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
                            backgroundColor: context.colors.surface,
                            child: Text(
                              'AC',
                              style: context.textStyles.body.copyWith(
                                color: context.colors.primary,
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
                                  'Arisan Ceria',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.bodySmall.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: context.spacing.xs),
                                Text(
                                  'KODE GRUP',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.bodySmall,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Iuran',
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyles.bodySmall,
                                  ),
                                  Text(
                                    'Rp12.000',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tanggal Kocok',
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textStyles.bodySmall,
                                  ),
                                  Text(
                                    '12 Oktober 2025',
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
                      if (index % 2 == 0)
                        Container(
                          margin: EdgeInsets.only(top: context.spacing.md),
                          width: double.infinity,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {},
                            child: Text('Lihat Detail'),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: context.spacing.md,
        children: [
          FloatingActionButton(
            heroTag: "qrcode",
            backgroundColor: context.colors.primary,
            child: const Icon(Icons.qr_code),
            onPressed: () {},
          ),
          FloatingActionButton(
            heroTag: "add-group",
            backgroundColor: context.colors.primary,
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
