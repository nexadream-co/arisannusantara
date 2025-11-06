import '../../../../core/app/result.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../data/group_repository.dart';

class GetGroupOwnersUsecase {
  final GroupRepository repository;

  GetGroupOwnersUsecase({required this.repository});

  Future<Result<List<UserEntity>>> call(String groupId) async {
    return await repository.getGroupOwners(groupId);
  }
}
