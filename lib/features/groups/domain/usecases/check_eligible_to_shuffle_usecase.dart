import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';

class CheckEligibleToShuffleUsecase {
  final GroupRepository repository;

  CheckEligibleToShuffleUsecase({required this.repository});

  Future<Result<bool>> call({required String groupId}) async {
    return await repository.checkEligibleToShuffle(groupId: groupId);
  }
}
