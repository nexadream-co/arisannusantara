import '../../../../core/app/result.dart';
import '../../data/user_repository.dart';

class CreateUserUsecase {
  final UserRepository repository;

  CreateUserUsecase({required this.repository});

  Future<Result<String>> call({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    String role = 'user',
    String? phoneNumber,
    String? photoUrl,
  }) async {
    return await repository.createUser(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      role: role,
      phoneNumber: phoneNumber,
      photoUrl: photoUrl,
    );
  }
}
