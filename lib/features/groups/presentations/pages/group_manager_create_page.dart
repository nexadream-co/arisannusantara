import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';

class GroupManagerCreatePage extends StatefulWidget {
  static const String path = '/group/manager/create';
  const GroupManagerCreatePage({super.key});

  @override
  State<GroupManagerCreatePage> createState() => _GroupManagerCreatePageState();
}

class _GroupManagerCreatePageState extends State<GroupManagerCreatePage> {
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
        actions: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: context.spacing.sm,
            children: [
              Text(
                'Total 20 Peserta',
                style: context.textStyles.body.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.info_outline),
            ],
          ),
        ],
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
                  'Tambah Pengelola',
                  maxLines: 1,
                  style: context.textStyles.header.copyWith(
                    color: context.colors.primary,
                  ),
                ),
                Text(
                  'Pilih peserta yang ditambahkan sebagai pengelola',
                  maxLines: 1,
                  style: context.textStyles.body,
                ),
                SizedBox(height: context.spacing.md),
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
                child: Text('Tambah Pengelola'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
