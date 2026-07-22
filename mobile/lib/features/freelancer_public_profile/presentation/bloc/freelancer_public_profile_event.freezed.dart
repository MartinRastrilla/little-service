// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelancer_public_profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FreelancerPublicProfileEvent {

 String get freelancerId;
/// Create a copy of FreelancerPublicProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerPublicProfileEventCopyWith<FreelancerPublicProfileEvent> get copyWith => _$FreelancerPublicProfileEventCopyWithImpl<FreelancerPublicProfileEvent>(this as FreelancerPublicProfileEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerPublicProfileEvent&&(identical(other.freelancerId, freelancerId) || other.freelancerId == freelancerId));
}


@override
int get hashCode => Object.hash(runtimeType,freelancerId);

@override
String toString() {
  return 'FreelancerPublicProfileEvent(freelancerId: $freelancerId)';
}


}

/// @nodoc
abstract mixin class $FreelancerPublicProfileEventCopyWith<$Res>  {
  factory $FreelancerPublicProfileEventCopyWith(FreelancerPublicProfileEvent value, $Res Function(FreelancerPublicProfileEvent) _then) = _$FreelancerPublicProfileEventCopyWithImpl;
@useResult
$Res call({
 String freelancerId
});




}
/// @nodoc
class _$FreelancerPublicProfileEventCopyWithImpl<$Res>
    implements $FreelancerPublicProfileEventCopyWith<$Res> {
  _$FreelancerPublicProfileEventCopyWithImpl(this._self, this._then);

  final FreelancerPublicProfileEvent _self;
  final $Res Function(FreelancerPublicProfileEvent) _then;

/// Create a copy of FreelancerPublicProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? freelancerId = null,}) {
  return _then(FreelancerPublicProfileEvent.requested(
freelancerId: null == freelancerId ? _self.freelancerId : freelancerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FreelancerPublicProfileEvent].
extension FreelancerPublicProfileEventPatterns on FreelancerPublicProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FreelancerPublicProfileRequested value)?  requested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FreelancerPublicProfileRequested() when requested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FreelancerPublicProfileRequested value)  requested,}){
final _that = this;
switch (_that) {
case FreelancerPublicProfileRequested():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FreelancerPublicProfileRequested value)?  requested,}){
final _that = this;
switch (_that) {
case FreelancerPublicProfileRequested() when requested != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String freelancerId)?  requested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FreelancerPublicProfileRequested() when requested != null:
return requested(_that.freelancerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String freelancerId)  requested,}) {final _that = this;
switch (_that) {
case FreelancerPublicProfileRequested():
return requested(_that.freelancerId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String freelancerId)?  requested,}) {final _that = this;
switch (_that) {
case FreelancerPublicProfileRequested() when requested != null:
return requested(_that.freelancerId);case _:
  return null;

}
}

}

/// @nodoc


class FreelancerPublicProfileRequested implements FreelancerPublicProfileEvent {
  const FreelancerPublicProfileRequested({required this.freelancerId});
  

@override final  String freelancerId;

/// Create a copy of FreelancerPublicProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerPublicProfileRequestedCopyWith<FreelancerPublicProfileRequested> get copyWith => _$FreelancerPublicProfileRequestedCopyWithImpl<FreelancerPublicProfileRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerPublicProfileRequested&&(identical(other.freelancerId, freelancerId) || other.freelancerId == freelancerId));
}


@override
int get hashCode => Object.hash(runtimeType,freelancerId);

@override
String toString() {
  return 'FreelancerPublicProfileEvent.requested(freelancerId: $freelancerId)';
}


}

/// @nodoc
abstract mixin class $FreelancerPublicProfileRequestedCopyWith<$Res> implements $FreelancerPublicProfileEventCopyWith<$Res> {
  factory $FreelancerPublicProfileRequestedCopyWith(FreelancerPublicProfileRequested value, $Res Function(FreelancerPublicProfileRequested) _then) = _$FreelancerPublicProfileRequestedCopyWithImpl;
@override @useResult
$Res call({
 String freelancerId
});




}
/// @nodoc
class _$FreelancerPublicProfileRequestedCopyWithImpl<$Res>
    implements $FreelancerPublicProfileRequestedCopyWith<$Res> {
  _$FreelancerPublicProfileRequestedCopyWithImpl(this._self, this._then);

  final FreelancerPublicProfileRequested _self;
  final $Res Function(FreelancerPublicProfileRequested) _then;

/// Create a copy of FreelancerPublicProfileEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? freelancerId = null,}) {
  return _then(FreelancerPublicProfileRequested(
freelancerId: null == freelancerId ? _self.freelancerId : freelancerId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
