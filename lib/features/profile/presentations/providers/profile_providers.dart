import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/profile_repository.dart';
import '../../domain/usecases/delete_account_usecase.dart';
import '../../domain/usecases/edit_profile_usecase.dart';
import '../../domain/usecases/update_password_usecase.dart';

part 'profile_providers.g.dart';

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepository();
}

@riverpod
DeleteAccountUsecase deleteAccountUsecase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return DeleteAccountUsecase(repository: repository);
}

@riverpod
EditProfileUsecase editProfileUsecase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return EditProfileUsecase(repository: repository);
}

@riverpod
UpdatePasswordUsecase updatePasswordUsecase(Ref ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return UpdatePasswordUsecase(repository: repository);
}
