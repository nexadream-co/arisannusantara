import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/member_entity.dart';

class GetMemberDetailUsecase {
  final GroupRepository repository;

  GetMemberDetailUsecase({required this.repository});

  Future<Result<MemberEntity>> call(String memberId) async {
    return await repository.getMemberDetail(memberId);
  }
}
