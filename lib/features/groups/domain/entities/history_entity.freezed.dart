// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryEntity {

 String? get id; String? get groupId; DateTime? get date; String? get notes; int? get amount; String? get reward; GroupEntity? get group; List<MemberEntity>? get members; int? get periodOrder; List<String>? get winnerIds; List<MemberEntity>? get winners; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of HistoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryEntityCopyWith<HistoryEntity> get copyWith => _$HistoryEntityCopyWithImpl<HistoryEntity>(this as HistoryEntity, _$identity);

  /// Serializes this HistoryEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.date, date) || other.date == date)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.reward, reward) || other.reward == reward)&&(identical(other.group, group) || other.group == group)&&const DeepCollectionEquality().equals(other.members, members)&&(identical(other.periodOrder, periodOrder) || other.periodOrder == periodOrder)&&const DeepCollectionEquality().equals(other.winnerIds, winnerIds)&&const DeepCollectionEquality().equals(other.winners, winners)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,groupId,date,notes,amount,reward,group,const DeepCollectionEquality().hash(members),periodOrder,const DeepCollectionEquality().hash(winnerIds),const DeepCollectionEquality().hash(winners),createdAt,updatedAt);

@override
String toString() {
  return 'HistoryEntity(id: $id, groupId: $groupId, date: $date, notes: $notes, amount: $amount, reward: $reward, group: $group, members: $members, periodOrder: $periodOrder, winnerIds: $winnerIds, winners: $winners, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $HistoryEntityCopyWith<$Res>  {
  factory $HistoryEntityCopyWith(HistoryEntity value, $Res Function(HistoryEntity) _then) = _$HistoryEntityCopyWithImpl;
@useResult
$Res call({
 String? id, String? groupId, DateTime? date, String? notes, int? amount, String? reward, GroupEntity? group, List<MemberEntity>? members, int? periodOrder, List<String>? winnerIds, List<MemberEntity>? winners, DateTime? createdAt, DateTime? updatedAt
});


$GroupEntityCopyWith<$Res>? get group;

}
/// @nodoc
class _$HistoryEntityCopyWithImpl<$Res>
    implements $HistoryEntityCopyWith<$Res> {
  _$HistoryEntityCopyWithImpl(this._self, this._then);

  final HistoryEntity _self;
  final $Res Function(HistoryEntity) _then;

/// Create a copy of HistoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? groupId = freezed,Object? date = freezed,Object? notes = freezed,Object? amount = freezed,Object? reward = freezed,Object? group = freezed,Object? members = freezed,Object? periodOrder = freezed,Object? winnerIds = freezed,Object? winners = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,reward: freezed == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupEntity?,members: freezed == members ? _self.members : members // ignore: cast_nullable_to_non_nullable
as List<MemberEntity>?,periodOrder: freezed == periodOrder ? _self.periodOrder : periodOrder // ignore: cast_nullable_to_non_nullable
as int?,winnerIds: freezed == winnerIds ? _self.winnerIds : winnerIds // ignore: cast_nullable_to_non_nullable
as List<String>?,winners: freezed == winners ? _self.winners : winners // ignore: cast_nullable_to_non_nullable
as List<MemberEntity>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of HistoryEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GroupEntityCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $GroupEntityCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryEntity].
extension HistoryEntityPatterns on HistoryEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryEntity value)  $default,){
final _that = this;
switch (_that) {
case _HistoryEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? groupId,  DateTime? date,  String? notes,  int? amount,  String? reward,  GroupEntity? group,  List<MemberEntity>? members,  int? periodOrder,  List<String>? winnerIds,  List<MemberEntity>? winners,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryEntity() when $default != null:
return $default(_that.id,_that.groupId,_that.date,_that.notes,_that.amount,_that.reward,_that.group,_that.members,_that.periodOrder,_that.winnerIds,_that.winners,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? groupId,  DateTime? date,  String? notes,  int? amount,  String? reward,  GroupEntity? group,  List<MemberEntity>? members,  int? periodOrder,  List<String>? winnerIds,  List<MemberEntity>? winners,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _HistoryEntity():
return $default(_that.id,_that.groupId,_that.date,_that.notes,_that.amount,_that.reward,_that.group,_that.members,_that.periodOrder,_that.winnerIds,_that.winners,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? groupId,  DateTime? date,  String? notes,  int? amount,  String? reward,  GroupEntity? group,  List<MemberEntity>? members,  int? periodOrder,  List<String>? winnerIds,  List<MemberEntity>? winners,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _HistoryEntity() when $default != null:
return $default(_that.id,_that.groupId,_that.date,_that.notes,_that.amount,_that.reward,_that.group,_that.members,_that.periodOrder,_that.winnerIds,_that.winners,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryEntity implements HistoryEntity {
  const _HistoryEntity({this.id, this.groupId, this.date, this.notes, this.amount, this.reward, this.group, final  List<MemberEntity>? members, this.periodOrder, final  List<String>? winnerIds, final  List<MemberEntity>? winners, this.createdAt, this.updatedAt}): _members = members,_winnerIds = winnerIds,_winners = winners;
  factory _HistoryEntity.fromJson(Map<String, dynamic> json) => _$HistoryEntityFromJson(json);

@override final  String? id;
@override final  String? groupId;
@override final  DateTime? date;
@override final  String? notes;
@override final  int? amount;
@override final  String? reward;
@override final  GroupEntity? group;
 final  List<MemberEntity>? _members;
@override List<MemberEntity>? get members {
  final value = _members;
  if (value == null) return null;
  if (_members is EqualUnmodifiableListView) return _members;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? periodOrder;
 final  List<String>? _winnerIds;
@override List<String>? get winnerIds {
  final value = _winnerIds;
  if (value == null) return null;
  if (_winnerIds is EqualUnmodifiableListView) return _winnerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<MemberEntity>? _winners;
@override List<MemberEntity>? get winners {
  final value = _winners;
  if (value == null) return null;
  if (_winners is EqualUnmodifiableListView) return _winners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of HistoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryEntityCopyWith<_HistoryEntity> get copyWith => __$HistoryEntityCopyWithImpl<_HistoryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.date, date) || other.date == date)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.reward, reward) || other.reward == reward)&&(identical(other.group, group) || other.group == group)&&const DeepCollectionEquality().equals(other._members, _members)&&(identical(other.periodOrder, periodOrder) || other.periodOrder == periodOrder)&&const DeepCollectionEquality().equals(other._winnerIds, _winnerIds)&&const DeepCollectionEquality().equals(other._winners, _winners)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,groupId,date,notes,amount,reward,group,const DeepCollectionEquality().hash(_members),periodOrder,const DeepCollectionEquality().hash(_winnerIds),const DeepCollectionEquality().hash(_winners),createdAt,updatedAt);

@override
String toString() {
  return 'HistoryEntity(id: $id, groupId: $groupId, date: $date, notes: $notes, amount: $amount, reward: $reward, group: $group, members: $members, periodOrder: $periodOrder, winnerIds: $winnerIds, winners: $winners, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$HistoryEntityCopyWith<$Res> implements $HistoryEntityCopyWith<$Res> {
  factory _$HistoryEntityCopyWith(_HistoryEntity value, $Res Function(_HistoryEntity) _then) = __$HistoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? groupId, DateTime? date, String? notes, int? amount, String? reward, GroupEntity? group, List<MemberEntity>? members, int? periodOrder, List<String>? winnerIds, List<MemberEntity>? winners, DateTime? createdAt, DateTime? updatedAt
});


@override $GroupEntityCopyWith<$Res>? get group;

}
/// @nodoc
class __$HistoryEntityCopyWithImpl<$Res>
    implements _$HistoryEntityCopyWith<$Res> {
  __$HistoryEntityCopyWithImpl(this._self, this._then);

  final _HistoryEntity _self;
  final $Res Function(_HistoryEntity) _then;

/// Create a copy of HistoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? groupId = freezed,Object? date = freezed,Object? notes = freezed,Object? amount = freezed,Object? reward = freezed,Object? group = freezed,Object? members = freezed,Object? periodOrder = freezed,Object? winnerIds = freezed,Object? winners = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_HistoryEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,reward: freezed == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupEntity?,members: freezed == members ? _self._members : members // ignore: cast_nullable_to_non_nullable
as List<MemberEntity>?,periodOrder: freezed == periodOrder ? _self.periodOrder : periodOrder // ignore: cast_nullable_to_non_nullable
as int?,winnerIds: freezed == winnerIds ? _self._winnerIds : winnerIds // ignore: cast_nullable_to_non_nullable
as List<String>?,winners: freezed == winners ? _self._winners : winners // ignore: cast_nullable_to_non_nullable
as List<MemberEntity>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of HistoryEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GroupEntityCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $GroupEntityCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}
}

// dart format on
