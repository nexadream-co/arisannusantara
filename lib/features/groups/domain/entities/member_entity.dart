import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../config/enums/payment_status_enum.dart';
import '../../../auth/domain/entities/user_entity.dart';
import 'group_entity.dart';

part 'member_entity.freezed.dart';
part 'member_entity.g.dart';

@freezed
abstract class MemberEntity with _$MemberEntity {
  const factory MemberEntity({
    String? id,
    String? groupId,
    String? email,
    GroupEntity? group,
    UserEntity? user,
    PaymentStatusEnum? paymentStatus,
    bool? isActive,
    bool? hasReward,
    DateTime? paidAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _MemberEntity;

  factory MemberEntity.fromJson(Map<String, dynamic> json) =>
      _$MemberEntityFromJson(json);
}
