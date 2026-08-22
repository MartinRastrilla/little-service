// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_access_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatAccessModel {

 bool get canOpen; bool get canSend; bool get isReadOnly; bool get waitingForClientMessage; String? get blockedReason;
/// Create a copy of ChatAccessModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatAccessModelCopyWith<ChatAccessModel> get copyWith => _$ChatAccessModelCopyWithImpl<ChatAccessModel>(this as ChatAccessModel, _$identity);

  /// Serializes this ChatAccessModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatAccessModel&&(identical(other.canOpen, canOpen) || other.canOpen == canOpen)&&(identical(other.canSend, canSend) || other.canSend == canSend)&&(identical(other.isReadOnly, isReadOnly) || other.isReadOnly == isReadOnly)&&(identical(other.waitingForClientMessage, waitingForClientMessage) || other.waitingForClientMessage == waitingForClientMessage)&&(identical(other.blockedReason, blockedReason) || other.blockedReason == blockedReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canOpen,canSend,isReadOnly,waitingForClientMessage,blockedReason);

@override
String toString() {
  return 'ChatAccessModel(canOpen: $canOpen, canSend: $canSend, isReadOnly: $isReadOnly, waitingForClientMessage: $waitingForClientMessage, blockedReason: $blockedReason)';
}


}

/// @nodoc
abstract mixin class $ChatAccessModelCopyWith<$Res>  {
  factory $ChatAccessModelCopyWith(ChatAccessModel value, $Res Function(ChatAccessModel) _then) = _$ChatAccessModelCopyWithImpl;
@useResult
$Res call({
 bool canOpen, bool canSend, bool isReadOnly, bool waitingForClientMessage, String? blockedReason
});




}
/// @nodoc
class _$ChatAccessModelCopyWithImpl<$Res>
    implements $ChatAccessModelCopyWith<$Res> {
  _$ChatAccessModelCopyWithImpl(this._self, this._then);

  final ChatAccessModel _self;
  final $Res Function(ChatAccessModel) _then;

/// Create a copy of ChatAccessModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canOpen = null,Object? canSend = null,Object? isReadOnly = null,Object? waitingForClientMessage = null,Object? blockedReason = freezed,}) {
  return _then(ChatAccessModel(
canOpen: null == canOpen ? _self.canOpen : canOpen // ignore: cast_nullable_to_non_nullable
as bool,canSend: null == canSend ? _self.canSend : canSend // ignore: cast_nullable_to_non_nullable
as bool,isReadOnly: null == isReadOnly ? _self.isReadOnly : isReadOnly // ignore: cast_nullable_to_non_nullable
as bool,waitingForClientMessage: null == waitingForClientMessage ? _self.waitingForClientMessage : waitingForClientMessage // ignore: cast_nullable_to_non_nullable
as bool,blockedReason: freezed == blockedReason ? _self.blockedReason : blockedReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatAccessModel].
extension ChatAccessModelPatterns on ChatAccessModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatAccessModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatAccessModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatAccessModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatAccessModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatAccessModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatAccessModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool canOpen,  bool canSend,  bool isReadOnly,  bool waitingForClientMessage,  String? blockedReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatAccessModel() when $default != null:
return $default(_that.canOpen,_that.canSend,_that.isReadOnly,_that.waitingForClientMessage,_that.blockedReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool canOpen,  bool canSend,  bool isReadOnly,  bool waitingForClientMessage,  String? blockedReason)  $default,) {final _that = this;
switch (_that) {
case _ChatAccessModel():
return $default(_that.canOpen,_that.canSend,_that.isReadOnly,_that.waitingForClientMessage,_that.blockedReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool canOpen,  bool canSend,  bool isReadOnly,  bool waitingForClientMessage,  String? blockedReason)?  $default,) {final _that = this;
switch (_that) {
case _ChatAccessModel() when $default != null:
return $default(_that.canOpen,_that.canSend,_that.isReadOnly,_that.waitingForClientMessage,_that.blockedReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatAccessModel extends ChatAccessModel {
  const _ChatAccessModel({this.canOpen = false, this.canSend = false, this.isReadOnly = false, this.waitingForClientMessage = false, this.blockedReason}): super._();
  factory _ChatAccessModel.fromJson(Map<String, dynamic> json) => _$ChatAccessModelFromJson(json);

@override@JsonKey() final  bool canOpen;
@override@JsonKey() final  bool canSend;
@override@JsonKey() final  bool isReadOnly;
@override@JsonKey() final  bool waitingForClientMessage;
@override final  String? blockedReason;

/// Create a copy of ChatAccessModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatAccessModelCopyWith<_ChatAccessModel> get copyWith => __$ChatAccessModelCopyWithImpl<_ChatAccessModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatAccessModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatAccessModel&&(identical(other.canOpen, canOpen) || other.canOpen == canOpen)&&(identical(other.canSend, canSend) || other.canSend == canSend)&&(identical(other.isReadOnly, isReadOnly) || other.isReadOnly == isReadOnly)&&(identical(other.waitingForClientMessage, waitingForClientMessage) || other.waitingForClientMessage == waitingForClientMessage)&&(identical(other.blockedReason, blockedReason) || other.blockedReason == blockedReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canOpen,canSend,isReadOnly,waitingForClientMessage,blockedReason);

@override
String toString() {
  return 'ChatAccessModel(canOpen: $canOpen, canSend: $canSend, isReadOnly: $isReadOnly, waitingForClientMessage: $waitingForClientMessage, blockedReason: $blockedReason)';
}


}

/// @nodoc
abstract mixin class _$ChatAccessModelCopyWith<$Res> implements $ChatAccessModelCopyWith<$Res> {
  factory _$ChatAccessModelCopyWith(_ChatAccessModel value, $Res Function(_ChatAccessModel) _then) = __$ChatAccessModelCopyWithImpl;
@override @useResult
$Res call({
 bool canOpen, bool canSend, bool isReadOnly, bool waitingForClientMessage, String? blockedReason
});




}
/// @nodoc
class __$ChatAccessModelCopyWithImpl<$Res>
    implements _$ChatAccessModelCopyWith<$Res> {
  __$ChatAccessModelCopyWithImpl(this._self, this._then);

  final _ChatAccessModel _self;
  final $Res Function(_ChatAccessModel) _then;

/// Create a copy of ChatAccessModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canOpen = null,Object? canSend = null,Object? isReadOnly = null,Object? waitingForClientMessage = null,Object? blockedReason = freezed,}) {
  return _then(_ChatAccessModel(
canOpen: null == canOpen ? _self.canOpen : canOpen // ignore: cast_nullable_to_non_nullable
as bool,canSend: null == canSend ? _self.canSend : canSend // ignore: cast_nullable_to_non_nullable
as bool,isReadOnly: null == isReadOnly ? _self.isReadOnly : isReadOnly // ignore: cast_nullable_to_non_nullable
as bool,waitingForClientMessage: null == waitingForClientMessage ? _self.waitingForClientMessage : waitingForClientMessage // ignore: cast_nullable_to_non_nullable
as bool,blockedReason: freezed == blockedReason ? _self.blockedReason : blockedReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
