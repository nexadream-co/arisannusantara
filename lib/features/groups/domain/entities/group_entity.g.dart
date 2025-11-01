// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GroupEntity _$GroupEntityFromJson(Map<String, dynamic> json) => _GroupEntity(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  code: json['code'] as String?,
  reward: json['reward'] as String?,
  status: json['status'] as String?,
  periodsType: json['periodsType'] as String?,
  periodsDate: json['periodsDate'] == null
      ? null
      : DateTime.parse(json['periodsDate'] as String),
  dues: (json['dues'] as num?)?.toDouble(),
  target: (json['target'] as num?)?.toDouble(),
  maxWinner: (json['maxWinner'] as num?)?.toInt(),
  owners: (json['owners'] as List<dynamic>?)?.map((e) => e as String).toList(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  paymentAccounts: (json['paymentAccounts'] as List<dynamic>?)
      ?.map((e) => PaymentAccountEntity.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GroupEntityToJson(_GroupEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'code': instance.code,
      'reward': instance.reward,
      'status': instance.status,
      'periodsType': instance.periodsType,
      'periodsDate': instance.periodsDate?.toIso8601String(),
      'dues': instance.dues,
      'target': instance.target,
      'maxWinner': instance.maxWinner,
      'owners': instance.owners,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'paymentAccounts': instance.paymentAccounts,
    };
