import '../../../../config/enums/feedback_status_enum.dart';
import '../../../../core/app/result.dart';
import '../../data/feedback_repository.dart';
import '../entities/feedback_entity.dart';

class GetFeedbacksUsecase {
  final FeedbackRepository repository;

  GetFeedbacksUsecase({required this.repository});

  Future<Result<List<FeedbackEntity>>> call({
    String? search,
    FeedbackStatusEnum? status,
    int limit = 10,
    String? lastId,
  }) async {
    return await repository.getFeedbacks(
      search: search,
      status: status,
      limit: limit,
      lastId: lastId,
    );
  }
}
