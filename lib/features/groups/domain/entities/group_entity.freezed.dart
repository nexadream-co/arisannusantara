// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GroupEntity {

 String? get id; String? get name; String? get description; String? get code; String? get reward; String? get status; String? get periodsType;// weekly, monthly, yearly
 DateTime? get periodsDate; double? get dues; double? get target; int? get maxWinner; List<String>? get owners; DateTime? get createdAt; DateTime? get updatedAt; List<PaymentAccountEntity>? get paymentAccounts;
/// Create a copy of GroupEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GroupEntityCopyWith<GroupEntity> get copyWith => _$GroupEntityCopyWithImpl<GroupEntity>(this as GroupEntity, _$identity);

  /// Serializes this GroupEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GroupEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.code, code) || other.code == code)&&(identical(other.reward, reward) || other.reward == reward)&&(identical(other.status, status) || other.status == status)&&(identical(other.periodsType, periodsType) || other.periodsType == periodsType)&&(identical(other.periodsDate, periodsDate) || other.periodsDate == periodsDate)&&(identical(other.dues, dues) || other.dues == dues)&&(identical(other.target, target) || other.target == target)&&(identical(other.maxWinner, maxWinner) || other.maxWinner == maxWinner)&&const DeepCollectionEquality().equals(other.owners, owners)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.paymentAccounts, paymentAccounts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,code,reward,status,periodsType,periodsDate,dues,target,maxWinner,const DeepCollectionEquality().hash(owners),createdAt,updatedAt,const DeepCollectionEquality().hash(paymentAccounts));

@override
String toString() {
  return 'GroupEntity(id: $id, name: $name, description: $description, code: $code, reward: $reward, status: $status, periodsType: $periodsType, periodsDate: $periodsDate, dues: $dues, target: $target, maxWinner: $maxWinner, owners: $owners, createdAt: $createdAt, updatedAt: $updatedAt, paymentAccounts: $paymentAccounts)';
}


}

