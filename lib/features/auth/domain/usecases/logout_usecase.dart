import '../../../../core/app/result.dart';
import '../../data/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository repository;

  LogoutUsecase({required this.repository});

  Future<Result<String>> call() async {
    final result = await repository.logout();
    return result;
  }
}
