import '../../../../config/enums/period_filter.dart';
import '../../../../core/app/result.dart';
import '../../data/home_repository.dart';

class GetTotalUsersUsecase {
  final HomeRepository repository;

  GetTotalUsersUsecase({required this.repository});

  Future<Result<int>> call({required PeriodFilter period}) async {
    return await repository.getTotalUsers(period: period);
  }
}
