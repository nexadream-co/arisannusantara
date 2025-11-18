import '../../../../core/app/result.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../data/group_repository.dart';

class GetGroupOwnersByCodeUsecase {
  final GroupRepository repository;

  GetGroupOwnersByCodeUsecase({required this.repository});

  Future<Result<List<UserEntity>>> call(String code) async {
    return await repository.getGroupOwnersByCode(code);
  }
}
