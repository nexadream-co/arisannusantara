import '../../../../core/app/result.dart';
import '../../data/notification_repository.dart';
import '../entities/notification_entity.dart';

class CreateNotificationsUsecase {
  final NotificationRepository repository;

  CreateNotificationsUsecase({required this.repository});

  Future<Result<bool>> call({
    required List<String> userIds,
    required NotificationEntity notification,
    bool withFCM = true,
  }) async {
    return await repository.createNotifications(
      userIds: userIds,
      notification: notification,
      withFCM: withFCM,
    );
  }
}
