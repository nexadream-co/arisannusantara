// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => _UserEntity(
  id: json['id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  photoUrl: json['photoUrl'] as String?,
  gender: json['gender'] as String?,
  deviceToken: json['deviceToken'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  role: json['role'] as String?,
  emailVerified: json['emailVerified'] as bool? ?? true,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserEntityToJson(_UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'gender': instance.gender,
      'deviceToken': instance.deviceToken,
      'phoneNumber': instance.phoneNumber,
      'role': instance.role,
      'emailVerified': instance.emailVerified,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
