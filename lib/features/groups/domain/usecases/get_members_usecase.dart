import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/member_entity.dart';

class GetMembersUsecase {
  final GroupRepository repository;

  GetMembersUsecase({required this.repository});

  Future<Result<List<MemberEntity>>> call({
    required String groupId,
    String? search,
  }) async {
    return await repository.getMembers(groupId: groupId, query: search);
  }
}
