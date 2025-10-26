import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/auth_repository.dart';
import '../../domain/usecases/login_email_password_usecase.dart';
import '../../domain/usecases/login_google_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_user_with_email_password_usecase.dart';
import '../../domain/usecases/send_email_verification_usecase.dart';
import '../../domain/usecases/send_password_reset_email_usecase.dart';

part 'auth_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository();
}

@riverpod
LoginEmailPasswordUsecase loginEmailPasswordUsecase(Ref ref) {
  return LoginEmailPasswordUsecase(
    repository: ref.read(authRepositoryProvider),
  );
}

@riverpod
LoginGoogleUsecase loginGoogleUsecase(Ref ref) {
  return LoginGoogleUsecase(repository: ref.read(authRepositoryProvider));
}

@riverpod
RegisterUserWithEmailPasswordUsecase registerUserWithEmailPasswordUsecase(
  Ref ref,
) {
  return RegisterUserWithEmailPasswordUsecase(
    repository: ref.read(authRepositoryProvider),
  );
}

@riverpod
SendEmailVerificationUsecase sendEmailVerificationUsecase(Ref ref) {
  return SendEmailVerificationUsecase(
    repository: ref.read(authRepositoryProvider),
  );
}

@riverpod
SendPasswordResetEmailUsecase sendPasswordResetEmailUsecase(Ref ref) {
  return SendPasswordResetEmailUsecase(
    repository: ref.read(authRepositoryProvider),
  );
}

@riverpod
LogoutUsecase logoutUsecase(Ref ref) {
  return LogoutUsecase(repository: ref.read(authRepositoryProvider));
}
