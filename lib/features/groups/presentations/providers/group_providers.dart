import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/app/result.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../data/group_repository.dart';
import '../../domain/entities/history_entity.dart';
import '../../domain/entities/member_entity.dart';
import '../../domain/usecases/add_group_owners_usecase.dart';
import '../../domain/usecases/add_payment_account_usecase.dart';
import '../../domain/usecases/create_group_usecase.dart';
import '../../domain/usecases/create_history_usecase.dart';
import '../../domain/usecases/delete_group_usecase.dart';
import '../../domain/usecases/delete_member_usecase.dart';
import '../../domain/usecases/delete_payment_account_usecase.dart';
import '../../domain/usecases/get_group_detail_usecase.dart';
import '../../domain/usecases/get_group_owners_usecase.dart';
import '../../domain/usecases/get_groups_usecase.dart';
import '../../domain/usecases/get_histories_usecase.dart';
import '../../domain/usecases/get_member_detail_usecase.dart';
import '../../domain/usecases/get_members_usecase.dart';
import '../../domain/usecases/get_total_paid_members_usecase.dart';
import '../../domain/usecases/remove_group_owner_usecase.dart';
import '../../domain/usecases/update_group_usecase.dart';
import '../../domain/usecases/update_member_usecase.dart';
import '../../domain/usecases/update_payment_account_usecase.dart';

part 'group_providers.g.dart';

@riverpod
GroupRepository groupRepository(Ref ref) {
  return GroupRepository();
}

@riverpod
GetGroupsUsecase getGroupsUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return GetGroupsUsecase(repository: repository);
}

@riverpod
CreateGroupUsecase createGroupUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return CreateGroupUsecase(repository: repository);
}

@riverpod
UpdateGroupUsecase updateGroupUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return UpdateGroupUsecase(repository: repository);
}

@riverpod
DeleteGroupUsecase deleteGroupUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return DeleteGroupUsecase(repository: repository);
}

@riverpod
GetGroupDetailUsecase getGroupDetailUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return GetGroupDetailUsecase(repository: repository);
}

@riverpod
Future<Result<List<UserEntity>>> getGroupOwners(Ref ref, String groupId) async {
  final repository = ref.read(groupRepositoryProvider);
  final usecase = GetGroupOwnersUsecase(repository: repository);
  return await usecase(groupId);
}

@riverpod
Future<Result<List<MemberEntity>>> getMembers(
  Ref ref,
  String groupId,
  String? search,
) async {
  final repository = ref.read(groupRepositoryProvider);
  final usecase = GetMembersUsecase(repository: repository);
  return await usecase(groupId: groupId, search: search);
}

@riverpod
Future<Result<List<HistoryEntity>>> getHistories(
  Ref ref,
  String groupId,
) async {
  final repository = ref.read(groupRepositoryProvider);
  final usecase = GetHistoriesUsecase(repository: repository);
  return await usecase(groupId);
}

@riverpod
Future<Result<num>> getTotalGroupPaidAmount(Ref ref, String groupId) async {
  final repository = ref.read(groupRepositoryProvider);
  final usecase = GetTotalPaidMembersUsecase(repository: repository);
  return await usecase(groupId: groupId);
}

@riverpod
CreateHistoryUsecase createHistoryUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return CreateHistoryUsecase(repository: repository);
}

@riverpod
Future<Result<MemberEntity>> getMemberDetail(Ref ref, String memberId) async {
  final repository = ref.read(groupRepositoryProvider);
  final usecase = GetMemberDetailUsecase(repository: repository);
  return await usecase(memberId);
}

@riverpod
UpdateMemberUsecase updateMemberUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return UpdateMemberUsecase(repository: repository);
}

@riverpod
DeleteMemberUsecase deleteMemberUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return DeleteMemberUsecase(repository: repository);
}

@riverpod
AddPaymentAccountUsecase addPaymentAccountUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return AddPaymentAccountUsecase(repository: repository);
}

@riverpod
UpdatePaymentAccountUsecase updatePaymentAccountUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return UpdatePaymentAccountUsecase(repository: repository);
}

@riverpod
DeletePaymentAccountUsecase deletePaymentAccountUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return DeletePaymentAccountUsecase(repository: repository);
}

@riverpod
AddGroupOwnersUsecase addGroupOwnersUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return AddGroupOwnersUsecase(repository: repository);
}

@riverpod
RemoveGroupOwnerUsecase removeGroupOwnerUsecase(Ref ref) {
  final repository = ref.read(groupRepositoryProvider);
  return RemoveGroupOwnerUsecase(repository: repository);
}
