import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../core/utils/loading_overlay.dart';
import '../../domain/entities/group_entity.dart';
import '../providers/group_providers.dart';

class GroupManagerCreatePage extends ConsumerStatefulWidget {
  static const String path = '/group/manager/create';
  final GroupEntity group;

  const GroupManagerCreatePage({super.key, required this.group});

  @override
  ConsumerState<GroupManagerCreatePage> createState() =>
      _GroupManagerCreatePageState();
}

class _GroupManagerCreatePageState
    extends ConsumerState<GroupManagerCreatePage> {
  // Track selected member IDs
  final Set<String> _selectedIds = {};

  @override
  Widget build(BuildContext context) {
    final membersRef = ref.watch(getMembersProvider(widget.group.id!, ''));

    return membersRef.when(
      loading: () => Text(
        'Mohon tunggu...',
        style: context.textStyles.body.copyWith(
          color: context.colors.primary,
          fontStyle: FontStyle.italic,
        ),
      ),
      error: (err, stack) => Text(
        'Terjadi kesalahan, mohon coba kembali',
        style: context.textStyles.body.copyWith(
          color: context.colors.primary,
          fontStyle: FontStyle.italic,
        ),
      ),
      data: (result) {
        final members = (result.resultValue ?? [])
            .where(
              (member) =>
                  !(widget.group.owners ?? []).contains(member.user?.id),
            )
            .toList();

        return Scaffold(
          appBar: AppBar(
            title: const Text(""),
            automaticallyImplyLeading: false,
            leading: IconButton(
              padding: EdgeInsets.only(left: context.spacing.sm),
              icon: const Icon(Icons.arrow_back),
              onPressed: () => context.pop(),
            ),
            actionsPadding: EdgeInsets.only(right: context.spacing.lg),
            actions: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: context.spacing.sm,
                children: [
                  Text(
                    'Total ${members.length} Peserta',
                    style: context.textStyles.body.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.info_outline),
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
                      style: context.textStyles.header.copyWith(
                        color: context.colors.primary,
                      ),
                    ),
                    Text(
                      'Pilih peserta yang ditambahkan sebagai pengelola',
                      style: context.textStyles.body,
                    ),
                    SizedBox(height: context.spacing.md),
                    if (members.isEmpty)
                      Container(
                        margin: EdgeInsets.only(bottom: context.spacing.md),
                        padding: EdgeInsets.symmetric(
                          vertical: context.spacing.sm,
                          horizontal: context.spacing.md,
                        ),
                        decoration: BoxDecoration(
                          color: context.colors.accent,
                          borderRadius: BorderRadius.circular(
                            context.radius.medium,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.info_outline),
                            SizedBox(width: context.spacing.sm),
                            Expanded(
                              child: Text(
                                'Belum ada peserta yang dapat ditambahkan sebagai pengelola, silahkan tambahkan peserta terlebih dahulu.',
                                style: context.textStyles.body,
                              ),
                            ),
                          ],
                        ),
                      ),
                    for (final member in members)
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: context.spacing.sm,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: context.colors.divider),
                          ),
                        ),
                        child: CheckboxListTile(
                          value: _selectedIds.contains(member.user?.id),
                          onChanged: (value) {
                            setState(() {
                              final id = member.user?.id;
                              if (id != null) {
                                if (value == true) {
                                  _selectedIds.add(id);
                                } else {
                                  _selectedIds.remove(id);
                                }
                              }
                            });
                          },
                          secondary: CircleAvatar(
                            backgroundColor: context.colors.surface,
                            child: Text(
                              member.user?.name?.initials ?? '',
                              style: context.textStyles.body.copyWith(
                                color: context.colors.primary,
                              ),
                            ),
                          ),
                          title: Text(member.user?.name ?? ''),
                          subtitle: Text(member.user?.email ?? ''),
                        ),
                      ),
                  ],
                ),
              ),
              // Bottom button
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
                    onPressed: members.isEmpty
                        ? null
                        : () {
                            // ✅ Validation
                            if (_selectedIds.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Pilih minimal satu peserta terlebih dahulu.',
                                  ),
                                  backgroundColor: context.colors.error,
                                ),
                              );
                              return;
                            }

                            LoadingOverlay.show(context);
                            ref
                                .read(addGroupOwnersUsecaseProvider)
                                .call(widget.group.id!, _selectedIds.toList())
                                .then((result) {
                                  LoadingOverlay.hide();
                                  if (result.isSuccess) {
                                    CustomSnackbar.success(
                                      message: result.resultValue,
                                    );
                                    ref.invalidate(
                                      getGroupOwnersProvider(widget.group.id!),
                                    );
                                    context.pop();
                                  } else {
                                    CustomSnackbar.error(
                                      message: result.errorMessage,
                                    );
                                  }
                                });
                          },
                    child: const Text('Tambah Pengelola'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
