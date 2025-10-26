import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    required String role, // 'user' or 'superadmin'
    @Default(true) bool emailVerified,
  }) = _UserEntity;
}
