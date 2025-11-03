import '../../../../core/app/result.dart';
import '../../data/invitation_repository.dart';

class CreateInvitationUsecase {
  final InvitationRepository repository;

  CreateInvitationUsecase({required this.repository});

  Future<Result<String>> call({required String groupId}) async {
    return await repository.createInvitation(groupId);
  }
}
