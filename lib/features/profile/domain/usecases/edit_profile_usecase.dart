import '../../../../core/app/result.dart';
import '../../data/profile_repository.dart';

class EditProfileUsecase {
  final ProfileRepository repository;

  EditProfileUsecase({required this.repository});

  Future<Result<String>> call({
    required String name,
    required String phoneNumber,
    required String gender,
  }) async {
    return await repository.editProfile(
      name: name,
      phoneNumber: phoneNumber,
      gender: gender,
    );
  }
}
