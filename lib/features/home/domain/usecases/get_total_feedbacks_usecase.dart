import '../../../../config/enums/period_filter.dart';
import '../../../../core/app/result.dart';
import '../../data/home_repository.dart';

class GetTotalFeedbacksUsecase {
  final HomeRepository repository;

  GetTotalFeedbacksUsecase({required this.repository});

  Future<Result<int>> call({required PeriodFilter period}) async {
    return await repository.getTotalFeedbacks(period: period);
  }
}
