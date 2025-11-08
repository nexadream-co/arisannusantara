import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';

class RemoveGroupOwnerUsecase {
  final GroupRepository repository;

  RemoveGroupOwnerUsecase({required this.repository});

  Future<Result<String>> call(String groupId, String userId) async {
    return await repository.removeGroupOwner(groupId, userId);
  }
}
