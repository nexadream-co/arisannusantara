import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';

class SearchGroupPage extends StatefulWidget {
  static const String path = '/search-group';
  const SearchGroupPage({super.key});

  @override
  State<SearchGroupPage> createState() => _SearchGroupPageState();
}

class _SearchGroupPageState extends State<SearchGroupPage> {
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.radius.medium),
      borderSide: BorderSide.none,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.only(
            left: context.spacing.sm,
            right: context.spacing.sm,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(context.radius.medium),
          ),
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Cari grup...",
              hintStyle: context.textStyles.subtitle,
              fillColor: context.colors.surface,
              filled: true,
              enabledBorder: border,
              focusedBorder: border,
              border: border,
              suffixIcon: Icon(Icons.search, color: context.colors.textPrimary),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(
              left: context.spacing.lg,
              right: context.spacing.lg,
              bottom: context.spacing.xxl * 2,
              top: context.spacing.md,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: context.spacing.md),
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
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: context.spacing.md,
                            ),
                            child: Text('Gabung'),
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
                                  'Lorem ipsum dolor sit amet lorem isum...',
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.bodySmall,
                                ),
                                Text(
                                  'Belum Tergabung',
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.bodySmall.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.colors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: context.spacing.xs),
                          Column(
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
                                style: context.textStyles.bodySmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.colors.primary,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: context.spacing.xs),
                          Column(
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
                                style: context.textStyles.bodySmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.colors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            padding: EdgeInsets.only(
              left: context.spacing.xl,
              right: context.spacing.xl,
              bottom: context.spacing.xl,
            ),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Kembali'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
