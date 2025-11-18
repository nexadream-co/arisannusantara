import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/group_entity.dart';

class GetGroupDetailByCodeUsecase {
  final GroupRepository repository;

  GetGroupDetailByCodeUsecase({required this.repository});

  Future<Result<GroupEntity>> call(String code) async {
    return await repository.getGroupDetailByCode(code);
  }
}
