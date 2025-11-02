import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../config/enums/group_filter.dart';
import '../../domain/entities/group_entity.dart';
import 'group_provider.dart';

part 'get_groups_notifier.g.dart';

class GetGroupsState {
  final List<GroupEntity> groups;
  final bool isLoading;
  final bool hasMore;
  final String? lastId;
  final String? error;

  const GetGroupsState({
    this.groups = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.lastId,
    this.error,
  });

  GetGroupsState copyWith({
    List<GroupEntity>? groups,
    bool? isLoading,
    bool? hasMore,
    String? lastId,
    String? error,
  }) {
    return GetGroupsState(
      groups: groups ?? this.groups,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      lastId: lastId ?? this.lastId,
      error: error,
    );
  }
}

@riverpod
class GetGroupsNotifier extends _$GetGroupsNotifier {
  @override
  GetGroupsState build() => const GetGroupsState();

  Future<void> fetchGroups({
    String? search,
    GroupFilter filter = GroupFilter.all,
  }) async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, error: null);

    final usecase = ref.read(getGroupsUsecaseProvider);
    final result = await usecase(
      search: search,
      filter: filter,
      lastId: state.lastId,
    );

    if (result.isSuccess) {
      final groups = result.resultValue ?? [];
      final hasMore = groups.length >= 10;
      final lastId = groups.isNotEmpty ? groups.last.id : state.lastId;

      state = state.copyWith(
        groups: [...state.groups, ...groups],
        isLoading: false,
        hasMore: hasMore,
        lastId: lastId,
      );
    } else {
      state = state.copyWith(isLoading: false, error: result.errorMessage);
    }
  }

  Future<void> loadMore({
    String? search,
    GroupFilter filter = GroupFilter.all,
  }) async {
    if (!state.hasMore || state.isLoading) return;
    await fetchGroups(search: search, filter: filter);
  }

  void reset() {
    state = const GetGroupsState();
  }
}
