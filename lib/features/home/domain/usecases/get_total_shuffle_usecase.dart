import '../../../../config/enums/period_filter.dart';
import '../../../../core/app/result.dart';
import '../../data/home_repository.dart';

class GetTotalShuffleUsecase {
  final HomeRepository repository;

  GetTotalShuffleUsecase({required this.repository});

  Future<Result<int>> call({required PeriodFilter period}) async {
    return await repository.getTotalShuffle(period: period);
  }
}