/// @nodoc
abstract mixin class $GroupEntityCopyWith<$Res>  {
  factory $GroupEntityCopyWith(GroupEntity value, $Res Function(GroupEntity) _then) = _$GroupEntityCopyWithImpl;
@useResult
$Res call({
 String? id, String? name, String? description, String? code, String? reward, String? status, String? periodsType, DateTime? periodsDate, double? dues, double? target, int? maxWinner, List<String>? owners, DateTime? createdAt, DateTime? updatedAt, List<PaymentAccountEntity>? paymentAccounts
});




}
/// @nodoc
class _$GroupEntityCopyWithImpl<$Res>
    implements $GroupEntityCopyWith<$Res> {
  _$GroupEntityCopyWithImpl(this._self, this._then);

  final GroupEntity _self;
  final $Res Function(GroupEntity) _then;

/// Create a copy of GroupEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? code = freezed,Object? reward = freezed,Object? status = freezed,Object? periodsType = freezed,Object? periodsDate = freezed,Object? dues = freezed,Object? target = freezed,Object? maxWinner = freezed,Object? owners = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? paymentAccounts = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,reward: freezed == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,periodsType: freezed == periodsType ? _self.periodsType : periodsType // ignore: cast_nullable_to_non_nullable
as String?,periodsDate: freezed == periodsDate ? _self.periodsDate : periodsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dues: freezed == dues ? _self.dues : dues // ignore: cast_nullable_to_non_nullable
as double?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as double?,maxWinner: freezed == maxWinner ? _self.maxWinner : maxWinner // ignore: cast_nullable_to_non_nullable
as int?,owners: freezed == owners ? _self.owners : owners // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paymentAccounts: freezed == paymentAccounts ? _self.paymentAccounts : paymentAccounts // ignore: cast_nullable_to_non_nullable
as List<PaymentAccountEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [GroupEntity].
extension GroupEntityPatterns on GroupEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GroupEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GroupEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GroupEntity value)  $default,){
final _that = this;
switch (_that) {
case _GroupEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GroupEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GroupEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name,  String? description,  String? code,  String? reward,  String? status,  String? periodsType,  DateTime? periodsDate,  double? dues,  double? target,  int? maxWinner,  List<String>? owners,  DateTime? createdAt,  DateTime? updatedAt,  List<PaymentAccountEntity>? paymentAccounts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GroupEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.code,_that.reward,_that.status,_that.periodsType,_that.periodsDate,_that.dues,_that.target,_that.maxWinner,_that.owners,_that.createdAt,_that.updatedAt,_that.paymentAccounts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name,  String? description,  String? code,  String? reward,  String? status,  String? periodsType,  DateTime? periodsDate,  double? dues,  double? target,  int? maxWinner,  List<String>? owners,  DateTime? createdAt,  DateTime? updatedAt,  List<PaymentAccountEntity>? paymentAccounts)  $default,) {final _that = this;
switch (_that) {
case _GroupEntity():
return $default(_that.id,_that.name,_that.description,_that.code,_that.reward,_that.status,_that.periodsType,_that.periodsDate,_that.dues,_that.target,_that.maxWinner,_that.owners,_that.createdAt,_that.updatedAt,_that.paymentAccounts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name,  String? description,  String? code,  String? reward,  String? status,  String? periodsType,  DateTime? periodsDate,  double? dues,  double? target,  int? maxWinner,  List<String>? owners,  DateTime? createdAt,  DateTime? updatedAt,  List<PaymentAccountEntity>? paymentAccounts)?  $default,) {final _that = this;
switch (_that) {
case _GroupEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.code,_that.reward,_that.status,_that.periodsType,_that.periodsDate,_that.dues,_that.target,_that.maxWinner,_that.owners,_that.createdAt,_that.updatedAt,_that.paymentAccounts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GroupEntity implements GroupEntity {
  const _GroupEntity({this.id, this.name, this.description, this.code, this.reward, this.status, this.periodsType, this.periodsDate, this.dues, this.target, this.maxWinner, final  List<String>? owners, this.createdAt, this.updatedAt, final  List<PaymentAccountEntity>? paymentAccounts}): _owners = owners,_paymentAccounts = paymentAccounts;
  factory _GroupEntity.fromJson(Map<String, dynamic> json) => _$GroupEntityFromJson(json);

@override final  String? id;
@override final  String? name;
@override final  String? description;
@override final  String? code;
@override final  String? reward;
@override final  String? status;
@override final  String? periodsType;
// weekly, monthly, yearly
@override final  DateTime? periodsDate;
@override final  double? dues;
@override final  double? target;
@override final  int? maxWinner;
 final  List<String>? _owners;
@override List<String>? get owners {
  final value = _owners;
  if (value == null) return null;
  if (_owners is EqualUnmodifiableListView) return _owners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
 final  List<PaymentAccountEntity>? _paymentAccounts;
@override List<PaymentAccountEntity>? get paymentAccounts {
  final value = _paymentAccounts;
  if (value == null) return null;
  if (_paymentAccounts is EqualUnmodifiableListView) return _paymentAccounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GroupEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GroupEntityCopyWith<_GroupEntity> get copyWith => __$GroupEntityCopyWithImpl<_GroupEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GroupEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GroupEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.code, code) || other.code == code)&&(identical(other.reward, reward) || other.reward == reward)&&(identical(other.status, status) || other.status == status)&&(identical(other.periodsType, periodsType) || other.periodsType == periodsType)&&(identical(other.periodsDate, periodsDate) || other.periodsDate == periodsDate)&&(identical(other.dues, dues) || other.dues == dues)&&(identical(other.target, target) || other.target == target)&&(identical(other.maxWinner, maxWinner) || other.maxWinner == maxWinner)&&const DeepCollectionEquality().equals(other._owners, _owners)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._paymentAccounts, _paymentAccounts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,code,reward,status,periodsType,periodsDate,dues,target,maxWinner,const DeepCollectionEquality().hash(_owners),createdAt,updatedAt,const DeepCollectionEquality().hash(_paymentAccounts));

@override
String toString() {
  return 'GroupEntity(id: $id, name: $name, description: $description, code: $code, reward: $reward, status: $status, periodsType: $periodsType, periodsDate: $periodsDate, dues: $dues, target: $target, maxWinner: $maxWinner, owners: $owners, createdAt: $createdAt, updatedAt: $updatedAt, paymentAccounts: $paymentAccounts)';
}


}

/// @nodoc
abstract mixin class _$GroupEntityCopyWith<$Res> implements $GroupEntityCopyWith<$Res> {
  factory _$GroupEntityCopyWith(_GroupEntity value, $Res Function(_GroupEntity) _then) = __$GroupEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name, String? description, String? code, String? reward, String? status, String? periodsType, DateTime? periodsDate, double? dues, double? target, int? maxWinner, List<String>? owners, DateTime? createdAt, DateTime? updatedAt, List<PaymentAccountEntity>? paymentAccounts
});




}
/// @nodoc
class __$GroupEntityCopyWithImpl<$Res>
    implements _$GroupEntityCopyWith<$Res> {
  __$GroupEntityCopyWithImpl(this._self, this._then);

  final _GroupEntity _self;
  final $Res Function(_GroupEntity) _then;

/// Create a copy of GroupEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? description = freezed,Object? code = freezed,Object? reward = freezed,Object? status = freezed,Object? periodsType = freezed,Object? periodsDate = freezed,Object? dues = freezed,Object? target = freezed,Object? maxWinner = freezed,Object? owners = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? paymentAccounts = freezed,}) {
  return _then(_GroupEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,reward: freezed == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,periodsType: freezed == periodsType ? _self.periodsType : periodsType // ignore: cast_nullable_to_non_nullable
as String?,periodsDate: freezed == periodsDate ? _self.periodsDate : periodsDate // ignore: cast_nullable_to_non_nullable
as DateTime?,dues: freezed == dues ? _self.dues : dues // ignore: cast_nullable_to_non_nullable
as double?,target: freezed == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as double?,maxWinner: freezed == maxWinner ? _self.maxWinner : maxWinner // ignore: cast_nullable_to_non_nullable
as int?,owners: freezed == owners ? _self._owners : owners // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,paymentAccounts: freezed == paymentAccounts ? _self._paymentAccounts : paymentAccounts // ignore: cast_nullable_to_non_nullable
as List<PaymentAccountEntity>?,
  ));
}


}

// dart format on
