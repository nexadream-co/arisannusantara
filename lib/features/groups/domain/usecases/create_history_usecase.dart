import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/member_entity.dart';

class CreateHistoryUsecase {
  final GroupRepository repository;

  CreateHistoryUsecase({required this.repository});

  Future<Result<String>> call({
    required String groupId,
    required List<MemberEntity> winners,
  }) async {
    return await repository.createHistory(groupId: groupId, winners: winners);
  }
}
