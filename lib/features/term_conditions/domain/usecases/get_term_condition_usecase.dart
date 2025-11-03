import '../../../../core/app/result.dart';
import '../../data/term_condition_repository.dart';

class GetTermConditionUsecase {
  final TermConditionRepository repository;

  GetTermConditionUsecase({required this.repository});

  Future<Result<Map<String, dynamic>>> call() async {
    return await repository.getTermAndCondition();
  }
}
