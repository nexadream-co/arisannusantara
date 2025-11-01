// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeedbackEntity {

 String? get id; String? get userId; UserEntity? get user; String? get email; String? get title; String? get feedback; String? get status; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of FeedbackEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeedbackEntityCopyWith<FeedbackEntity> get copyWith => _$FeedbackEntityCopyWithImpl<FeedbackEntity>(this as FeedbackEntity, _$identity);

  /// Serializes this FeedbackEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeedbackEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.email, email) || other.email == email)&&(identical(other.title, title) || other.title == title)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,user,email,title,feedback,status,createdAt,updatedAt);

@override
String toString() {
  return 'FeedbackEntity(id: $id, userId: $userId, user: $user, email: $email, title: $title, feedback: $feedback, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FeedbackEntityCopyWith<$Res>  {
  factory $FeedbackEntityCopyWith(FeedbackEntity value, $Res Function(FeedbackEntity) _then) = _$FeedbackEntityCopyWithImpl;
@useResult
$Res call({
 String? id, String? userId, UserEntity? user, String? email, String? title, String? feedback, String? status, DateTime? createdAt, DateTime? updatedAt
});


$UserEntityCopyWith<$Res>? get user;

}
/// @nodoc
class _$FeedbackEntityCopyWithImpl<$Res>
    implements $FeedbackEntityCopyWith<$Res> {
  _$FeedbackEntityCopyWithImpl(this._self, this._then);

  final FeedbackEntity _self;
  final $Res Function(FeedbackEntity) _then;

/// Create a copy of FeedbackEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? user = freezed,Object? email = freezed,Object? title = freezed,Object? feedback = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of FeedbackEntity
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


/// Adds pattern-matching-related methods to [FeedbackEntity].
extension FeedbackEntityPatterns on FeedbackEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeedbackEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeedbackEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeedbackEntity value)  $default,){
final _that = this;
switch (_that) {
case _FeedbackEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeedbackEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FeedbackEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? userId,  UserEntity? user,  String? email,  String? title,  String? feedback,  String? status,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeedbackEntity() when $default != null:
return $default(_that.id,_that.userId,_that.user,_that.email,_that.title,_that.feedback,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? userId,  UserEntity? user,  String? email,  String? title,  String? feedback,  String? status,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _FeedbackEntity():
return $default(_that.id,_that.userId,_that.user,_that.email,_that.title,_that.feedback,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? userId,  UserEntity? user,  String? email,  String? title,  String? feedback,  String? status,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _FeedbackEntity() when $default != null:
return $default(_that.id,_that.userId,_that.user,_that.email,_that.title,_that.feedback,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeedbackEntity implements FeedbackEntity {
  const _FeedbackEntity({this.id, this.userId, this.user, this.email, this.title, this.feedback, this.status, this.createdAt, this.updatedAt});
  factory _FeedbackEntity.fromJson(Map<String, dynamic> json) => _$FeedbackEntityFromJson(json);

@override final  String? id;
@override final  String? userId;
@override final  UserEntity? user;
@override final  String? email;
@override final  String? title;
@override final  String? feedback;
@override final  String? status;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of FeedbackEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeedbackEntityCopyWith<_FeedbackEntity> get copyWith => __$FeedbackEntityCopyWithImpl<_FeedbackEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeedbackEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeedbackEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.user, user) || other.user == user)&&(identical(other.email, email) || other.email == email)&&(identical(other.title, title) || other.title == title)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,user,email,title,feedback,status,createdAt,updatedAt);

@override
String toString() {
  return 'FeedbackEntity(id: $id, userId: $userId, user: $user, email: $email, title: $title, feedback: $feedback, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FeedbackEntityCopyWith<$Res> implements $FeedbackEntityCopyWith<$Res> {
  factory _$FeedbackEntityCopyWith(_FeedbackEntity value, $Res Function(_FeedbackEntity) _then) = __$FeedbackEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? userId, UserEntity? user, String? email, String? title, String? feedback, String? status, DateTime? createdAt, DateTime? updatedAt
});


@override $UserEntityCopyWith<$Res>? get user;

}
/// @nodoc
class __$FeedbackEntityCopyWithImpl<$Res>
    implements _$FeedbackEntityCopyWith<$Res> {
  __$FeedbackEntityCopyWithImpl(this._self, this._then);

  final _FeedbackEntity _self;
  final $Res Function(_FeedbackEntity) _then;

/// Create a copy of FeedbackEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? user = freezed,Object? email = freezed,Object? title = freezed,Object? feedback = freezed,Object? status = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_FeedbackEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserEntity?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of FeedbackEntity
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
