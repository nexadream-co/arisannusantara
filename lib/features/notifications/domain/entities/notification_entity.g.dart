// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationEntity _$NotificationEntityFromJson(Map<String, dynamic> json) =>
    _NotificationEntity(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      route: json['route'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$NotificationEntityToJson(_NotificationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'route': instance.route,
      'data': instance.data,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
