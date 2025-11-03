import '../../../../core/app/result.dart';
import '../../data/invitation_repository.dart';

class UpdateInvitationStatusUsecase {
  final InvitationRepository repository;

  UpdateInvitationStatusUsecase({required this.repository});

  Future<Result<String>> call({
    required String invitationId,
    required String newStatus,
  }) async {
    return await repository.updateInvitationStatus(
      invitationId: invitationId,
      newStatus: newStatus,
    );
  }
}
