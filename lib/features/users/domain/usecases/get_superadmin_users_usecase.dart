import '../../../../core/app/result.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../data/user_repository.dart';

class GetSuperadminUsersUsecase {
  final UserRepository repository;

  GetSuperadminUsersUsecase({required this.repository});

  Future<Result<List<UserEntity>>> call() async {
    return await repository.getSuperadminUsers();
  }
}
