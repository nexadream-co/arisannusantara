import '../../../../config/enums/payment_status_enum.dart';
import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/member_entity.dart';

class GetMembersUsecase {
  final GroupRepository repository;

  GetMembersUsecase({required this.repository});

  Future<Result<List<MemberEntity>>> call({
    required String groupId,
    String? search,
    bool? isActive,
    PaymentStatusEnum? paymentStatus,
    bool? hasReward,
  }) async {
    return await repository.getMembers(
      groupId: groupId,
      query: search,
      isActive: isActive,
      paymentStatus: paymentStatus,
      hasReward: hasReward,
    );
  }
}
