import '../../../../core/app/result.dart';
import '../../data/notification_repository.dart';
import '../entities/notification_entity.dart';

class GetNotificationsUsecase {
  final NotificationRepository repository;

  GetNotificationsUsecase({required this.repository});

  Future<Result<List<NotificationEntity>>> call({
    String? search,
    String? lastId,
    int limit = 10,
  }) async {
    return await repository.getNotifications(
      search: search,
      lastId: lastId,
      limit: limit,
    );
  }
}
