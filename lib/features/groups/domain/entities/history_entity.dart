import 'package:freezed_annotation/freezed_annotation.dart';

import 'group_entity.dart';
import 'member_entity.dart';

part 'history_entity.freezed.dart';
part 'history_entity.g.dart';

@freezed
abstract class HistoryEntity with _$HistoryEntity {
  const factory HistoryEntity({
    String? id,
    String? groupId,
    DateTime? date,
    String? notes,
    int? amount,
    String? reward,
    GroupEntity? group,
    List<MemberEntity>? members,
    int? periodOrder,
    List<String>? winnerIds,
    List<MemberEntity>? winners,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _HistoryEntity;

  factory HistoryEntity.fromJson(Map<String, dynamic> json) =>
      _$HistoryEntityFromJson(json);
}
