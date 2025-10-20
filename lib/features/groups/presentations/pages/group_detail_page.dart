import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import 'group_manager_create_page.dart';
import 'group_shuffle_winner_page.dart';

class GroupDetailPage extends StatefulWidget {
  const GroupDetailPage({super.key});

  @override
  State<GroupDetailPage> createState() => _GroupDetailPageState();
}

class _GroupDetailPageState extends State<GroupDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Infomasi Grup', style: context.textStyles.title),
            SizedBox(height: context.spacing.md),
            _groupInformationItem('Iuran', 'Rp 100.000'),
            _groupInformationItem('Periode', 'Bulanan'),
            _groupInformationItem('Hadiah', 'Uang Tunai'),
            _groupInformationItem('Maksimal pemenang', '2 Orang'),
            _groupInformationItem('Tanggal kocok', '15 Oktober 2025'),
            _groupInformationItem('Biaya admin', 'Rp 50.000'),
            _groupInformationItem('Dibuat pada', '12 Oktober 2025'),
            SizedBox(height: context.spacing.lg),
            Row(
              children: [
                Text('Pembayaran', style: context.textStyles.title),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Wrap(
                    children: [
                      Icon(
                        Icons.add_circle_outlined,
                        size: context.appSize.s16,
                        color: context.colors.primary,
                      ),
                      SizedBox(width: context.appSize.s4),
                      Text(
                        'Tambah',
                        style: context.textStyles.body.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _groupPayment(),
            SizedBox(height: context.spacing.lg),
            Row(
              children: [
                Text('Pengelola', style: context.textStyles.title),
                Spacer(),
                TextButton(
                  onPressed: () {
                    context.push(GroupManagerCreatePage.path);
                  },
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: Wrap(
                    children: [
                      Icon(
                        Icons.add_circle_outlined,
                        size: context.appSize.s16,
                        color: context.colors.primary,
                      ),
                      SizedBox(width: context.appSize.s4),
                      Text(
                        'Tambah',
                        style: context.textStyles.body.copyWith(
                          color: context.colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            _groupManager(),
          ],
        ),
      ),

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: context.spacing.md,
        children: [
          FloatingActionButton(
            heroTag: "shuffle",
            backgroundColor: context.colors.primary,
            child: const Icon(Icons.shuffle),
            onPressed: () {
              context.push(GroupShuffleWinnerPage.path);
            },
          ),
        ],
      ),
    );
  }

  Widget _groupInformationItem(String label, String value) {
    return Container(
      padding: EdgeInsets.only(bottom: context.spacing.sm),
      margin: EdgeInsets.only(bottom: context.spacing.sm),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: context.colors.divider)),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label, style: context.textStyles.body)),
          Text(
            value,
            style: context.textStyles.body.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _groupPayment() {
    return Container(
      margin: EdgeInsets.only(bottom: context.spacing.md),
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.md,
        vertical: context.spacing.md,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [context.shadow.small],
        borderRadius: BorderRadius.circular(context.radius.medium),
      ),
      child: Column(
        spacing: context.spacing.md,
        children: [
          for (var i = 0; i < 3; i++)
            Container(
              padding: i == 2
                  ? null
                  : EdgeInsets.only(bottom: context.spacing.md),
              decoration: BoxDecoration(
                border: i == 2
                    ? null
                    : Border(bottom: BorderSide(color: context.colors.divider)),
              ),
              child: Row(
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
                          'BCA - Yasmin Arhan',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: context.spacing.xs),
                        Text(
                          '3445466565',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit_outlined,
                      color: context.colors.primary,
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
                      child: Text('Salin'),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _groupManager() {
    return Container(
      margin: EdgeInsets.only(bottom: context.spacing.md),
      padding: EdgeInsets.symmetric(vertical: context.spacing.xs),
      child: Column(
        spacing: context.spacing.md,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: context.spacing.md),
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
          for (var i = 0; i < 3; i++)
            Container(
              padding: i == 2
                  ? null
                  : EdgeInsets.only(bottom: context.spacing.md),
              decoration: BoxDecoration(
                border: i == 2
                    ? null
                    : Border(bottom: BorderSide(color: context.colors.divider)),
              ),
              child: Row(
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
                          'Ardi Sanjaya',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: context.spacing.xs),
                        Text(
                          'Surabaya, Indonesia',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline,
                      color: context.colors.primary,
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
                      child: Text('Hubungi'),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
