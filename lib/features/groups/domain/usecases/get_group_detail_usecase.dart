import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/group_entity.dart';

class GetGroupDetailUsecase {
  final GroupRepository repository;

  GetGroupDetailUsecase({required this.repository});

  Future<Result<GroupEntity>> call(String groupId) async {
    return await repository.getGroupDetail(groupId);
  }
}
