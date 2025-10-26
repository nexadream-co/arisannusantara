import '../../../../core/app/result.dart';
import '../../data/auth_repository.dart';

class LoginEmailPasswordUsecase {
  final AuthRepository repository;

  LoginEmailPasswordUsecase({required this.repository});

  Future<Result<String>> call({
    required String email,
    required String password,
  }) async {
    final result = await repository.loginByEmailPassword(email, password);
    return result;
  }
}
