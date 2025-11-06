// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MemberEntity {

 String? get id; String? get groupId; String? get email; GroupEntity? get group; UserEntity? get user; PaymentStatusEnum? get paymentStatus; bool? get isActive; bool? get hasReward; DateTime? get paidAt; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of MemberEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberEntityCopyWith<MemberEntity> get copyWith => _$MemberEntityCopyWithImpl<MemberEntity>(this as MemberEntity, _$identity);

  /// Serializes this MemberEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.email, email) || other.email == email)&&(identical(other.group, group) || other.group == group)&&(identical(other.user, user) || other.user == user)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.hasReward, hasReward) || other.hasReward == hasReward)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,groupId,email,group,user,paymentStatus,isActive,hasReward,paidAt,createdAt,updatedAt);

@override
String toString() {
  return 'MemberEntity(id: $id, groupId: $groupId, email: $email, group: $group, user: $user, paymentStatus: $paymentStatus, isActive: $isActive, hasReward: $hasReward, paidAt: $paidAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MemberEntityCopyWith<$Res>  {
  factory $MemberEntityCopyWith(MemberEntity value, $Res Function(MemberEntity) _then) = _$MemberEntityCopyWithImpl;
@useResult
$Res call({
 String? id, String? groupId, String? email, GroupEntity? group, UserEntity? user, PaymentStatusEnum? paymentStatus, bool? isActive, bool? hasReward, DateTime? paidAt, DateTime? createdAt, DateTime? updatedAt
});


$GroupEntityCopyWith<$Res>? get group;$UserEntityCopyWith<$Res>? get user;

}
/// @nodoc
class _$MemberEntityCopyWithImpl<$Res>
    implements $MemberEntityCopyWith<$Res> {
  _$MemberEntityCopyWithImpl(this._self, this._then);

  final MemberEntity _self;
  final $Res Function(MemberEntity) _then;

/// Create a copy of MemberEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? groupId = freezed,Object? email = freezed,Object? group = freezed,Object? user = freezed,Object? paymentStatus = freezed,Object? isActive = freezed,Object? hasReward = freezed,Object? paidAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupEntity?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatusEnum?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,hasReward: freezed == hasReward ? _self.hasReward : hasReward // ignore: cast_nullable_to_non_nullable
as bool?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of MemberEntity
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
}/// Create a copy of MemberEntity
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
}
}


/// Adds pattern-matching-related methods to [MemberEntity].
extension MemberEntityPatterns on MemberEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberEntity value)  $default,){
final _that = this;
switch (_that) {
case _MemberEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MemberEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? groupId,  String? email,  GroupEntity? group,  UserEntity? user,  PaymentStatusEnum? paymentStatus,  bool? isActive,  bool? hasReward,  DateTime? paidAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberEntity() when $default != null:
return $default(_that.id,_that.groupId,_that.email,_that.group,_that.user,_that.paymentStatus,_that.isActive,_that.hasReward,_that.paidAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? groupId,  String? email,  GroupEntity? group,  UserEntity? user,  PaymentStatusEnum? paymentStatus,  bool? isActive,  bool? hasReward,  DateTime? paidAt,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MemberEntity():
return $default(_that.id,_that.groupId,_that.email,_that.group,_that.user,_that.paymentStatus,_that.isActive,_that.hasReward,_that.paidAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? groupId,  String? email,  GroupEntity? group,  UserEntity? user,  PaymentStatusEnum? paymentStatus,  bool? isActive,  bool? hasReward,  DateTime? paidAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MemberEntity() when $default != null:
return $default(_that.id,_that.groupId,_that.email,_that.group,_that.user,_that.paymentStatus,_that.isActive,_that.hasReward,_that.paidAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemberEntity implements MemberEntity {
  const _MemberEntity({this.id, this.groupId, this.email, this.group, this.user, this.paymentStatus, this.isActive, this.hasReward, this.paidAt, this.createdAt, this.updatedAt});
  factory _MemberEntity.fromJson(Map<String, dynamic> json) => _$MemberEntityFromJson(json);

@override final  String? id;
@override final  String? groupId;
@override final  String? email;
@override final  GroupEntity? group;
@override final  UserEntity? user;
@override final  PaymentStatusEnum? paymentStatus;
@override final  bool? isActive;
@override final  bool? hasReward;
@override final  DateTime? paidAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of MemberEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberEntityCopyWith<_MemberEntity> get copyWith => __$MemberEntityCopyWithImpl<_MemberEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&(identical(other.email, email) || other.email == email)&&(identical(other.group, group) || other.group == group)&&(identical(other.user, user) || other.user == user)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.hasReward, hasReward) || other.hasReward == hasReward)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,groupId,email,group,user,paymentStatus,isActive,hasReward,paidAt,createdAt,updatedAt);

@override
String toString() {
  return 'MemberEntity(id: $id, groupId: $groupId, email: $email, group: $group, user: $user, paymentStatus: $paymentStatus, isActive: $isActive, hasReward: $hasReward, paidAt: $paidAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MemberEntityCopyWith<$Res> implements $MemberEntityCopyWith<$Res> {
  factory _$MemberEntityCopyWith(_MemberEntity value, $Res Function(_MemberEntity) _then) = __$MemberEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? groupId, String? email, GroupEntity? group, UserEntity? user, PaymentStatusEnum? paymentStatus, bool? isActive, bool? hasReward, DateTime? paidAt, DateTime? createdAt, DateTime? updatedAt
});


@override $GroupEntityCopyWith<$Res>? get group;@override $UserEntityCopyWith<$Res>? get user;

}
/// @nodoc
class __$MemberEntityCopyWithImpl<$Res>
    implements _$MemberEntityCopyWith<$Res> {
  __$MemberEntityCopyWithImpl(this._self, this._then);

  final _MemberEntity _self;
  final $Res Function(_MemberEntity) _then;

/// Create a copy of MemberEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? groupId = freezed,Object? email = freezed,Object? group = freezed,Object? user = freezed,Object? paymentStatus = freezed,Object? isActive = freezed,Object? hasReward = freezed,Object? paidAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_MemberEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as GroupEntity?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatusEnum?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,hasReward: freezed == hasReward ? _self.hasReward : hasReward // ignore: cast_nullable_to_non_nullable
as bool?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of MemberEntity
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
}/// Create a copy of MemberEntity
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
}
}

// dart format on
