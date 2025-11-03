import '../../../../core/app/result.dart';
import '../../data/profile_repository.dart';

class UpdatePasswordUsecase {
  final ProfileRepository repository;

  UpdatePasswordUsecase({required this.repository});

  Future<Result<String>> call({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    return await repository.updatePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
  }
}
