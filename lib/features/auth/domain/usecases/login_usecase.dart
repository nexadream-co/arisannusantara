import '../../../../core/app/result.dart';
import '../../data/repositories/auth_repository.dart';
import '../entities/user_entity.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase({required this.repository});

  Future<Result<UserEntity>> call({
    required String email,
    required String password,
  }) async {
    final result = await repository.login(email, password);
    return result;
  }
}
