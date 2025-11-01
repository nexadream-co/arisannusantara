// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemberEntity _$MemberEntityFromJson(Map<String, dynamic> json) =>
    _MemberEntity(
      id: json['id'] as String?,
      groupId: json['groupId'] as String?,
      group: json['group'] == null
          ? null
          : GroupEntity.fromJson(json['group'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      statusPayment: json['statusPayment'] as String?,
      isActive: json['isActive'] as bool?,
      skip: json['skip'] as bool?,
      hasReward: json['hasReward'] as bool?,
      paidAt: json['paidAt'] == null
          ? null
          : DateTime.parse(json['paidAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MemberEntityToJson(_MemberEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupId': instance.groupId,
      'group': instance.group,
      'user': instance.user,
      'statusPayment': instance.statusPayment,
      'isActive': instance.isActive,
      'skip': instance.skip,
      'hasReward': instance.hasReward,
      'paidAt': instance.paidAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
