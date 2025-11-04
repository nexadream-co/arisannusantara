import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/group_entity.dart';

class CreateGroupUsecase {
  final GroupRepository repository;

  CreateGroupUsecase({required this.repository});

  Future<Result<String>> call(GroupEntity group) async {
    return await repository.createGroup(group);
  }
}
