// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelancer_service_request_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FreelancerServiceRequestDetailEvent {

 String get serviceRequestId;
/// Create a copy of FreelancerServiceRequestDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerServiceRequestDetailEventCopyWith<FreelancerServiceRequestDetailEvent> get copyWith => _$FreelancerServiceRequestDetailEventCopyWithImpl<FreelancerServiceRequestDetailEvent>(this as FreelancerServiceRequestDetailEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerServiceRequestDetailEvent&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId));
}


@override
int get hashCode => Object.hash(runtimeType,serviceRequestId);

@override
String toString() {
  return 'FreelancerServiceRequestDetailEvent(serviceRequestId: $serviceRequestId)';
}


}

/// @nodoc
abstract mixin class $FreelancerServiceRequestDetailEventCopyWith<$Res>  {
  factory $FreelancerServiceRequestDetailEventCopyWith(FreelancerServiceRequestDetailEvent value, $Res Function(FreelancerServiceRequestDetailEvent) _then) = _$FreelancerServiceRequestDetailEventCopyWithImpl;
@useResult
$Res call({
 String serviceRequestId
});




}
/// @nodoc
class _$FreelancerServiceRequestDetailEventCopyWithImpl<$Res>
    implements $FreelancerServiceRequestDetailEventCopyWith<$Res> {
  _$FreelancerServiceRequestDetailEventCopyWithImpl(this._self, this._then);

  final FreelancerServiceRequestDetailEvent _self;
  final $Res Function(FreelancerServiceRequestDetailEvent) _then;

/// Create a copy of FreelancerServiceRequestDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceRequestId = null,}) {
  return _then(_self.copyWith(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FreelancerServiceRequestDetailEvent].
extension FreelancerServiceRequestDetailEventPatterns on FreelancerServiceRequestDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FreelancerServiceRequestDetailRequested value)?  requested,TResult Function( FreelancerServiceRequestDetailApplyConfirmed value)?  applyConfirmed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FreelancerServiceRequestDetailRequested() when requested != null:
return requested(_that);case FreelancerServiceRequestDetailApplyConfirmed() when applyConfirmed != null:
return applyConfirmed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FreelancerServiceRequestDetailRequested value)  requested,required TResult Function( FreelancerServiceRequestDetailApplyConfirmed value)  applyConfirmed,}){
final _that = this;
switch (_that) {
case FreelancerServiceRequestDetailRequested():
return requested(_that);case FreelancerServiceRequestDetailApplyConfirmed():
return applyConfirmed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FreelancerServiceRequestDetailRequested value)?  requested,TResult? Function( FreelancerServiceRequestDetailApplyConfirmed value)?  applyConfirmed,}){
final _that = this;
switch (_that) {
case FreelancerServiceRequestDetailRequested() when requested != null:
return requested(_that);case FreelancerServiceRequestDetailApplyConfirmed() when applyConfirmed != null:
return applyConfirmed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String serviceRequestId)?  requested,TResult Function( String serviceRequestId)?  applyConfirmed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FreelancerServiceRequestDetailRequested() when requested != null:
return requested(_that.serviceRequestId);case FreelancerServiceRequestDetailApplyConfirmed() when applyConfirmed != null:
return applyConfirmed(_that.serviceRequestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String serviceRequestId)  requested,required TResult Function( String serviceRequestId)  applyConfirmed,}) {final _that = this;
switch (_that) {
case FreelancerServiceRequestDetailRequested():
return requested(_that.serviceRequestId);case FreelancerServiceRequestDetailApplyConfirmed():
return applyConfirmed(_that.serviceRequestId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String serviceRequestId)?  requested,TResult? Function( String serviceRequestId)?  applyConfirmed,}) {final _that = this;
switch (_that) {
case FreelancerServiceRequestDetailRequested() when requested != null:
return requested(_that.serviceRequestId);case FreelancerServiceRequestDetailApplyConfirmed() when applyConfirmed != null:
return applyConfirmed(_that.serviceRequestId);case _:
  return null;

}
}

}

