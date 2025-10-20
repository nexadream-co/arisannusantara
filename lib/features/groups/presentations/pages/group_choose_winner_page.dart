import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';

class GroupChooseWinnerPage extends StatefulWidget {
  static const String path = '/group/choose/winner';
  const GroupChooseWinnerPage({super.key});

  @override
  State<GroupChooseWinnerPage> createState() => _GroupChooseWinnerPageState();
}

class _GroupChooseWinnerPageState extends State<GroupChooseWinnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        automaticallyImplyLeading: false,
        leading: IconButton(
          padding: EdgeInsets.only(left: context.spacing.sm),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        actionsPadding: EdgeInsets.only(right: context.spacing.lg),
        actions: [Icon(Icons.info_outline)],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              right: context.spacing.lg,
              left: context.spacing.lg,
              bottom: context.spacing.xl * 3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pemenang Arisan',
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
                SizedBox(height: context.spacing.md),
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
                SizedBox(height: context.spacing.xs),
                for (var i = 0; i < 20; i++)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: context.spacing.sm),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: context.colors.divider),
                      ),
                    ),
                    child: CheckboxListTile(
                      value: true,
                      onChanged: (value) {},
                      secondary: CircleAvatar(
                        backgroundColor: context.colors.surface,
                        child: Text(
                          'AC',
                          style: context.textStyles.body.copyWith(
                            color: context.colors.primary,
                          ),
                        ),
                      ),
                      title: Text('Andi sanjaya'),
                      subtitle: Text('andisanjaya@id.com'),
                    ),
                  ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            padding: EdgeInsets.only(
              left: context.spacing.lg,
              right: context.spacing.lg,
              bottom: context.spacing.lg,
            ),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  context.pop();
                },
                child: Text('Simpan Pemenang'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
