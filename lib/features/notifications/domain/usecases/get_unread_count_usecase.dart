import '../../../../core/app/result.dart';
import '../../data/notification_repository.dart';

class GetUnreadCountUsecase {
  final NotificationRepository repository;

  GetUnreadCountUsecase({required this.repository});

  Future<Result<int>> call() async {
    return await repository.getUnreadCount();
  }
}
