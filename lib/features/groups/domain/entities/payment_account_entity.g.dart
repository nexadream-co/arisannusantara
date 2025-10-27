// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_account_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentAccountEntity _$PaymentAccountEntityFromJson(
  Map<String, dynamic> json,
) => _PaymentAccountEntity(
  id: json['id'] as String?,
  accountName: json['accountName'] as String?,
  bankName: json['bankName'] as String?,
  bankNumber: json['bankNumber'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$PaymentAccountEntityToJson(
  _PaymentAccountEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'accountName': instance.accountName,
  'bankName': instance.bankName,
  'bankNumber': instance.bankNumber,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
