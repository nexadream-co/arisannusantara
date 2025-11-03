import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/group_repository.dart';
import '../../domain/usecases/get_groups_usecase.dart';

part 'group_providers.g.dart';

@riverpod
GroupRepository groupRepository(Ref ref) {
  return GroupRepository();
}

@riverpod
GetGroupsUsecase getGroupsUsecase(Ref ref) {
  final repository = ref.watch(groupRepositoryProvider);
  return GetGroupsUsecase(repository: repository);
}
