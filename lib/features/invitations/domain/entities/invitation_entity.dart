import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../groups/domain/entities/group_entity.dart';

part 'invitation_entity.freezed.dart';
part 'invitation_entity.g.dart';

@freezed
abstract class InvitationEntity with _$InvitationEntity {
  const factory InvitationEntity({
    String? id,
    String? groupId,
    String? userId,
    String? status,
    List<String>? groupOwnerIds,
    UserEntity? user,
    GroupEntity? group,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _InvitationEntity;

  factory InvitationEntity.fromJson(Map<String, dynamic> json) =>
      _$InvitationEntityFromJson(json);
}
