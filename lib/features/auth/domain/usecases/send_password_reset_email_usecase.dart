import '../../../../core/app/result.dart';
import '../../data/auth_repository.dart';

class SendPasswordResetEmailUsecase {
  final AuthRepository repository;

  SendPasswordResetEmailUsecase({required this.repository});

  Future<Result<String>> call(String email) async {
    final result = await repository.sendPasswordResetEmail(email);
    return result;
  }
}
