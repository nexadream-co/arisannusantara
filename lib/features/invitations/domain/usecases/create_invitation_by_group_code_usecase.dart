import '../../../../core/app/result.dart';
import '../../data/invitation_repository.dart';

class CreateInvitationByGroupCodeUsecase {
  final InvitationRepository repository;

  CreateInvitationByGroupCodeUsecase({required this.repository});

  Future<Result<String>> call({required String code}) async {
    return await repository.createInvitationByGroupCode(code);
  }
}
