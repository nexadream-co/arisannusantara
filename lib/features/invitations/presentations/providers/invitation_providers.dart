import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/invitation_repository.dart';
import '../../domain/usecases/create_invitation_by_group_code_usecase.dart';
import '../../domain/usecases/create_invitation_usecase.dart';
import '../../domain/usecases/get_invitations_usecase.dart';
import '../../domain/usecases/update_invitation_status_usecase.dart';

part 'invitation_providers.g.dart';

@riverpod
InvitationRepository invitationRepository(Ref ref) {
  return InvitationRepository();
}

@riverpod
GetInvitationsUsecase getInvitationsUsecase(Ref ref) {
  final repository = ref.read(invitationRepositoryProvider);
  return GetInvitationsUsecase(repository: repository);
}

@riverpod
CreateInvitationUsecase createInvitationUsecase(Ref ref) {
  final repository = ref.read(invitationRepositoryProvider);
  return CreateInvitationUsecase(repository: repository);
}

@riverpod
CreateInvitationByGroupCodeUsecase createInvitationByGroupCodeUsecase(Ref ref) {
  final repository = ref.read(invitationRepositoryProvider);
  return CreateInvitationByGroupCodeUsecase(repository: repository);
}

@riverpod
UpdateInvitationStatusUsecase updateInvitationStatusUsecase(Ref ref) {
  final repository = ref.read(invitationRepositoryProvider);
  return UpdateInvitationStatusUsecase(repository: repository);
}
