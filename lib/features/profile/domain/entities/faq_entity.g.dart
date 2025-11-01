// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaqEntity _$FaqEntityFromJson(Map<String, dynamic> json) => _FaqEntity(
  id: json['id'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$FaqEntityToJson(_FaqEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
