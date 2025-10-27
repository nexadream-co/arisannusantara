import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_account_entity.freezed.dart';
part 'payment_account_entity.g.dart';

@freezed
abstract class PaymentAccountEntity with _$PaymentAccountEntity {
  const factory PaymentAccountEntity({
    String? id,
    String? accountName,
    String? bankName,
    String? bankNumber,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PaymentAccountEntity;

  factory PaymentAccountEntity.fromJson(Map<String, Object?> json) =>
      _$PaymentAccountEntityFromJson(json);
}
