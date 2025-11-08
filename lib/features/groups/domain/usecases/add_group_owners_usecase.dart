import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';

class AddGroupOwnersUsecase {
  final GroupRepository repository;

  AddGroupOwnersUsecase({required this.repository});

  Future<Result<String>> call(String groupId, List<String> userIds) async {
    return await repository.addGroupOwners(groupId, userIds);
  }
}
