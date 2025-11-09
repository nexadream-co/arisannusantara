import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/user_repository.dart';
import '../../domain/usecases/create_user_usecase.dart';
import '../../domain/usecases/delete_user_usecase.dart';
import '../../domain/usecases/get_users_usecase.dart';
import '../../domain/usecases/update_user_usecase.dart';

part 'user_providers.g.dart';

@riverpod
UserRepository userRepository(Ref ref) {
  return UserRepository();
}

@riverpod
GetUsersUsecase getUsersUsecase(Ref ref) {
  final repository = ref.read(userRepositoryProvider);
  return GetUsersUsecase(repository: repository);
}

@riverpod
CreateUserUsecase createUserUsecase(Ref ref) {
  final repository = ref.read(userRepositoryProvider);
  return CreateUserUsecase(repository: repository);
}

@riverpod
UpdateUserUsecase updateUserUsecase(Ref ref) {
  final repository = ref.read(userRepositoryProvider);
  return UpdateUserUsecase(repository: repository);
}

@riverpod
DeleteUserUsecase deleteUserUsecase(Ref ref) {
  final repository = ref.read(userRepositoryProvider);
  return DeleteUserUsecase(repository: repository);
}