/// @nodoc


class FreelancerServiceRequestDetailRequested implements FreelancerServiceRequestDetailEvent {
  const FreelancerServiceRequestDetailRequested({required this.serviceRequestId});
  

@override final  String serviceRequestId;

/// Create a copy of FreelancerServiceRequestDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerServiceRequestDetailRequestedCopyWith<FreelancerServiceRequestDetailRequested> get copyWith => _$FreelancerServiceRequestDetailRequestedCopyWithImpl<FreelancerServiceRequestDetailRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerServiceRequestDetailRequested&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId));
}


@override
int get hashCode => Object.hash(runtimeType,serviceRequestId);

@override
String toString() {
  return 'FreelancerServiceRequestDetailEvent.requested(serviceRequestId: $serviceRequestId)';
}


}

/// @nodoc
abstract mixin class $FreelancerServiceRequestDetailRequestedCopyWith<$Res> implements $FreelancerServiceRequestDetailEventCopyWith<$Res> {
  factory $FreelancerServiceRequestDetailRequestedCopyWith(FreelancerServiceRequestDetailRequested value, $Res Function(FreelancerServiceRequestDetailRequested) _then) = _$FreelancerServiceRequestDetailRequestedCopyWithImpl;
@override @useResult
$Res call({
 String serviceRequestId
});




}
/// @nodoc
class _$FreelancerServiceRequestDetailRequestedCopyWithImpl<$Res>
    implements $FreelancerServiceRequestDetailRequestedCopyWith<$Res> {
  _$FreelancerServiceRequestDetailRequestedCopyWithImpl(this._self, this._then);

  final FreelancerServiceRequestDetailRequested _self;
  final $Res Function(FreelancerServiceRequestDetailRequested) _then;

/// Create a copy of FreelancerServiceRequestDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceRequestId = null,}) {
  return _then(FreelancerServiceRequestDetailRequested(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class FreelancerServiceRequestDetailApplyConfirmed implements FreelancerServiceRequestDetailEvent {
  const FreelancerServiceRequestDetailApplyConfirmed({required this.serviceRequestId});
  

@override final  String serviceRequestId;

/// Create a copy of FreelancerServiceRequestDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerServiceRequestDetailApplyConfirmedCopyWith<FreelancerServiceRequestDetailApplyConfirmed> get copyWith => _$FreelancerServiceRequestDetailApplyConfirmedCopyWithImpl<FreelancerServiceRequestDetailApplyConfirmed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerServiceRequestDetailApplyConfirmed&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId));
}


@override
int get hashCode => Object.hash(runtimeType,serviceRequestId);

@override
String toString() {
  return 'FreelancerServiceRequestDetailEvent.applyConfirmed(serviceRequestId: $serviceRequestId)';
}


}

/// @nodoc
abstract mixin class $FreelancerServiceRequestDetailApplyConfirmedCopyWith<$Res> implements $FreelancerServiceRequestDetailEventCopyWith<$Res> {
  factory $FreelancerServiceRequestDetailApplyConfirmedCopyWith(FreelancerServiceRequestDetailApplyConfirmed value, $Res Function(FreelancerServiceRequestDetailApplyConfirmed) _then) = _$FreelancerServiceRequestDetailApplyConfirmedCopyWithImpl;
@override @useResult
$Res call({
 String serviceRequestId
});




}
/// @nodoc
class _$FreelancerServiceRequestDetailApplyConfirmedCopyWithImpl<$Res>
    implements $FreelancerServiceRequestDetailApplyConfirmedCopyWith<$Res> {
  _$FreelancerServiceRequestDetailApplyConfirmedCopyWithImpl(this._self, this._then);

  final FreelancerServiceRequestDetailApplyConfirmed _self;
  final $Res Function(FreelancerServiceRequestDetailApplyConfirmed) _then;

/// Create a copy of FreelancerServiceRequestDetailEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceRequestId = null,}) {
  return _then(FreelancerServiceRequestDetailApplyConfirmed(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
