import '../../../../config/enums/group_filter.dart';
import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/group_entity.dart';

class GetGroupsUsecase {
  final GroupRepository repository;

  GetGroupsUsecase({required this.repository});

  Future<Result<List<GroupEntity>>> call({
    String? search,
    GroupFilter filter = GroupFilter.all,
    String? lastId,
    int limit = 10,
  }) async {
    return await repository.getGroups(
      search: search,
      filter: filter,
      lastId: lastId,
      limit: limit,
    );
  }
}
