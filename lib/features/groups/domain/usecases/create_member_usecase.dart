import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/member_entity.dart';

class CreateMemberUsecase {
  final GroupRepository repository;

  CreateMemberUsecase({required this.repository});

  Future<Result<String>> call({
    required MemberEntity member,
    required String userEmail,
  }) async {
    return await repository.createMember(member: member, userEmail: userEmail);
  }
}
