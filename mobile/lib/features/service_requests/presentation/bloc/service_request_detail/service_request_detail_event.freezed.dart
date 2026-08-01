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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServiceRequestDetailRequested value)?  requested,TResult Function( ServiceRequestDetailRefreshRequested value)?  refreshRequested,TResult Function( ServiceRequestDetailActivityRequested value)?  activityRequested,TResult Function( ServiceRequestDetailActivityRefreshRequested value)?  activityRefreshRequested,TResult Function( ServiceRequestDetailProfessionalRequested value)?  professionalRequested,TResult Function( ServiceRequestDetailProfessionalRefreshRequested value)?  professionalRefreshRequested,TResult Function( ServiceRequestDetailRevokeEngagementRequested value)?  revokeEngagementRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServiceRequestDetailRequested() when requested != null:
return requested(_that);case ServiceRequestDetailRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case ServiceRequestDetailActivityRequested() when activityRequested != null:
return activityRequested(_that);case ServiceRequestDetailActivityRefreshRequested() when activityRefreshRequested != null:
return activityRefreshRequested(_that);case ServiceRequestDetailProfessionalRequested() when professionalRequested != null:
return professionalRequested(_that);case ServiceRequestDetailProfessionalRefreshRequested() when professionalRefreshRequested != null:
return professionalRefreshRequested(_that);case ServiceRequestDetailRevokeEngagementRequested() when revokeEngagementRequested != null:
return revokeEngagementRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServiceRequestDetailRequested value)  requested,required TResult Function( ServiceRequestDetailRefreshRequested value)  refreshRequested,required TResult Function( ServiceRequestDetailActivityRequested value)  activityRequested,required TResult Function( ServiceRequestDetailActivityRefreshRequested value)  activityRefreshRequested,required TResult Function( ServiceRequestDetailProfessionalRequested value)  professionalRequested,required TResult Function( ServiceRequestDetailProfessionalRefreshRequested value)  professionalRefreshRequested,required TResult Function( ServiceRequestDetailRevokeEngagementRequested value)  revokeEngagementRequested,}){
final _that = this;
switch (_that) {
case ServiceRequestDetailRequested():
return requested(_that);case ServiceRequestDetailRefreshRequested():
return refreshRequested(_that);case ServiceRequestDetailActivityRequested():
return activityRequested(_that);case ServiceRequestDetailActivityRefreshRequested():
return activityRefreshRequested(_that);case ServiceRequestDetailProfessionalRequested():
return professionalRequested(_that);case ServiceRequestDetailProfessionalRefreshRequested():
return professionalRefreshRequested(_that);case ServiceRequestDetailRevokeEngagementRequested():
return revokeEngagementRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServiceRequestDetailRequested value)?  requested,TResult? Function( ServiceRequestDetailRefreshRequested value)?  refreshRequested,TResult? Function( ServiceRequestDetailActivityRequested value)?  activityRequested,TResult? Function( ServiceRequestDetailActivityRefreshRequested value)?  activityRefreshRequested,TResult? Function( ServiceRequestDetailProfessionalRequested value)?  professionalRequested,TResult? Function( ServiceRequestDetailProfessionalRefreshRequested value)?  professionalRefreshRequested,TResult? Function( ServiceRequestDetailRevokeEngagementRequested value)?  revokeEngagementRequested,}){
final _that = this;
switch (_that) {
case ServiceRequestDetailRequested() when requested != null:
return requested(_that);case ServiceRequestDetailRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case ServiceRequestDetailActivityRequested() when activityRequested != null:
return activityRequested(_that);case ServiceRequestDetailActivityRefreshRequested() when activityRefreshRequested != null:
return activityRefreshRequested(_that);case ServiceRequestDetailProfessionalRequested() when professionalRequested != null:
return professionalRequested(_that);case ServiceRequestDetailProfessionalRefreshRequested() when professionalRefreshRequested != null:
return professionalRefreshRequested(_that);case ServiceRequestDetailRevokeEngagementRequested() when revokeEngagementRequested != null:
return revokeEngagementRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String serviceRequestId)?  requested,TResult Function()?  refreshRequested,TResult Function()?  activityRequested,TResult Function()?  activityRefreshRequested,TResult Function()?  professionalRequested,TResult Function()?  professionalRefreshRequested,TResult Function()?  revokeEngagementRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServiceRequestDetailRequested() when requested != null:
return requested(_that.serviceRequestId);case ServiceRequestDetailRefreshRequested() when refreshRequested != null:
return refreshRequested();case ServiceRequestDetailActivityRequested() when activityRequested != null:
return activityRequested();case ServiceRequestDetailActivityRefreshRequested() when activityRefreshRequested != null:
return activityRefreshRequested();case ServiceRequestDetailProfessionalRequested() when professionalRequested != null:
return professionalRequested();case ServiceRequestDetailProfessionalRefreshRequested() when professionalRefreshRequested != null:
return professionalRefreshRequested();case ServiceRequestDetailRevokeEngagementRequested() when revokeEngagementRequested != null:
return revokeEngagementRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String serviceRequestId)  requested,required TResult Function()  refreshRequested,required TResult Function()  activityRequested,required TResult Function()  activityRefreshRequested,required TResult Function()  professionalRequested,required TResult Function()  professionalRefreshRequested,required TResult Function()  revokeEngagementRequested,}) {final _that = this;
switch (_that) {
case ServiceRequestDetailRequested():
return requested(_that.serviceRequestId);case ServiceRequestDetailRefreshRequested():
return refreshRequested();case ServiceRequestDetailActivityRequested():
return activityRequested();case ServiceRequestDetailActivityRefreshRequested():
return activityRefreshRequested();case ServiceRequestDetailProfessionalRequested():
return professionalRequested();case ServiceRequestDetailProfessionalRefreshRequested():
return professionalRefreshRequested();case ServiceRequestDetailRevokeEngagementRequested():
return revokeEngagementRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String serviceRequestId)?  requested,TResult? Function()?  refreshRequested,TResult? Function()?  activityRequested,TResult? Function()?  activityRefreshRequested,TResult? Function()?  professionalRequested,TResult? Function()?  professionalRefreshRequested,TResult? Function()?  revokeEngagementRequested,}) {final _that = this;
switch (_that) {
case ServiceRequestDetailRequested() when requested != null:
return requested(_that.serviceRequestId);case ServiceRequestDetailRefreshRequested() when refreshRequested != null:
return refreshRequested();case ServiceRequestDetailActivityRequested() when activityRequested != null:
return activityRequested();case ServiceRequestDetailActivityRefreshRequested() when activityRefreshRequested != null:
return activityRefreshRequested();case ServiceRequestDetailProfessionalRequested() when professionalRequested != null:
return professionalRequested();case ServiceRequestDetailProfessionalRefreshRequested() when professionalRefreshRequested != null:
return professionalRefreshRequested();case ServiceRequestDetailRevokeEngagementRequested() when revokeEngagementRequested != null:
return revokeEngagementRequested();case _:
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




/// @nodoc


class ServiceRequestDetailActivityRequested implements ServiceRequestDetailEvent {
  const ServiceRequestDetailActivityRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailActivityRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestDetailEvent.activityRequested()';
}


}




/// @nodoc


class ServiceRequestDetailActivityRefreshRequested implements ServiceRequestDetailEvent {
  const ServiceRequestDetailActivityRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailActivityRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestDetailEvent.activityRefreshRequested()';
}


}




/// @nodoc


class ServiceRequestDetailProfessionalRequested implements ServiceRequestDetailEvent {
  const ServiceRequestDetailProfessionalRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailProfessionalRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestDetailEvent.professionalRequested()';
}


}




/// @nodoc


class ServiceRequestDetailProfessionalRefreshRequested implements ServiceRequestDetailEvent {
  const ServiceRequestDetailProfessionalRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailProfessionalRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestDetailEvent.professionalRefreshRequested()';
}


}




/// @nodoc


class ServiceRequestDetailRevokeEngagementRequested implements ServiceRequestDetailEvent {
  const ServiceRequestDetailRevokeEngagementRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailRevokeEngagementRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestDetailEvent.revokeEngagementRequested()';
}


}




// dart format on
