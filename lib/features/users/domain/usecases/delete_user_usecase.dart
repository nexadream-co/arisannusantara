import '../../../../core/app/result.dart';
import '../../data/user_repository.dart';

class DeleteUserUsecase {
  final UserRepository repository;

  DeleteUserUsecase({required this.repository});

  Future<Result<String>> call({required String userId}) async {
    return await repository.deleteUser(userId: userId);
  }
}
