// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryEntity _$HistoryEntityFromJson(Map<String, dynamic> json) =>
    _HistoryEntity(
      id: json['id'] as String?,
      groupId: json['groupId'] as String?,
      date: json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String),
      notes: json['notes'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
      reward: json['reward'] as String?,
      group: json['group'] == null
          ? null
          : GroupEntity.fromJson(json['group'] as Map<String, dynamic>),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => MemberEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      periodOrder: (json['periodOrder'] as num?)?.toInt(),
      winnerIds: (json['winnerIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      winners: (json['winners'] as List<dynamic>?)
          ?.map((e) => MemberEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$HistoryEntityToJson(_HistoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'groupId': instance.groupId,
      'date': instance.date?.toIso8601String(),
      'notes': instance.notes,
      'amount': instance.amount,
      'reward': instance.reward,
      'group': instance.group,
      'members': instance.members,
      'periodOrder': instance.periodOrder,
      'winnerIds': instance.winnerIds,
      'winners': instance.winners,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
