import '../../../../config/enums/period_filter.dart';
import '../../../../core/app/result.dart';
import '../../data/home_repository.dart';

class GetTotalGroupsUsecase {
  final HomeRepository repository;

  GetTotalGroupsUsecase({required this.repository});

  Future<Result<int>> call({required PeriodFilter period}) async {
    return await repository.getTotalGroups(period: period);
  }
}
