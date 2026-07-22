// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_public_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientPublicProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientPublicProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientPublicProfileState()';
}


}

/// @nodoc
class $ClientPublicProfileStateCopyWith<$Res>  {
$ClientPublicProfileStateCopyWith(ClientPublicProfileState _, $Res Function(ClientPublicProfileState) __);
}


/// Adds pattern-matching-related methods to [ClientPublicProfileState].
extension ClientPublicProfileStatePatterns on ClientPublicProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ClientPublicProfileInitial value)?  initial,TResult Function( ClientPublicProfileLoading value)?  loading,TResult Function( ClientPublicProfileLoaded value)?  loaded,TResult Function( ClientPublicProfileFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ClientPublicProfileInitial() when initial != null:
return initial(_that);case ClientPublicProfileLoading() when loading != null:
return loading(_that);case ClientPublicProfileLoaded() when loaded != null:
return loaded(_that);case ClientPublicProfileFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ClientPublicProfileInitial value)  initial,required TResult Function( ClientPublicProfileLoading value)  loading,required TResult Function( ClientPublicProfileLoaded value)  loaded,required TResult Function( ClientPublicProfileFailure value)  failure,}){
final _that = this;
switch (_that) {
case ClientPublicProfileInitial():
return initial(_that);case ClientPublicProfileLoading():
return loading(_that);case ClientPublicProfileLoaded():
return loaded(_that);case ClientPublicProfileFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ClientPublicProfileInitial value)?  initial,TResult? Function( ClientPublicProfileLoading value)?  loading,TResult? Function( ClientPublicProfileLoaded value)?  loaded,TResult? Function( ClientPublicProfileFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ClientPublicProfileInitial() when initial != null:
return initial(_that);case ClientPublicProfileLoading() when loading != null:
return loading(_that);case ClientPublicProfileLoaded() when loaded != null:
return loaded(_that);case ClientPublicProfileFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ClientPublicProfile profile)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ClientPublicProfileInitial() when initial != null:
return initial();case ClientPublicProfileLoading() when loading != null:
return loading();case ClientPublicProfileLoaded() when loaded != null:
return loaded(_that.profile);case ClientPublicProfileFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ClientPublicProfile profile)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ClientPublicProfileInitial():
return initial();case ClientPublicProfileLoading():
return loading();case ClientPublicProfileLoaded():
return loaded(_that.profile);case ClientPublicProfileFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ClientPublicProfile profile)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ClientPublicProfileInitial() when initial != null:
return initial();case ClientPublicProfileLoading() when loading != null:
return loading();case ClientPublicProfileLoaded() when loaded != null:
return loaded(_that.profile);case ClientPublicProfileFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ClientPublicProfileInitial implements ClientPublicProfileState {
  const ClientPublicProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientPublicProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientPublicProfileState.initial()';
}


}




/// @nodoc


class ClientPublicProfileLoading implements ClientPublicProfileState {
  const ClientPublicProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientPublicProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientPublicProfileState.loading()';
}


}




/// @nodoc


class ClientPublicProfileLoaded implements ClientPublicProfileState {
  const ClientPublicProfileLoaded({required this.profile});
  

 final  ClientPublicProfile profile;

/// Create a copy of ClientPublicProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientPublicProfileLoadedCopyWith<ClientPublicProfileLoaded> get copyWith => _$ClientPublicProfileLoadedCopyWithImpl<ClientPublicProfileLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientPublicProfileLoaded&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'ClientPublicProfileState.loaded(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $ClientPublicProfileLoadedCopyWith<$Res> implements $ClientPublicProfileStateCopyWith<$Res> {
  factory $ClientPublicProfileLoadedCopyWith(ClientPublicProfileLoaded value, $Res Function(ClientPublicProfileLoaded) _then) = _$ClientPublicProfileLoadedCopyWithImpl;
@useResult
$Res call({
 ClientPublicProfile profile
});




}
/// @nodoc
class _$ClientPublicProfileLoadedCopyWithImpl<$Res>
    implements $ClientPublicProfileLoadedCopyWith<$Res> {
  _$ClientPublicProfileLoadedCopyWithImpl(this._self, this._then);

  final ClientPublicProfileLoaded _self;
  final $Res Function(ClientPublicProfileLoaded) _then;

/// Create a copy of ClientPublicProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(ClientPublicProfileLoaded(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as ClientPublicProfile,
  ));
}


}

/// @nodoc


class ClientPublicProfileFailure implements ClientPublicProfileState {
  const ClientPublicProfileFailure({required this.message});
  

 final  String message;

/// Create a copy of ClientPublicProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientPublicProfileFailureCopyWith<ClientPublicProfileFailure> get copyWith => _$ClientPublicProfileFailureCopyWithImpl<ClientPublicProfileFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientPublicProfileFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ClientPublicProfileState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ClientPublicProfileFailureCopyWith<$Res> implements $ClientPublicProfileStateCopyWith<$Res> {
  factory $ClientPublicProfileFailureCopyWith(ClientPublicProfileFailure value, $Res Function(ClientPublicProfileFailure) _then) = _$ClientPublicProfileFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ClientPublicProfileFailureCopyWithImpl<$Res>
    implements $ClientPublicProfileFailureCopyWith<$Res> {
  _$ClientPublicProfileFailureCopyWithImpl(this._self, this._then);

  final ClientPublicProfileFailure _self;
  final $Res Function(ClientPublicProfileFailure) _then;

/// Create a copy of ClientPublicProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ClientPublicProfileFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
