import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/notification_entity.dart';
import 'notification_providers.dart';

part 'get_notifications_notifier.g.dart';

class GetNotificationsState {
  final List<NotificationEntity> notifications;
  final bool isLoading;
  final bool hasMore;
  final String? lastId;
  final String? error;

  const GetNotificationsState({
    this.notifications = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.lastId,
    this.error,
  });

  GetNotificationsState copyWith({
    List<NotificationEntity>? notifications,
    bool? isLoading,
    bool? hasMore,
    String? lastId,
    String? error,
  }) {
    return GetNotificationsState(
      notifications: notifications ?? this.notifications,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      lastId: lastId ?? this.lastId,
      error: error,
    );
  }
}

@riverpod
class GetNotificationsNotifier extends _$GetNotificationsNotifier {
  @override
  GetNotificationsState build() => const GetNotificationsState();

  Future<void> fetchNotifications({String? search}) async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, error: null);

    final usecase = ref.read(getNotificationsUsecaseProvider);
    final result = await usecase(search: search, lastId: state.lastId);

    if (result.isSuccess) {
      final notifications = result.resultValue ?? [];
      final hasMore = notifications.length >= 10;
      final lastId = notifications.isNotEmpty
          ? notifications.last.id
          : state.lastId;

      state = state.copyWith(
        notifications: [...state.notifications, ...notifications],
        isLoading: false,
        hasMore: hasMore,
        lastId: lastId,
      );
    } else {
      state = state.copyWith(isLoading: false, error: result.errorMessage);
    }
  }

  Future<void> loadMore({String? search}) async {
    if (!state.hasMore || state.isLoading) return;
    await fetchNotifications(search: search);
  }

  void reset() {
    state = const GetNotificationsState();
  }
}
