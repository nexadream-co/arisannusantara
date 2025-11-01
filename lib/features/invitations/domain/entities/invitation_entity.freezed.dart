// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InvitationEntity {

 String? get id; String? get groupId; String? get userId; String? get status; List<String>? get groupOwnerIds; UserEntity? get user; GroupEntity? get group; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of InvitationEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvitationEntityCopyWith<InvitationEntity> get copyWith => _$InvitationEntityCopyWithImpl<InvitationEntity>(this as InvitationEntity, _$identity);

  /// Serializes this InvitationEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvitationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.groupOwnerIds, groupOwnerIds)&&(identical(other.user, user) || other.user == user)&&(identical(other.group, group) || other.group == group)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,groupId,userId,status,const DeepCollectionEquality().hash(groupOwnerIds),user,group,createdAt,updatedAt);

@override
String toString() {
  return 'InvitationEntity(id: $id, groupId: $groupId, userId: $userId, status: $status, groupOwnerIds: $groupOwnerIds, user: $user, group: $group, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $InvitationEntityCopyWith<$Res>  {
  factory $InvitationEntityCopyWith(InvitationEntity value, $Res Function(InvitationEntity) _then) = _$InvitationEntityCopyWithImpl;
@useResult
$Res call({
 String? id, String? groupId, String? userId, String? status, List<String>? groupOwnerIds, UserEntity? user, GroupEntity? group, DateTime? createdAt, DateTime? updatedAt
});


$UserEntityCopyWith<$Res>? get user;$GroupEntityCopyWith<$Res>? get group;

}
/// @nodoc
class _$InvitationEntityCopyWithImpl<$Res>
    implements $InvitationEntityCopyWith<$Res> {
  _$InvitationEntityCopyWithImpl(this._self, this._then);

  final InvitationEntity _self;
  final $Res Function(InvitationEntity) _then;

/// Create a copy of InvitationEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? groupId = freezed,Object? userId = freezed,Object? status = freezed,Object? groupOwnerIds = freezed,Object? user = freezed,Object? group = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,groupOwnerIds: freezed == groupOwnerIds ? _self.groupOwnerIds : groupOwnerIds // ignore: cast_nullable_to_non_nullable
as List<String>?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupEntity?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of InvitationEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of InvitationEntity
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


/// Adds pattern-matching-related methods to [InvitationEntity].
extension InvitationEntityPatterns on InvitationEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InvitationEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InvitationEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InvitationEntity value)  $default,){
final _that = this;
switch (_that) {
case _InvitationEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InvitationEntity value)?  $default,){
final _that = this;
switch (_that) {
case _InvitationEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? groupId,  String? userId,  String? status,  List<String>? groupOwnerIds,  UserEntity? user,  GroupEntity? group,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InvitationEntity() when $default != null:
return $default(_that.id,_that.groupId,_that.userId,_that.status,_that.groupOwnerIds,_that.user,_that.group,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? groupId,  String? userId,  String? status,  List<String>? groupOwnerIds,  UserEntity? user,  GroupEntity? group,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _InvitationEntity():
return $default(_that.id,_that.groupId,_that.userId,_that.status,_that.groupOwnerIds,_that.user,_that.group,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? groupId,  String? userId,  String? status,  List<String>? groupOwnerIds,  UserEntity? user,  GroupEntity? group,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _InvitationEntity() when $default != null:
return $default(_that.id,_that.groupId,_that.userId,_that.status,_that.groupOwnerIds,_that.user,_that.group,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InvitationEntity implements InvitationEntity {
  const _InvitationEntity({this.id, this.groupId, this.userId, this.status, final  List<String>? groupOwnerIds, this.user, this.group, this.createdAt, this.updatedAt}): _groupOwnerIds = groupOwnerIds;
  factory _InvitationEntity.fromJson(Map<String, dynamic> json) => _$InvitationEntityFromJson(json);

@override final  String? id;
@override final  String? groupId;
@override final  String? userId;
@override final  String? status;
 final  List<String>? _groupOwnerIds;
@override List<String>? get groupOwnerIds {
  final value = _groupOwnerIds;
  if (value == null) return null;
  if (_groupOwnerIds is EqualUnmodifiableListView) return _groupOwnerIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  UserEntity? user;
@override final  GroupEntity? group;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of InvitationEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InvitationEntityCopyWith<_InvitationEntity> get copyWith => __$InvitationEntityCopyWithImpl<_InvitationEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InvitationEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InvitationEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._groupOwnerIds, _groupOwnerIds)&&(identical(other.user, user) || other.user == user)&&(identical(other.group, group) || other.group == group)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,groupId,userId,status,const DeepCollectionEquality().hash(_groupOwnerIds),user,group,createdAt,updatedAt);

@override
String toString() {
  return 'InvitationEntity(id: $id, groupId: $groupId, userId: $userId, status: $status, groupOwnerIds: $groupOwnerIds, user: $user, group: $group, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$InvitationEntityCopyWith<$Res> implements $InvitationEntityCopyWith<$Res> {
  factory _$InvitationEntityCopyWith(_InvitationEntity value, $Res Function(_InvitationEntity) _then) = __$InvitationEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? groupId, String? userId, String? status, List<String>? groupOwnerIds, UserEntity? user, GroupEntity? group, DateTime? createdAt, DateTime? updatedAt
});


@override $UserEntityCopyWith<$Res>? get user;@override $GroupEntityCopyWith<$Res>? get group;

}
/// @nodoc
class __$InvitationEntityCopyWithImpl<$Res>
    implements _$InvitationEntityCopyWith<$Res> {
  __$InvitationEntityCopyWithImpl(this._self, this._then);

  final _InvitationEntity _self;
  final $Res Function(_InvitationEntity) _then;

/// Create a copy of InvitationEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? groupId = freezed,Object? userId = freezed,Object? status = freezed,Object? groupOwnerIds = freezed,Object? user = freezed,Object? group = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_InvitationEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,groupOwnerIds: freezed == groupOwnerIds ? _self._groupOwnerIds : groupOwnerIds // ignore: cast_nullable_to_non_nullable
as List<String>?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupEntity?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of InvitationEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserEntityCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserEntityCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of InvitationEntity
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
