import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/member_entity.dart';

class UpdateMemberUsecase {
  final GroupRepository repository;

  UpdateMemberUsecase({required this.repository});

  Future<Result<String>> call(MemberEntity member) async {
    return await repository.updateMember(member);
  }
}
