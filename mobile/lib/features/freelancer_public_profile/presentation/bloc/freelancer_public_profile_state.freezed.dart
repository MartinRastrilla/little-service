// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelancer_public_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FreelancerPublicProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerPublicProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerPublicProfileState()';
}


}

/// @nodoc
class $FreelancerPublicProfileStateCopyWith<$Res>  {
$FreelancerPublicProfileStateCopyWith(FreelancerPublicProfileState _, $Res Function(FreelancerPublicProfileState) __);
}


/// Adds pattern-matching-related methods to [FreelancerPublicProfileState].
extension FreelancerPublicProfileStatePatterns on FreelancerPublicProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FreelancerPublicProfileInitial value)?  initial,TResult Function( FreelancerPublicProfileLoading value)?  loading,TResult Function( FreelancerPublicProfileLoaded value)?  loaded,TResult Function( FreelancerPublicProfileFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FreelancerPublicProfileInitial() when initial != null:
return initial(_that);case FreelancerPublicProfileLoading() when loading != null:
return loading(_that);case FreelancerPublicProfileLoaded() when loaded != null:
return loaded(_that);case FreelancerPublicProfileFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FreelancerPublicProfileInitial value)  initial,required TResult Function( FreelancerPublicProfileLoading value)  loading,required TResult Function( FreelancerPublicProfileLoaded value)  loaded,required TResult Function( FreelancerPublicProfileFailure value)  failure,}){
final _that = this;
switch (_that) {
case FreelancerPublicProfileInitial():
return initial(_that);case FreelancerPublicProfileLoading():
return loading(_that);case FreelancerPublicProfileLoaded():
return loaded(_that);case FreelancerPublicProfileFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FreelancerPublicProfileInitial value)?  initial,TResult? Function( FreelancerPublicProfileLoading value)?  loading,TResult? Function( FreelancerPublicProfileLoaded value)?  loaded,TResult? Function( FreelancerPublicProfileFailure value)?  failure,}){
final _that = this;
switch (_that) {
case FreelancerPublicProfileInitial() when initial != null:
return initial(_that);case FreelancerPublicProfileLoading() when loading != null:
return loading(_that);case FreelancerPublicProfileLoaded() when loaded != null:
return loaded(_that);case FreelancerPublicProfileFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( FreelancerPublicProfile profile)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FreelancerPublicProfileInitial() when initial != null:
return initial();case FreelancerPublicProfileLoading() when loading != null:
return loading();case FreelancerPublicProfileLoaded() when loaded != null:
return loaded(_that.profile);case FreelancerPublicProfileFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( FreelancerPublicProfile profile)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case FreelancerPublicProfileInitial():
return initial();case FreelancerPublicProfileLoading():
return loading();case FreelancerPublicProfileLoaded():
return loaded(_that.profile);case FreelancerPublicProfileFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( FreelancerPublicProfile profile)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case FreelancerPublicProfileInitial() when initial != null:
return initial();case FreelancerPublicProfileLoading() when loading != null:
return loading();case FreelancerPublicProfileLoaded() when loaded != null:
return loaded(_that.profile);case FreelancerPublicProfileFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class FreelancerPublicProfileInitial implements FreelancerPublicProfileState {
  const FreelancerPublicProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerPublicProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerPublicProfileState.initial()';
}


}




/// @nodoc


class FreelancerPublicProfileLoading implements FreelancerPublicProfileState {
  const FreelancerPublicProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerPublicProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerPublicProfileState.loading()';
}


}




/// @nodoc


class FreelancerPublicProfileLoaded implements FreelancerPublicProfileState {
  const FreelancerPublicProfileLoaded({required this.profile});
  

 final  FreelancerPublicProfile profile;

/// Create a copy of FreelancerPublicProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerPublicProfileLoadedCopyWith<FreelancerPublicProfileLoaded> get copyWith => _$FreelancerPublicProfileLoadedCopyWithImpl<FreelancerPublicProfileLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerPublicProfileLoaded&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'FreelancerPublicProfileState.loaded(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $FreelancerPublicProfileLoadedCopyWith<$Res> implements $FreelancerPublicProfileStateCopyWith<$Res> {
  factory $FreelancerPublicProfileLoadedCopyWith(FreelancerPublicProfileLoaded value, $Res Function(FreelancerPublicProfileLoaded) _then) = _$FreelancerPublicProfileLoadedCopyWithImpl;
@useResult
$Res call({
 FreelancerPublicProfile profile
});




}
/// @nodoc
class _$FreelancerPublicProfileLoadedCopyWithImpl<$Res>
    implements $FreelancerPublicProfileLoadedCopyWith<$Res> {
  _$FreelancerPublicProfileLoadedCopyWithImpl(this._self, this._then);

  final FreelancerPublicProfileLoaded _self;
  final $Res Function(FreelancerPublicProfileLoaded) _then;

/// Create a copy of FreelancerPublicProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(FreelancerPublicProfileLoaded(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as FreelancerPublicProfile,
  ));
}


}

/// @nodoc


class FreelancerPublicProfileFailure implements FreelancerPublicProfileState {
  const FreelancerPublicProfileFailure({required this.message});
  

 final  String message;

/// Create a copy of FreelancerPublicProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerPublicProfileFailureCopyWith<FreelancerPublicProfileFailure> get copyWith => _$FreelancerPublicProfileFailureCopyWithImpl<FreelancerPublicProfileFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerPublicProfileFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FreelancerPublicProfileState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FreelancerPublicProfileFailureCopyWith<$Res> implements $FreelancerPublicProfileStateCopyWith<$Res> {
  factory $FreelancerPublicProfileFailureCopyWith(FreelancerPublicProfileFailure value, $Res Function(FreelancerPublicProfileFailure) _then) = _$FreelancerPublicProfileFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FreelancerPublicProfileFailureCopyWithImpl<$Res>
    implements $FreelancerPublicProfileFailureCopyWith<$Res> {
  _$FreelancerPublicProfileFailureCopyWithImpl(this._self, this._then);

  final FreelancerPublicProfileFailure _self;
  final $Res Function(FreelancerPublicProfileFailure) _then;

/// Create a copy of FreelancerPublicProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FreelancerPublicProfileFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
