import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/app/result.dart';
import '../../domain/entities/group_entity.dart';
import 'group_providers.dart';

part 'get_group_detail_provider.g.dart';

@riverpod
Future<Result<GroupEntity>> getGroupDetail(Ref ref, String groupId) async {
  final usecase = ref.watch(getGroupDetailUsecaseProvider);
  return await usecase(groupId);
}
