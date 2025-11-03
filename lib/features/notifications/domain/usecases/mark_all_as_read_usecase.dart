import '../../../../core/app/result.dart';
import '../../data/notification_repository.dart';

class MarkAllAsReadUsecase {
  final NotificationRepository repository;

  MarkAllAsReadUsecase({required this.repository});

  Future<Result<String>> call({
    String? search,
    String? lastId,
    int limit = 10,
  }) async {
    return await repository.markAllAsRead();
  }
}
