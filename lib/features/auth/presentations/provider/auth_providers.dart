import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/auth_local_data_source.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';

part 'auth_providers.g.dart';

// Data sources
@riverpod
AuthLocalDataSource authLocalDataSource(Ref ref) {
  return AuthLocalDataSource();
}

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  return AuthRemoteDataSource();
}

// Repository
@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(
    local: ref.watch(authLocalDataSourceProvider),
    remote: ref.watch(authRemoteDataSourceProvider),
  );
}

// Use cases
@riverpod
LoginUsecase loginUsecase(Ref ref) {
  return LoginUsecase(repository: ref.watch(authRepositoryProvider));
}

// @riverpod
// LogoutUseCase logoutUseCase(LogoutUseCaseRef ref) {
//   return LogoutUseCase(ref.watch(authRepositoryProvider));
// }

// @riverpod
// GetUserSessionUseCase getUserSessionUseCase(GetUserSessionUseCaseRef ref) {
//   return GetUserSessionUseCase(ref.watch(authRepositoryProvider));
// }
