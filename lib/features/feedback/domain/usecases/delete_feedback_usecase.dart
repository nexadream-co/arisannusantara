import '../../../../core/app/result.dart';
import '../../data/feedback_repository.dart';

class DeleteFeedbackUsecase {
  final FeedbackRepository repository;

  DeleteFeedbackUsecase({required this.repository});

  Future<Result<String>> call({required String feedbackId}) async {
    return await repository.deleteFeedback(feedbackId: feedbackId);
  }
}
