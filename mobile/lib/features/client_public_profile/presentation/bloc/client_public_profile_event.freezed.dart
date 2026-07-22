// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_public_profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientPublicProfileEvent {

 String get clientId;
/// Create a copy of ClientPublicProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientPublicProfileEventCopyWith<ClientPublicProfileEvent> get copyWith => _$ClientPublicProfileEventCopyWithImpl<ClientPublicProfileEvent>(this as ClientPublicProfileEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientPublicProfileEvent&&(identical(other.clientId, clientId) || other.clientId == clientId));
}


@override
int get hashCode => Object.hash(runtimeType,clientId);

@override
String toString() {
  return 'ClientPublicProfileEvent(clientId: $clientId)';
}


}

/// @nodoc
abstract mixin class $ClientPublicProfileEventCopyWith<$Res>  {
  factory $ClientPublicProfileEventCopyWith(ClientPublicProfileEvent value, $Res Function(ClientPublicProfileEvent) _then) = _$ClientPublicProfileEventCopyWithImpl;
@useResult
$Res call({
 String clientId
});




}
/// @nodoc
class _$ClientPublicProfileEventCopyWithImpl<$Res>
    implements $ClientPublicProfileEventCopyWith<$Res> {
  _$ClientPublicProfileEventCopyWithImpl(this._self, this._then);

  final ClientPublicProfileEvent _self;
  final $Res Function(ClientPublicProfileEvent) _then;

/// Create a copy of ClientPublicProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,}) {
  return _then(ClientPublicProfileEvent.requested(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientPublicProfileEvent].
extension ClientPublicProfileEventPatterns on ClientPublicProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ClientPublicProfileRequested value)?  requested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ClientPublicProfileRequested() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ClientPublicProfileRequested value)  requested,}){
final _that = this;
switch (_that) {
case ClientPublicProfileRequested():
return requested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ClientPublicProfileRequested value)?  requested,}){
final _that = this;
switch (_that) {
case ClientPublicProfileRequested() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String clientId)?  requested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ClientPublicProfileRequested() when requested != null:
return requested(_that.clientId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String clientId)  requested,}) {final _that = this;
switch (_that) {
case ClientPublicProfileRequested():
return requested(_that.clientId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String clientId)?  requested,}) {final _that = this;
switch (_that) {
case ClientPublicProfileRequested() when requested != null:
return requested(_that.clientId);case _:
  return null;

}
}

}

/// @nodoc


class ClientPublicProfileRequested implements ClientPublicProfileEvent {
  const ClientPublicProfileRequested({required this.clientId});
  

@override final  String clientId;

/// Create a copy of ClientPublicProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientPublicProfileRequestedCopyWith<ClientPublicProfileRequested> get copyWith => _$ClientPublicProfileRequestedCopyWithImpl<ClientPublicProfileRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientPublicProfileRequested&&(identical(other.clientId, clientId) || other.clientId == clientId));
}


@override
int get hashCode => Object.hash(runtimeType,clientId);

@override
String toString() {
  return 'ClientPublicProfileEvent.requested(clientId: $clientId)';
}


}

/// @nodoc
abstract mixin class $ClientPublicProfileRequestedCopyWith<$Res> implements $ClientPublicProfileEventCopyWith<$Res> {
  factory $ClientPublicProfileRequestedCopyWith(ClientPublicProfileRequested value, $Res Function(ClientPublicProfileRequested) _then) = _$ClientPublicProfileRequestedCopyWithImpl;
@override @useResult
$Res call({
 String clientId
});




}
/// @nodoc
class _$ClientPublicProfileRequestedCopyWithImpl<$Res>
    implements $ClientPublicProfileRequestedCopyWith<$Res> {
  _$ClientPublicProfileRequestedCopyWithImpl(this._self, this._then);

  final ClientPublicProfileRequested _self;
  final $Res Function(ClientPublicProfileRequested) _then;

/// Create a copy of ClientPublicProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,}) {
  return _then(ClientPublicProfileRequested(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
