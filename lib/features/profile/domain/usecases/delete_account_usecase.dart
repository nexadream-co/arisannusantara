import '../../../../core/app/result.dart';
import '../../data/profile_repository.dart';

class DeleteAccountUsecase {
  final ProfileRepository repository;

  DeleteAccountUsecase({required this.repository});

  Future<Result<String>> call(String password) async {
    return await repository.deleteAccount(password: password);
  }
}
