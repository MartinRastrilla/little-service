// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_read_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessagesReadEventModel {

@JsonKey(fromJson: stringFromJson) String get serviceRequestId;@JsonKey(fromJson: stringFromJson) String get readByUserId;@JsonKey(fromJson: stringFromJson) String get withUserId;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get readAt;
/// Create a copy of MessagesReadEventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagesReadEventModelCopyWith<MessagesReadEventModel> get copyWith => _$MessagesReadEventModelCopyWithImpl<MessagesReadEventModel>(this as MessagesReadEventModel, _$identity);

  /// Serializes this MessagesReadEventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagesReadEventModel&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId)&&(identical(other.readByUserId, readByUserId) || other.readByUserId == readByUserId)&&(identical(other.withUserId, withUserId) || other.withUserId == withUserId)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceRequestId,readByUserId,withUserId,readAt);

@override
String toString() {
  return 'MessagesReadEventModel(serviceRequestId: $serviceRequestId, readByUserId: $readByUserId, withUserId: $withUserId, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class $MessagesReadEventModelCopyWith<$Res>  {
  factory $MessagesReadEventModelCopyWith(MessagesReadEventModel value, $Res Function(MessagesReadEventModel) _then) = _$MessagesReadEventModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String serviceRequestId,@JsonKey(fromJson: stringFromJson) String readByUserId,@JsonKey(fromJson: stringFromJson) String withUserId,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime readAt
});




}
/// @nodoc
class _$MessagesReadEventModelCopyWithImpl<$Res>
    implements $MessagesReadEventModelCopyWith<$Res> {
  _$MessagesReadEventModelCopyWithImpl(this._self, this._then);

  final MessagesReadEventModel _self;
  final $Res Function(MessagesReadEventModel) _then;

/// Create a copy of MessagesReadEventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceRequestId = null,Object? readByUserId = null,Object? withUserId = null,Object? readAt = null,}) {
  return _then(MessagesReadEventModel(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,readByUserId: null == readByUserId ? _self.readByUserId : readByUserId // ignore: cast_nullable_to_non_nullable
as String,withUserId: null == withUserId ? _self.withUserId : withUserId // ignore: cast_nullable_to_non_nullable
as String,readAt: null == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MessagesReadEventModel].
extension MessagesReadEventModelPatterns on MessagesReadEventModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessagesReadEventModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessagesReadEventModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessagesReadEventModel value)  $default,){
final _that = this;
switch (_that) {
case _MessagesReadEventModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessagesReadEventModel value)?  $default,){
final _that = this;
switch (_that) {
case _MessagesReadEventModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String serviceRequestId, @JsonKey(fromJson: stringFromJson)  String readByUserId, @JsonKey(fromJson: stringFromJson)  String withUserId, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime readAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessagesReadEventModel() when $default != null:
return $default(_that.serviceRequestId,_that.readByUserId,_that.withUserId,_that.readAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String serviceRequestId, @JsonKey(fromJson: stringFromJson)  String readByUserId, @JsonKey(fromJson: stringFromJson)  String withUserId, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime readAt)  $default,) {final _that = this;
switch (_that) {
case _MessagesReadEventModel():
return $default(_that.serviceRequestId,_that.readByUserId,_that.withUserId,_that.readAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String serviceRequestId, @JsonKey(fromJson: stringFromJson)  String readByUserId, @JsonKey(fromJson: stringFromJson)  String withUserId, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime readAt)?  $default,) {final _that = this;
switch (_that) {
case _MessagesReadEventModel() when $default != null:
return $default(_that.serviceRequestId,_that.readByUserId,_that.withUserId,_that.readAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessagesReadEventModel implements MessagesReadEventModel {
  const _MessagesReadEventModel({@JsonKey(fromJson: stringFromJson) required this.serviceRequestId, @JsonKey(fromJson: stringFromJson) required this.readByUserId, @JsonKey(fromJson: stringFromJson) required this.withUserId, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.readAt});
  factory _MessagesReadEventModel.fromJson(Map<String, dynamic> json) => _$MessagesReadEventModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String serviceRequestId;
@override@JsonKey(fromJson: stringFromJson) final  String readByUserId;
@override@JsonKey(fromJson: stringFromJson) final  String withUserId;
@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime readAt;

/// Create a copy of MessagesReadEventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessagesReadEventModelCopyWith<_MessagesReadEventModel> get copyWith => __$MessagesReadEventModelCopyWithImpl<_MessagesReadEventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessagesReadEventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessagesReadEventModel&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId)&&(identical(other.readByUserId, readByUserId) || other.readByUserId == readByUserId)&&(identical(other.withUserId, withUserId) || other.withUserId == withUserId)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceRequestId,readByUserId,withUserId,readAt);

@override
String toString() {
  return 'MessagesReadEventModel(serviceRequestId: $serviceRequestId, readByUserId: $readByUserId, withUserId: $withUserId, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class _$MessagesReadEventModelCopyWith<$Res> implements $MessagesReadEventModelCopyWith<$Res> {
  factory _$MessagesReadEventModelCopyWith(_MessagesReadEventModel value, $Res Function(_MessagesReadEventModel) _then) = __$MessagesReadEventModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String serviceRequestId,@JsonKey(fromJson: stringFromJson) String readByUserId,@JsonKey(fromJson: stringFromJson) String withUserId,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime readAt
});




}
/// @nodoc
class __$MessagesReadEventModelCopyWithImpl<$Res>
    implements _$MessagesReadEventModelCopyWith<$Res> {
  __$MessagesReadEventModelCopyWithImpl(this._self, this._then);

  final _MessagesReadEventModel _self;
  final $Res Function(_MessagesReadEventModel) _then;

/// Create a copy of MessagesReadEventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceRequestId = null,Object? readByUserId = null,Object? withUserId = null,Object? readAt = null,}) {
  return _then(_MessagesReadEventModel(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,readByUserId: null == readByUserId ? _self.readByUserId : readByUserId // ignore: cast_nullable_to_non_nullable
as String,withUserId: null == withUserId ? _self.withUserId : withUserId // ignore: cast_nullable_to_non_nullable
as String,readAt: null == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
