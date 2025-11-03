import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/datetime_extensions.dart';
import '../../../../core/extensions/number_extensions.dart';
import '../../../../core/extensions/string_extensions.dart';
import '../../../../core/utils/debouncer.dart';
import '../providers/get_groups_notifier.dart';

class SearchGroupPage extends ConsumerStatefulWidget {
  static const String path = '/search-group';
  const SearchGroupPage({super.key});

  @override
  ConsumerState<SearchGroupPage> createState() => _SearchGroupPageState();
}

class _SearchGroupPageState extends ConsumerState<SearchGroupPage> {
  final _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 300);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(getGroupsProvider.notifier).fetchGroups();
    });
  }

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
            controller: _searchController,
            onChanged: (value) {
              _debouncer.run(() {
                ref.read(getGroupsProvider.notifier).fetchGroups(search: value);
              });
            },
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
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(getGroupsProvider);
              final notifier = ref.read(getGroupsProvider.notifier);
              return Column(
                children: [
                  if (state.groups.isNotEmpty)
                    ListView.builder(
                      padding: EdgeInsets.only(
                        left: context.spacing.lg,
                        right: context.spacing.lg,
                        bottom: context.spacing.xxl * 2,
                        top: context.spacing.md,
                      ),
                      itemCount: state.groups.length,
                      itemBuilder: (context, index) {
                        final group = state.groups[index];

                        return Container(
                          margin: EdgeInsets.only(bottom: context.spacing.md),
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
                                  CircleAvatar(
                                    backgroundColor: context.colors.surface,
                                    child: Text(
                                      group.name?.initials ?? '',
                                      style: context.textStyles.body.copyWith(
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
                                          group.name ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textStyles.bodySmall
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        SizedBox(height: context.spacing.xs),
                                        Text(
                                          group.code ?? '',
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            group.description ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            style: context.textStyles.bodySmall,
                                          ),
                                          Text(
                                            'Belum Tergabung',
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
                                    SizedBox(width: context.spacing.xs),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Iuran',
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textStyles.bodySmall,
                                        ),
                                        Text(
                                          group.dues?.toIdrWithPrefix ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textStyles.bodySmall
                                              .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: context.colors.primary,
                                              ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: context.spacing.xs),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tanggal Kocok',
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textStyles.bodySmall,
                                        ),
                                        Text(
                                          group.periodsDate?.toIdDate ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          style: context.textStyles.bodySmall
                                              .copyWith(
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

                  if (state.groups.isEmpty && !state.isLoading)
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: context.spacing.lg),
                      child: Text(
                        'Grup tidak ditemukan',
                        style: context.textStyles.body,
                      ),
                    ),

                  if (state.isLoading)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(context.spacing.lg),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (state.hasMore && state.groups.isNotEmpty)
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(
                        horizontal: context.spacing.md,
                      ),
                      child: OutlinedButton(
                        onPressed: () => notifier.loadMore(),
                        child: const Text('Muat Lebih Banyak'),
                      ),
                    ),

                  if (state.error != null)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          state.error!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),

          Container(
            alignment: Alignment.bottomCenter,
            width: double.infinity,
            padding: EdgeInsets.only(
              left: context.spacing.xl,
              right: context.spacing.lg,
              bottom: context.spacing.lg,
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
