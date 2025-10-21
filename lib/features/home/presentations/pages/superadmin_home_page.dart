import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../groups/presentations/pages/group_page.dart';
import '../../../groups/presentations/pages/search_group_page.dart';

class SuperadminHomePage extends StatefulWidget {
  static const String path = '/superadmin/home';
  const SuperadminHomePage({super.key});

  @override
  State<SuperadminHomePage> createState() => _SuperadminHomePageState();
}

class _SuperadminHomePageState extends State<SuperadminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  // top: context.spacing.lg,
                  bottom: context.spacing.lg,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(context.assets.textureBg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: context.spacing.lg,
                              left: context.spacing.lg,
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
                        GestureDetector(
                          onTap: () {
                            context.push(SearchGroupPage.path);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: context.spacing.lg),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                context.radius.medium,
                              ),
                            ),
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                String? selectedStatus = 'Bulan ini';

                                return SizedBox(
                                  width: context.appSize.s100,
                                  child: DropdownButtonFormField<String>(
                                    initialValue: selectedStatus,
                                    isExpanded: false,
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 2,
                                      ),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'Bulan ini',
                                        child: Text(
                                          'Bulan ini',
                                          style: context.textStyles.body
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Tahun Ini',
                                        child: Text(
                                          'Tahun Ini',
                                          style: context.textStyles.body
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() => selectedStatus = value);
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: context.spacing.lg,
                        right: context.spacing.lg,
                        top: context.spacing.lg,
                        bottom: context.spacing.md,
                      ),
                      child: Row(
                        spacing: context.spacing.md,
                        children: [
                          Expanded(
                            child: _statisticItem(
                              context,
                              label: 'Total Grup',
                              value: '50',
                              icon: Icons.people_outline,
                            ),
                          ),
                          Expanded(
                            child: _statisticItem(
                              context,
                              label: 'Total Pengguna',
                              value: '10',
                              icon: Icons.person_outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: context.spacing.lg,
                        right: context.spacing.lg,
                      ),
                      child: Row(
                        spacing: context.spacing.md,
                        children: [
                          Expanded(
                            child: _statisticItem(
                              context,
                              label: 'Total Feedback',
                              value: '78',
                              icon: Icons.chat_outlined,
                            ),
                          ),
                          Expanded(
                            child: _statisticItem(
                              context,
                              label: 'Total Kocok',
                              value: '25',
                              icon: Icons.shuffle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: context.spacing.lg,
                  right: context.spacing.lg,
                  top: context.spacing.lg,
                  bottom: context.spacing.md,
                ),
                child: Row(
                  children: [
                    Text(
                      'Grup Terbaru',
                      style: context.textStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Selengkapnya',
                      style: context.textStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colors.primary,
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
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.push(GroupPage.path);
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
                              SizedBox(
                                width: context.appSize.s32,
                                height: context.appSize.s32,
                                child: CircleAvatar(
                                  backgroundColor: context.colors.surface,
                                  child: Text(
                                    'AC',
                                    style: context.textStyles.body.copyWith(
                                      color: context.colors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                      style: context.textStyles.bodySmall
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Iuran',
                                        overflow: TextOverflow.ellipsis,
                                        style: context.textStyles.bodySmall
                                            .copyWith(fontSize: 8),
                                      ),
                                      Text(
                                        'Rp12.000',
                                        overflow: TextOverflow.ellipsis,
                                        style: context.textStyles.bodySmall
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 8,
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
                                        'Tanggal Kocok',
                                        overflow: TextOverflow.ellipsis,
                                        style: context.textStyles.bodySmall
                                            .copyWith(fontSize: 8),
                                      ),
                                      Text(
                                        '12 Oktober 2025',
                                        overflow: TextOverflow.ellipsis,
                                        style: context.textStyles.bodySmall
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 8,
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
                                  padding: EdgeInsets.symmetric(
                                    vertical: context.spacing.sm,
                                  ),
                                  minimumSize: Size(0, 0),
                                ),
                                onPressed: () {},
                                child: Text('Lihat Detail'),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: context.spacing.lg,
                  right: context.spacing.lg,
                  bottom: context.spacing.md,
                ),
                child: Row(
                  children: [
                    Text(
                      'Pengguna Terbaru',
                      style: context.textStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Selengkapnya',
                      style: context.textStyles.body.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colors.primary,
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
                itemCount: 6,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.push(GroupPage.path);
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
                              SizedBox(
                                width: context.appSize.s32,
                                height: context.appSize.s32,
                                child: CircleAvatar(
                                  backgroundColor: context.colors.surface,
                                  child: Text(
                                    'AC',
                                    style: context.textStyles.body.copyWith(
                                      color: context.colors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                      'Agus Hermanto',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textStyles.bodySmall
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'agushermanto@gmail.com',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: context.textStyles.bodySmall,
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
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _statisticItem(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Row(
      spacing: context.spacing.md,
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: context.spacing.sm),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(context.radius.medium),
              boxShadow: [context.shadow.medium],
            ),
            child: Row(
              children: [
                Card(
                  margin: EdgeInsets.symmetric(horizontal: context.spacing.md),
                  color: context.colors.surface,
                  elevation: 0,
                  child: Padding(
                    padding: EdgeInsets.all(context.spacing.sm),
                    child: Icon(
                      icon,
                      size: context.appSize.s24,
                      color: context.colors.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: context.spacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          label,
                          maxLines: 1,
                          style: context.textStyles.bodySmall.copyWith(
                            fontSize: 8,
                          ),
                        ),
                        Text(value, style: context.textStyles.title),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
