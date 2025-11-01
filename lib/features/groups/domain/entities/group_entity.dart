import 'package:freezed_annotation/freezed_annotation.dart';

import 'payment_account_entity.dart';

part 'group_entity.freezed.dart';
part 'group_entity.g.dart';

@freezed
abstract class GroupEntity with _$GroupEntity {
  const factory GroupEntity({
    String? id,
    String? name,
    String? description,
    String? code,
    String? reward,
    String? status,
    String? periodsType, // weekly, monthly, yearly
    DateTime? periodsDate,
    double? dues,
    double? target,
    int? maxWinner,
    List<String>? owners,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<PaymentAccountEntity>? paymentAccounts,
  }) = _GroupEntity;

  factory GroupEntity.fromJson(Map<String, dynamic> json) =>
      _$GroupEntityFromJson(json);
}
