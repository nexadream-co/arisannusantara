import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/entities/user_entity.dart';

part 'feedback_entity.freezed.dart';
part 'feedback_entity.g.dart';

@freezed
abstract class FeedbackEntity with _$FeedbackEntity {
  const factory FeedbackEntity({
    String? id,
    String? userId,
    UserEntity? user,
    String? email,
    String? title,
    String? feedback,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FeedbackEntity;

  factory FeedbackEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedbackEntityFromJson(json);
}
