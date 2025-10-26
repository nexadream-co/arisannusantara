import '../../../../core/app/result.dart';
import '../../data/auth_repository.dart';

class LoginGoogleUsecase {
  final AuthRepository repository;

  LoginGoogleUsecase({required this.repository});

  Future<Result<String>> call() async {
    final result = await repository.loginByGoogle();
    return result;
  }
}
