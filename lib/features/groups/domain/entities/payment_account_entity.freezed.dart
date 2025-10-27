// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_account_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentAccountEntity {

 String? get id; String? get accountName; String? get bankName; String? get bankNumber; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of PaymentAccountEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentAccountEntityCopyWith<PaymentAccountEntity> get copyWith => _$PaymentAccountEntityCopyWithImpl<PaymentAccountEntity>(this as PaymentAccountEntity, _$identity);

  /// Serializes this PaymentAccountEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentAccountEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankNumber, bankNumber) || other.bankNumber == bankNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountName,bankName,bankNumber,createdAt,updatedAt);

@override
String toString() {
  return 'PaymentAccountEntity(id: $id, accountName: $accountName, bankName: $bankName, bankNumber: $bankNumber, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PaymentAccountEntityCopyWith<$Res>  {
  factory $PaymentAccountEntityCopyWith(PaymentAccountEntity value, $Res Function(PaymentAccountEntity) _then) = _$PaymentAccountEntityCopyWithImpl;
@useResult
$Res call({
 String? id, String? accountName, String? bankName, String? bankNumber, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$PaymentAccountEntityCopyWithImpl<$Res>
    implements $PaymentAccountEntityCopyWith<$Res> {
  _$PaymentAccountEntityCopyWithImpl(this._self, this._then);

  final PaymentAccountEntity _self;
  final $Res Function(PaymentAccountEntity) _then;

/// Create a copy of PaymentAccountEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? accountName = freezed,Object? bankName = freezed,Object? bankNumber = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,accountName: freezed == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,bankNumber: freezed == bankNumber ? _self.bankNumber : bankNumber // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentAccountEntity].
extension PaymentAccountEntityPatterns on PaymentAccountEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentAccountEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentAccountEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentAccountEntity value)  $default,){
final _that = this;
switch (_that) {
case _PaymentAccountEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentAccountEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentAccountEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? accountName,  String? bankName,  String? bankNumber,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentAccountEntity() when $default != null:
return $default(_that.id,_that.accountName,_that.bankName,_that.bankNumber,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? accountName,  String? bankName,  String? bankNumber,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PaymentAccountEntity():
return $default(_that.id,_that.accountName,_that.bankName,_that.bankNumber,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? accountName,  String? bankName,  String? bankNumber,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PaymentAccountEntity() when $default != null:
return $default(_that.id,_that.accountName,_that.bankName,_that.bankNumber,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentAccountEntity implements PaymentAccountEntity {
  const _PaymentAccountEntity({this.id, this.accountName, this.bankName, this.bankNumber, this.createdAt, this.updatedAt});
  factory _PaymentAccountEntity.fromJson(Map<String, dynamic> json) => _$PaymentAccountEntityFromJson(json);

@override final  String? id;
@override final  String? accountName;
@override final  String? bankName;
@override final  String? bankNumber;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of PaymentAccountEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentAccountEntityCopyWith<_PaymentAccountEntity> get copyWith => __$PaymentAccountEntityCopyWithImpl<_PaymentAccountEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentAccountEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentAccountEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankNumber, bankNumber) || other.bankNumber == bankNumber)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountName,bankName,bankNumber,createdAt,updatedAt);

@override
String toString() {
  return 'PaymentAccountEntity(id: $id, accountName: $accountName, bankName: $bankName, bankNumber: $bankNumber, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PaymentAccountEntityCopyWith<$Res> implements $PaymentAccountEntityCopyWith<$Res> {
  factory _$PaymentAccountEntityCopyWith(_PaymentAccountEntity value, $Res Function(_PaymentAccountEntity) _then) = __$PaymentAccountEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? accountName, String? bankName, String? bankNumber, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$PaymentAccountEntityCopyWithImpl<$Res>
    implements _$PaymentAccountEntityCopyWith<$Res> {
  __$PaymentAccountEntityCopyWithImpl(this._self, this._then);

  final _PaymentAccountEntity _self;
  final $Res Function(_PaymentAccountEntity) _then;

/// Create a copy of PaymentAccountEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? accountName = freezed,Object? bankName = freezed,Object? bankNumber = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_PaymentAccountEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,accountName: freezed == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String?,bankName: freezed == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String?,bankNumber: freezed == bankNumber ? _self.bankNumber : bankNumber // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
