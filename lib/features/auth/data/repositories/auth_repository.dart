import '../../../../core/app/result.dart';
import '../../domain/entities/user_entity.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;

  AuthRepository({required this.remote, required this.local});

  Future<Result<UserEntity>> login(String email, String password) async {
    final result = await remote.login(email, password);
    if (result.isSuccess) {
      await local.saveUser(result.resultValue!);
    }

    return result;
  }

  Future<void> logout() async {
    await local.clearUser();
  }

  Future<UserEntity?> getSession() async {
    return await local.getUser();
  }
}
