import '../../../../core/app/result.dart';
import '../../data/user_repository.dart';

class UpdateUserUsecase {
  final UserRepository repository;

  UpdateUserUsecase({required this.repository});

  Future<Result<String>> call({
    required String userId,
    String? name,
    String? photoUrl,
    String? phoneNumber,
    String? role,
  }) async {
    return await repository.updateUser(
      userId: userId,
      name: name,
      photoUrl: photoUrl,
      phoneNumber: phoneNumber,
      role: role,
    );
  }
}
