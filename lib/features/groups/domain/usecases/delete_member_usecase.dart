import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';

class DeleteMemberUsecase {
  final GroupRepository repository;

  DeleteMemberUsecase({required this.repository});

  Future<Result<String>> call(String memberId) async {
    return await repository.deleteMember(memberId);
  }
}
