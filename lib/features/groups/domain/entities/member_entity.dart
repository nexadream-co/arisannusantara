import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/user_entity.dart';
import 'group_entity.dart';

part 'member_entity.freezed.dart';
part 'member_entity.g.dart';

@freezed
abstract class MemberEntity with _$MemberEntity {
  const factory MemberEntity({
    String? id,
    String? groupId,
    GroupEntity? group,
    UserEntity? user,
    String? statusPayment,
    bool? isActive,
    bool? skip,
    bool? hasReward,
    DateTime? paidAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MemberEntity;

  factory MemberEntity.fromJson(Map<String, dynamic> json) =>
      _$MemberEntityFromJson(json);
}
