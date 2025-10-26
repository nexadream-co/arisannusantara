import '../../../../core/app/result.dart';
import '../../data/auth_repository.dart';

class RegisterUserWithEmailPasswordUsecase {
  final AuthRepository repository;

  RegisterUserWithEmailPasswordUsecase({required this.repository});

  Future<Result<String>> call({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final result = await repository.registerUserWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    return result;
  }
}
