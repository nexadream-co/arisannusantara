import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/feedback_entity.dart';
import 'feedback_providers.dart';

part 'get_feedbacks_notifier.g.dart';

class GetFeedbacksState {
  final List<FeedbackEntity> feedbacks;
  final bool isLoading;
  final bool hasMore;
  final String? lastId;
  final String? error;

  const GetFeedbacksState({
    this.feedbacks = const [],
    this.isLoading = false,
    this.hasMore = true,
    this.lastId,
    this.error,
  });

  GetFeedbacksState copyWith({
    List<FeedbackEntity>? feedbacks,
    bool? isLoading,
    bool? hasMore,
    String? lastId,
    String? error,
  }) {
    return GetFeedbacksState(
      feedbacks: feedbacks ?? this.feedbacks,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      lastId: lastId ?? this.lastId,
      error: error,
    );
  }
}

@riverpod
class GetFeedbacksNotifier extends _$GetFeedbacksNotifier {
  @override
  GetFeedbacksState build() => const GetFeedbacksState();

  Future<void> fetchFeedbacks({String? search}) async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, error: null);

    final usecase = ref.read(getFeedbacksUsecaseProvider);
    final result = await usecase(search: search, lastId: state.lastId);

    if (result.isSuccess) {
      final feedbacks = result.resultValue ?? [];
      final hasMore = feedbacks.length >= 10;
      final lastId = feedbacks.isNotEmpty ? feedbacks.last.id : state.lastId;

      state = state.copyWith(
        feedbacks: [...state.feedbacks, ...feedbacks],
        isLoading: false,
        hasMore: hasMore,
        lastId: lastId,
      );
    } else {
      state = state.copyWith(isLoading: false, error: result.errorMessage);
    }
  }

  Future<void> loadMore({String? search}) async {
    if (!state.hasMore || state.isLoading) return;
    await fetchFeedbacks(search: search);
  }

  void reset() {
    state = const GetFeedbacksState();
  }
}
