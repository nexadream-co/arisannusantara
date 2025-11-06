import '../../../../core/app/result.dart';
import '../../data/group_repository.dart';
import '../entities/history_entity.dart';

class GetHistoriesUsecase {
  final GroupRepository repository;

  GetHistoriesUsecase({required this.repository});

  Future<Result<List<HistoryEntity>>> call(String groupId) async {
    return await repository.getHistories(groupId);
  }
}
