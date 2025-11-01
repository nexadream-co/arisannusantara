// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvitationEntity _$InvitationEntityFromJson(Map<String, dynamic> json) =>
    _InvitationEntity(
      id: json['id'] as String?,
      groupId: json['groupId'] as String?,
      userId: json['userId'] as String?,
      status: json['status'] as String?,
      groupOwnerIds: (json['groupOwnerIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      user: json['user'] == null
          ? null
          : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      group: json['group'] == null
          ? null
          : GroupEntity.fromJson(json['group'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$InvitationEntityToJson(_InvitationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupId': instance.groupId,
      'userId': instance.userId,
      'status': instance.status,
      'groupOwnerIds': instance.groupOwnerIds,
      'user': instance.user,
      'group': instance.group,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
