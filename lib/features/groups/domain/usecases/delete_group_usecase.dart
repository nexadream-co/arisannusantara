import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';

class DeleteGroupUsecase {
  final GroupRepository repository;

  DeleteGroupUsecase({required this.repository});

  Future<Result<String>> call(String groupId) async {
    return await repository.deleteGroup(groupId);
  }
}
