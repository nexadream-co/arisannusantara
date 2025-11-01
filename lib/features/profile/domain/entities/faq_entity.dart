import 'package:freezed_annotation/freezed_annotation.dart';

part 'faq_entity.freezed.dart';
part 'faq_entity.g.dart';

@freezed
abstract class FaqEntity with _$FaqEntity {
  const factory FaqEntity({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FaqEntity;

  factory FaqEntity.fromJson(Map<String, dynamic> json) =>
      _$FaqEntityFromJson(json);
}
