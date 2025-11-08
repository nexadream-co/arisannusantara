import '../../../../core/app/result.dart';
import '../../data/feedback_repository.dart';

class CreateFeedbackUsecase {
  final FeedbackRepository repository;

  CreateFeedbackUsecase({required this.repository});

  Future<Result<String>> call({
    required String title,
    required String feedback,
  }) async {
    return await repository.createFeedback(title: title, feedback: feedback);
  }
}
