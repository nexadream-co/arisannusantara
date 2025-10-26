import '../../../../core/app/result.dart';
import '../../data/auth_repository.dart';

class SendEmailVerificationUsecase {
  final AuthRepository repository;

  SendEmailVerificationUsecase({required this.repository});

  Future<Result<String>> call() async {
    final result = await repository.sendEmailVerification();
    return result;
  }
}
