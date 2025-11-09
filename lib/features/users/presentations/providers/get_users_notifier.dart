import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/domain/entities/user_entity.dart';
import 'user_providers.dart';

part 'get_users_notifier.g.dart';

class GetUsersState {
  final List<UserEntity> users;
  final bool? isLoading;
  final bool hasMore;
  final String? lastId;
  final String? error;

  const GetUsersState({
    this.users = const [],
    this.isLoading,
    this.hasMore = true,
    this.lastId,
    this.error,
  });

  GetUsersState copyWith({
    List<UserEntity>? users,
    bool? isLoading,
    bool? hasMore,
    String? lastId,
    String? error,
  }) {
    return GetUsersState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      lastId: lastId ?? this.lastId,
      error: error,
    );
  }
}

@riverpod
class GetUsersNotifier extends _$GetUsersNotifier {
  @override
  GetUsersState build() => const GetUsersState();

  Future<void> fetchUsers({String? search}) async {
    if (state.isLoading == true) return;

    state = state.copyWith(isLoading: true, error: null);

    final usecase = ref.read(getUsersUsecaseProvider);
    final result = await usecase(search: search, lastId: state.lastId);

    if (result.isSuccess) {
      final users = result.resultValue ?? [];
      final hasMore = users.length >= 10;
      final lastId = users.isNotEmpty ? users.last.id : state.lastId;

      state = state.copyWith(
        users: [...state.users, ...users],
        isLoading: false,
        hasMore: hasMore,
        lastId: lastId,
      );
    } else {
      state = state.copyWith(isLoading: false, error: result.errorMessage);
    }
  }

  Future<void> loadMore({String? search}) async {
    if (!state.hasMore || state.isLoading == true) return;
    await fetchUsers(search: search);
  }

  void reset() {
    state = const GetUsersState();
  }
}
