import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/user_entity.dart';
import 'auth_providers.dart';

part 'auth_state_provider.g.dart';

@riverpod
class AuthState extends _$AuthState {
  @override
  Future<UserEntity?> build() async {
    // Load user session on startup
    // final session = await ref.read(getUserSessionUseCaseProvider).call();
    // return session;
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final user = await ref
          .read(loginUsecaseProvider)
          .call(email: email, password: password);
      return user.resultValue;
    });
  }

  // Future<void> logout() async {
  //   await ref.read(logoutUseCaseProvider).call();
  //   state = const AsyncData(null);
  // }
}
