// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceRequestDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestDetailEvent()';
}


}

/// @nodoc
class $ServiceRequestDetailEventCopyWith<$Res>  {
$ServiceRequestDetailEventCopyWith(ServiceRequestDetailEvent _, $Res Function(ServiceRequestDetailEvent) __);
}


/// Adds pattern-matching-related methods to [ServiceRequestDetailEvent].
extension ServiceRequestDetailEventPatterns on ServiceRequestDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServiceRequestDetailRequested value)?  requested,TResult Function( ServiceRequestDetailRefreshRequested value)?  refreshRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServiceRequestDetailRequested() when requested != null:
return requested(_that);case ServiceRequestDetailRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServiceRequestDetailRequested value)  requested,required TResult Function( ServiceRequestDetailRefreshRequested value)  refreshRequested,}){
final _that = this;
switch (_that) {
case ServiceRequestDetailRequested():
return requested(_that);case ServiceRequestDetailRefreshRequested():
return refreshRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServiceRequestDetailRequested value)?  requested,TResult? Function( ServiceRequestDetailRefreshRequested value)?  refreshRequested,}){
final _that = this;
switch (_that) {
case ServiceRequestDetailRequested() when requested != null:
return requested(_that);case ServiceRequestDetailRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String serviceRequestId)?  requested,TResult Function()?  refreshRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServiceRequestDetailRequested() when requested != null:
return requested(_that.serviceRequestId);case ServiceRequestDetailRefreshRequested() when refreshRequested != null:
return refreshRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String serviceRequestId)  requested,required TResult Function()  refreshRequested,}) {final _that = this;
switch (_that) {
case ServiceRequestDetailRequested():
return requested(_that.serviceRequestId);case ServiceRequestDetailRefreshRequested():
return refreshRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String serviceRequestId)?  requested,TResult? Function()?  refreshRequested,}) {final _that = this;
switch (_that) {
case ServiceRequestDetailRequested() when requested != null:
return requested(_that.serviceRequestId);case ServiceRequestDetailRefreshRequested() when refreshRequested != null:
return refreshRequested();case _:
  return null;

}
}

}

/// @nodoc


class ServiceRequestDetailRequested implements ServiceRequestDetailEvent {
  const ServiceRequestDetailRequested({required this.serviceRequestId});
  

 final  String serviceRequestId;

/// Create a copy of ServiceRequestDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestDetailRequestedCopyWith<ServiceRequestDetailRequested> get copyWith => _$ServiceRequestDetailRequestedCopyWithImpl<ServiceRequestDetailRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailRequested&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId));
}


@override
int get hashCode => Object.hash(runtimeType,serviceRequestId);

@override
String toString() {
  return 'ServiceRequestDetailEvent.requested(serviceRequestId: $serviceRequestId)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestDetailRequestedCopyWith<$Res> implements $ServiceRequestDetailEventCopyWith<$Res> {
  factory $ServiceRequestDetailRequestedCopyWith(ServiceRequestDetailRequested value, $Res Function(ServiceRequestDetailRequested) _then) = _$ServiceRequestDetailRequestedCopyWithImpl;
@useResult
$Res call({
 String serviceRequestId
});




}
/// @nodoc
class _$ServiceRequestDetailRequestedCopyWithImpl<$Res>
    implements $ServiceRequestDetailRequestedCopyWith<$Res> {
  _$ServiceRequestDetailRequestedCopyWithImpl(this._self, this._then);

  final ServiceRequestDetailRequested _self;
  final $Res Function(ServiceRequestDetailRequested) _then;

/// Create a copy of ServiceRequestDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceRequestId = null,}) {
  return _then(ServiceRequestDetailRequested(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ServiceRequestDetailRefreshRequested implements ServiceRequestDetailEvent {
  const ServiceRequestDetailRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestDetailEvent.refreshRequested()';
}


}




// dart format on
