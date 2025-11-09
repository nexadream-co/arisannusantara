import '../../../../config/enums/feedback_status_enum.dart';
import '../../../../core/app/result.dart';
import '../../data/feedback_repository.dart';

class UpdateStatusFeedbackUsecase {
  final FeedbackRepository repository;

  UpdateStatusFeedbackUsecase({required this.repository});

  Future<Result<String>> call({
    required String feedbackId,
    required FeedbackStatusEnum newStatus,
  }) async {
    return await repository.updateStatusFeedback(
      feedbackId: feedbackId,
      newStatus: newStatus,
    );
  }
}
