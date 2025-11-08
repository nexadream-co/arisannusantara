import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/feedback_repository.dart';
import '../../domain/usecases/create_feedback_usecase.dart';
import '../../domain/usecases/delete_feedback_usecase.dart';
import '../../domain/usecases/get_feedbacks_usecase.dart';

part 'feedback_providers.g.dart';

@riverpod
FeedbackRepository feedbackRepository(Ref ref) {
  return FeedbackRepository();
}

@riverpod
GetFeedbacksUsecase getFeedbacksUsecase(Ref ref) {
  final repository = ref.watch(feedbackRepositoryProvider);
  return GetFeedbacksUsecase(repository: repository);
}

@riverpod
CreateFeedbackUsecase createFeedbackUsecase(Ref ref) {
  final repository = ref.watch(feedbackRepositoryProvider);
  return CreateFeedbackUsecase(repository: repository);
}

@riverpod
DeleteFeedbackUsecase deleteFeedbackUsecase(Ref ref) {
  final repository = ref.watch(feedbackRepositoryProvider);
  return DeleteFeedbackUsecase(repository: repository);
}
