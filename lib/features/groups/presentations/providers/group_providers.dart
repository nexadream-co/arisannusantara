import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/group_repository.dart';
import '../../domain/usecases/create_group_usecase.dart';
import '../../domain/usecases/get_group_detail_usecase.dart';
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

@riverpod
CreateGroupUsecase createGroupUsecase(Ref ref) {
  final repository = ref.watch(groupRepositoryProvider);
  return CreateGroupUsecase(repository: repository);
}

@riverpod
GetGroupDetailUsecase getGroupDetailUsecase(Ref ref) {
  final repository = ref.watch(groupRepositoryProvider);
  return GetGroupDetailUsecase(repository: repository);
}
