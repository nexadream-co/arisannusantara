import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';

class GetTotalPaidMembersUsecase {
  final GroupRepository repository;

  GetTotalPaidMembersUsecase({required this.repository});

  Future<Result<int>> call({required String groupId}) async {
    return await repository.getTotalPaidMembers(groupId: groupId);
  }
}
