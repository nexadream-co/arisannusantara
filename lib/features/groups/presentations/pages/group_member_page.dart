import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';

class GroupMemberPage extends StatefulWidget {
  const GroupMemberPage({super.key});

  @override
  State<GroupMemberPage> createState() => _GroupMemberPageState();
}

class _GroupMemberPageState extends State<GroupMemberPage> {
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(context.radius.medium),
      borderSide: BorderSide.none,
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.spacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: context.spacing.md),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(context.radius.medium),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Cari peserta...",
                  hintStyle: context.textStyles.subtitle,
                  fillColor: context.colors.surface,
                  filled: true,
                  enabledBorder: border,
                  focusedBorder: border,
                  border: border,
                  suffixIcon: Icon(
                    Icons.search,
                    color: context.colors.textPrimary,
                  ),
                ),
              ),
            ),
            _groupMember(),
          ],
        ),
      ),

      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: context.spacing.md,
        children: [
          FloatingActionButton(
            heroTag: "add-member",
            backgroundColor: context.colors.primary,
            child: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _groupMember() {
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
          for (var i = 0; i < 10; i++)
            Container(
              padding: EdgeInsets.only(bottom: context.spacing.md),
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
                          'ardisanjaya@gmail.com',
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
                      child: Text('Sudah Bayar'),
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
