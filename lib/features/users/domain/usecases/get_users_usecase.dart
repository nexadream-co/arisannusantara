import '../../../../core/app/result.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../data/user_repository.dart';

class GetUsersUsecase {
  final UserRepository repository;

  GetUsersUsecase({required this.repository});

  Future<Result<List<UserEntity>>> call({
    String? search,
    String? lastId,
    int limit = 10,
  }) async {
    return await repository.getUsers(
      search: search,
      lastId: lastId,
      limit: limit,
    );
  }
}
