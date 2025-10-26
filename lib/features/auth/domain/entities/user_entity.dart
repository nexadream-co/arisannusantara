import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    String? name,
    required String email,
    String? photoUrl,
    String? role, // 'user' or 'superadmin'
    @Default(true) bool emailVerified,
  }) = _UserEntity;
}
