import '../../../../core/app/result.dart';
import '../../data/invitation_repository.dart';
import '../entities/invitation_entity.dart';

class GetInvitationsUsecase {
  final InvitationRepository repository;

  GetInvitationsUsecase({required this.repository});

  Future<Result<List<InvitationEntity>>> call({
    required String status,
    bool forOwner = false,
    String? lastId,
    int limit = 10,
  }) async {
    return await repository.getInvitations(
      status: status,
      forOwner: forOwner,
      lastId: lastId,
      limit: limit,
    );
  }
}
