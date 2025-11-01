import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';
part 'notification_entity.g.dart';

@freezed
abstract class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? type,
    String? route,
    Map<String, dynamic>? data,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _NotificationEntity;

  factory NotificationEntity.fromJson(Map<String, dynamic> json) =>
      _$NotificationEntityFromJson(json);
}
