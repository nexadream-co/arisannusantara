import '../../../../core/app/result.dart';
import '../../data/home_repository.dart';

class GetPaidGroupsPercentageUsecase {
  final HomeRepository repository;

  GetPaidGroupsPercentageUsecase({required this.repository});

  Future<Result<double?>> call() async {
    final result = await repository.getPaidGroupsPercentage();
    return result;
  }
}
