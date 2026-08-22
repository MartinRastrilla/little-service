// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationSummaryModel {

@JsonKey(fromJson: stringFromJson) String get serviceRequestId;@JsonKey(fromJson: stringFromJson) String get withUserId; String get withUserName; String? get lastMessageContent;@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? get lastMessageAt; int get unreadCount;
/// Create a copy of ConversationSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationSummaryModelCopyWith<ConversationSummaryModel> get copyWith => _$ConversationSummaryModelCopyWithImpl<ConversationSummaryModel>(this as ConversationSummaryModel, _$identity);

  /// Serializes this ConversationSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationSummaryModel&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId)&&(identical(other.withUserId, withUserId) || other.withUserId == withUserId)&&(identical(other.withUserName, withUserName) || other.withUserName == withUserName)&&(identical(other.lastMessageContent, lastMessageContent) || other.lastMessageContent == lastMessageContent)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceRequestId,withUserId,withUserName,lastMessageContent,lastMessageAt,unreadCount);

@override
String toString() {
  return 'ConversationSummaryModel(serviceRequestId: $serviceRequestId, withUserId: $withUserId, withUserName: $withUserName, lastMessageContent: $lastMessageContent, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $ConversationSummaryModelCopyWith<$Res>  {
  factory $ConversationSummaryModelCopyWith(ConversationSummaryModel value, $Res Function(ConversationSummaryModel) _then) = _$ConversationSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String serviceRequestId,@JsonKey(fromJson: stringFromJson) String withUserId, String withUserName, String? lastMessageContent,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? lastMessageAt, int unreadCount
});




}
/// @nodoc
class _$ConversationSummaryModelCopyWithImpl<$Res>
    implements $ConversationSummaryModelCopyWith<$Res> {
  _$ConversationSummaryModelCopyWithImpl(this._self, this._then);

  final ConversationSummaryModel _self;
  final $Res Function(ConversationSummaryModel) _then;

/// Create a copy of ConversationSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceRequestId = null,Object? withUserId = null,Object? withUserName = null,Object? lastMessageContent = freezed,Object? lastMessageAt = freezed,Object? unreadCount = null,}) {
  return _then(ConversationSummaryModel(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,withUserId: null == withUserId ? _self.withUserId : withUserId // ignore: cast_nullable_to_non_nullable
as String,withUserName: null == withUserName ? _self.withUserName : withUserName // ignore: cast_nullable_to_non_nullable
as String,lastMessageContent: freezed == lastMessageContent ? _self.lastMessageContent : lastMessageContent // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationSummaryModel].
extension ConversationSummaryModelPatterns on ConversationSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _ConversationSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String serviceRequestId, @JsonKey(fromJson: stringFromJson)  String withUserId,  String withUserName,  String? lastMessageContent, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? lastMessageAt,  int unreadCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationSummaryModel() when $default != null:
return $default(_that.serviceRequestId,_that.withUserId,_that.withUserName,_that.lastMessageContent,_that.lastMessageAt,_that.unreadCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String serviceRequestId, @JsonKey(fromJson: stringFromJson)  String withUserId,  String withUserName,  String? lastMessageContent, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? lastMessageAt,  int unreadCount)  $default,) {final _that = this;
switch (_that) {
case _ConversationSummaryModel():
return $default(_that.serviceRequestId,_that.withUserId,_that.withUserName,_that.lastMessageContent,_that.lastMessageAt,_that.unreadCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String serviceRequestId, @JsonKey(fromJson: stringFromJson)  String withUserId,  String withUserName,  String? lastMessageContent, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? lastMessageAt,  int unreadCount)?  $default,) {final _that = this;
switch (_that) {
case _ConversationSummaryModel() when $default != null:
return $default(_that.serviceRequestId,_that.withUserId,_that.withUserName,_that.lastMessageContent,_that.lastMessageAt,_that.unreadCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationSummaryModel extends ConversationSummaryModel {
  const _ConversationSummaryModel({@JsonKey(fromJson: stringFromJson) required this.serviceRequestId, @JsonKey(fromJson: stringFromJson) required this.withUserId, this.withUserName = '', this.lastMessageContent, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) this.lastMessageAt, this.unreadCount = 0}): super._();
  factory _ConversationSummaryModel.fromJson(Map<String, dynamic> json) => _$ConversationSummaryModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String serviceRequestId;
@override@JsonKey(fromJson: stringFromJson) final  String withUserId;
@override@JsonKey() final  String withUserName;
@override final  String? lastMessageContent;
@override@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) final  DateTime? lastMessageAt;
@override@JsonKey() final  int unreadCount;

/// Create a copy of ConversationSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationSummaryModelCopyWith<_ConversationSummaryModel> get copyWith => __$ConversationSummaryModelCopyWithImpl<_ConversationSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationSummaryModel&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId)&&(identical(other.withUserId, withUserId) || other.withUserId == withUserId)&&(identical(other.withUserName, withUserName) || other.withUserName == withUserName)&&(identical(other.lastMessageContent, lastMessageContent) || other.lastMessageContent == lastMessageContent)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceRequestId,withUserId,withUserName,lastMessageContent,lastMessageAt,unreadCount);

@override
String toString() {
  return 'ConversationSummaryModel(serviceRequestId: $serviceRequestId, withUserId: $withUserId, withUserName: $withUserName, lastMessageContent: $lastMessageContent, lastMessageAt: $lastMessageAt, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$ConversationSummaryModelCopyWith<$Res> implements $ConversationSummaryModelCopyWith<$Res> {
  factory _$ConversationSummaryModelCopyWith(_ConversationSummaryModel value, $Res Function(_ConversationSummaryModel) _then) = __$ConversationSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String serviceRequestId,@JsonKey(fromJson: stringFromJson) String withUserId, String withUserName, String? lastMessageContent,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? lastMessageAt, int unreadCount
});




}
/// @nodoc
class __$ConversationSummaryModelCopyWithImpl<$Res>
    implements _$ConversationSummaryModelCopyWith<$Res> {
  __$ConversationSummaryModelCopyWithImpl(this._self, this._then);

  final _ConversationSummaryModel _self;
  final $Res Function(_ConversationSummaryModel) _then;

/// Create a copy of ConversationSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceRequestId = null,Object? withUserId = null,Object? withUserName = null,Object? lastMessageContent = freezed,Object? lastMessageAt = freezed,Object? unreadCount = null,}) {
  return _then(_ConversationSummaryModel(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,withUserId: null == withUserId ? _self.withUserId : withUserId // ignore: cast_nullable_to_non_nullable
as String,withUserName: null == withUserName ? _self.withUserName : withUserName // ignore: cast_nullable_to_non_nullable
as String,lastMessageContent: freezed == lastMessageContent ? _self.lastMessageContent : lastMessageContent // ignore: cast_nullable_to_non_nullable
as String?,lastMessageAt: freezed == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
