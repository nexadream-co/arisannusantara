import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/group_entity.dart';

class UpdateGroupUsecase {
  final GroupRepository repository;

  UpdateGroupUsecase({required this.repository});

  Future<Result<String>> call(GroupEntity group) async {
    return await repository.updateGroup(group);
  }
}
