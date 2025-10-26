import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/auth_repository.dart';
import '../../domain/usecases/login_email_password_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';

part 'auth_providers.g.dart';

// Repository
@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}

// Use cases
@riverpod
LoginEmailPasswordUsecase loginEmailPasswordUsecase(Ref ref) {
  return LoginEmailPasswordUsecase(
    repository: ref.read(authRepositoryProvider),
  );
}

@riverpod
LogoutUsecase logoutUsecase(Ref ref) {
  return LogoutUsecase(repository: ref.read(authRepositoryProvider));
}
