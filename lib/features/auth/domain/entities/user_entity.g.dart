// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  id: json['id'] as String,
  name: json['name'] as String?,
  email: json['email'] as String,
  photoUrl: json['photoUrl'] as String?,
  role: json['role'] as String?,
  emailVerified: json['emailVerified'] as bool? ?? true,
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'role': instance.role,
      'emailVerified': instance.emailVerified,
    };
