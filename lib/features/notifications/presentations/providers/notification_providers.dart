import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/notification_repository.dart';
import '../../domain/usecases/get_notifications_usecase.dart';
import '../../domain/usecases/get_unread_count_usecase.dart';
import '../../domain/usecases/mark_all_as_read_usecase.dart';

part 'notification_providers.g.dart';

@riverpod
NotificationRepository notificationRepository(Ref ref) {
  return NotificationRepository();
}

@riverpod
GetNotificationsUsecase getNotificationsUsecase(Ref ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  return GetNotificationsUsecase(repository: repository);
}

@riverpod
MarkAllAsReadUsecase markAllAsReadUsecase(Ref ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  return MarkAllAsReadUsecase(repository: repository);
}

@riverpod
GetUnreadCountUsecase getUnreadCountUsecase(Ref ref) {
  final repository = ref.watch(notificationRepositoryProvider);
  return GetUnreadCountUsecase(repository: repository);
}
