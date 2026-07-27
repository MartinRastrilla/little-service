// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_applications_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceRequestApplicationsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestApplicationsEvent()';
}


}

/// @nodoc
class $ServiceRequestApplicationsEventCopyWith<$Res>  {
$ServiceRequestApplicationsEventCopyWith(ServiceRequestApplicationsEvent _, $Res Function(ServiceRequestApplicationsEvent) __);
}


/// Adds pattern-matching-related methods to [ServiceRequestApplicationsEvent].
extension ServiceRequestApplicationsEventPatterns on ServiceRequestApplicationsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServiceRequestApplicationsStarted value)?  started,TResult Function( ServiceRequestApplicationsFilterChanged value)?  filterChanged,TResult Function( ServiceRequestApplicationsRefreshRequested value)?  refreshRequested,TResult Function( ServiceRequestApplicationsAcceptRequested value)?  acceptRequested,TResult Function( ServiceRequestApplicationsRejectRequested value)?  rejectRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServiceRequestApplicationsStarted() when started != null:
return started(_that);case ServiceRequestApplicationsFilterChanged() when filterChanged != null:
return filterChanged(_that);case ServiceRequestApplicationsRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case ServiceRequestApplicationsAcceptRequested() when acceptRequested != null:
return acceptRequested(_that);case ServiceRequestApplicationsRejectRequested() when rejectRequested != null:
return rejectRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServiceRequestApplicationsStarted value)  started,required TResult Function( ServiceRequestApplicationsFilterChanged value)  filterChanged,required TResult Function( ServiceRequestApplicationsRefreshRequested value)  refreshRequested,required TResult Function( ServiceRequestApplicationsAcceptRequested value)  acceptRequested,required TResult Function( ServiceRequestApplicationsRejectRequested value)  rejectRequested,}){
final _that = this;
switch (_that) {
case ServiceRequestApplicationsStarted():
return started(_that);case ServiceRequestApplicationsFilterChanged():
return filterChanged(_that);case ServiceRequestApplicationsRefreshRequested():
return refreshRequested(_that);case ServiceRequestApplicationsAcceptRequested():
return acceptRequested(_that);case ServiceRequestApplicationsRejectRequested():
return rejectRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServiceRequestApplicationsStarted value)?  started,TResult? Function( ServiceRequestApplicationsFilterChanged value)?  filterChanged,TResult? Function( ServiceRequestApplicationsRefreshRequested value)?  refreshRequested,TResult? Function( ServiceRequestApplicationsAcceptRequested value)?  acceptRequested,TResult? Function( ServiceRequestApplicationsRejectRequested value)?  rejectRequested,}){
final _that = this;
switch (_that) {
case ServiceRequestApplicationsStarted() when started != null:
return started(_that);case ServiceRequestApplicationsFilterChanged() when filterChanged != null:
return filterChanged(_that);case ServiceRequestApplicationsRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case ServiceRequestApplicationsAcceptRequested() when acceptRequested != null:
return acceptRequested(_that);case ServiceRequestApplicationsRejectRequested() when rejectRequested != null:
return rejectRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String serviceRequestId)?  started,TResult Function( ServiceRequestApplicationFilter filter)?  filterChanged,TResult Function()?  refreshRequested,TResult Function( String applicationId,  String freelancerName)?  acceptRequested,TResult Function( String applicationId,  String freelancerName)?  rejectRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServiceRequestApplicationsStarted() when started != null:
return started(_that.serviceRequestId);case ServiceRequestApplicationsFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case ServiceRequestApplicationsRefreshRequested() when refreshRequested != null:
return refreshRequested();case ServiceRequestApplicationsAcceptRequested() when acceptRequested != null:
return acceptRequested(_that.applicationId,_that.freelancerName);case ServiceRequestApplicationsRejectRequested() when rejectRequested != null:
return rejectRequested(_that.applicationId,_that.freelancerName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String serviceRequestId)  started,required TResult Function( ServiceRequestApplicationFilter filter)  filterChanged,required TResult Function()  refreshRequested,required TResult Function( String applicationId,  String freelancerName)  acceptRequested,required TResult Function( String applicationId,  String freelancerName)  rejectRequested,}) {final _that = this;
switch (_that) {
case ServiceRequestApplicationsStarted():
return started(_that.serviceRequestId);case ServiceRequestApplicationsFilterChanged():
return filterChanged(_that.filter);case ServiceRequestApplicationsRefreshRequested():
return refreshRequested();case ServiceRequestApplicationsAcceptRequested():
return acceptRequested(_that.applicationId,_that.freelancerName);case ServiceRequestApplicationsRejectRequested():
return rejectRequested(_that.applicationId,_that.freelancerName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String serviceRequestId)?  started,TResult? Function( ServiceRequestApplicationFilter filter)?  filterChanged,TResult? Function()?  refreshRequested,TResult? Function( String applicationId,  String freelancerName)?  acceptRequested,TResult? Function( String applicationId,  String freelancerName)?  rejectRequested,}) {final _that = this;
switch (_that) {
case ServiceRequestApplicationsStarted() when started != null:
return started(_that.serviceRequestId);case ServiceRequestApplicationsFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case ServiceRequestApplicationsRefreshRequested() when refreshRequested != null:
return refreshRequested();case ServiceRequestApplicationsAcceptRequested() when acceptRequested != null:
return acceptRequested(_that.applicationId,_that.freelancerName);case ServiceRequestApplicationsRejectRequested() when rejectRequested != null:
return rejectRequested(_that.applicationId,_that.freelancerName);case _:
  return null;

}
}

}

/// @nodoc


class ServiceRequestApplicationsStarted implements ServiceRequestApplicationsEvent {
  const ServiceRequestApplicationsStarted({required this.serviceRequestId});
  

 final  String serviceRequestId;

/// Create a copy of ServiceRequestApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestApplicationsStartedCopyWith<ServiceRequestApplicationsStarted> get copyWith => _$ServiceRequestApplicationsStartedCopyWithImpl<ServiceRequestApplicationsStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsStarted&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId));
}


@override
int get hashCode => Object.hash(runtimeType,serviceRequestId);

@override
String toString() {
  return 'ServiceRequestApplicationsEvent.started(serviceRequestId: $serviceRequestId)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestApplicationsStartedCopyWith<$Res> implements $ServiceRequestApplicationsEventCopyWith<$Res> {
  factory $ServiceRequestApplicationsStartedCopyWith(ServiceRequestApplicationsStarted value, $Res Function(ServiceRequestApplicationsStarted) _then) = _$ServiceRequestApplicationsStartedCopyWithImpl;
@useResult
$Res call({
 String serviceRequestId
});




}
/// @nodoc
class _$ServiceRequestApplicationsStartedCopyWithImpl<$Res>
    implements $ServiceRequestApplicationsStartedCopyWith<$Res> {
  _$ServiceRequestApplicationsStartedCopyWithImpl(this._self, this._then);

  final ServiceRequestApplicationsStarted _self;
  final $Res Function(ServiceRequestApplicationsStarted) _then;

/// Create a copy of ServiceRequestApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceRequestId = null,}) {
  return _then(ServiceRequestApplicationsStarted(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ServiceRequestApplicationsFilterChanged implements ServiceRequestApplicationsEvent {
  const ServiceRequestApplicationsFilterChanged({required this.filter});
  

 final  ServiceRequestApplicationFilter filter;

/// Create a copy of ServiceRequestApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestApplicationsFilterChangedCopyWith<ServiceRequestApplicationsFilterChanged> get copyWith => _$ServiceRequestApplicationsFilterChangedCopyWithImpl<ServiceRequestApplicationsFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsFilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ServiceRequestApplicationsEvent.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestApplicationsFilterChangedCopyWith<$Res> implements $ServiceRequestApplicationsEventCopyWith<$Res> {
  factory $ServiceRequestApplicationsFilterChangedCopyWith(ServiceRequestApplicationsFilterChanged value, $Res Function(ServiceRequestApplicationsFilterChanged) _then) = _$ServiceRequestApplicationsFilterChangedCopyWithImpl;
@useResult
$Res call({
 ServiceRequestApplicationFilter filter
});




}
/// @nodoc
class _$ServiceRequestApplicationsFilterChangedCopyWithImpl<$Res>
    implements $ServiceRequestApplicationsFilterChangedCopyWith<$Res> {
  _$ServiceRequestApplicationsFilterChangedCopyWithImpl(this._self, this._then);

  final ServiceRequestApplicationsFilterChanged _self;
  final $Res Function(ServiceRequestApplicationsFilterChanged) _then;

/// Create a copy of ServiceRequestApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(ServiceRequestApplicationsFilterChanged(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ServiceRequestApplicationFilter,
  ));
}


}

/// @nodoc


class ServiceRequestApplicationsRefreshRequested implements ServiceRequestApplicationsEvent {
  const ServiceRequestApplicationsRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestApplicationsEvent.refreshRequested()';
}


}




/// @nodoc


class ServiceRequestApplicationsAcceptRequested implements ServiceRequestApplicationsEvent {
  const ServiceRequestApplicationsAcceptRequested({required this.applicationId, required this.freelancerName});
  

 final  String applicationId;
 final  String freelancerName;

/// Create a copy of ServiceRequestApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestApplicationsAcceptRequestedCopyWith<ServiceRequestApplicationsAcceptRequested> get copyWith => _$ServiceRequestApplicationsAcceptRequestedCopyWithImpl<ServiceRequestApplicationsAcceptRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsAcceptRequested&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.freelancerName, freelancerName) || other.freelancerName == freelancerName));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,freelancerName);

@override
String toString() {
  return 'ServiceRequestApplicationsEvent.acceptRequested(applicationId: $applicationId, freelancerName: $freelancerName)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestApplicationsAcceptRequestedCopyWith<$Res> implements $ServiceRequestApplicationsEventCopyWith<$Res> {
  factory $ServiceRequestApplicationsAcceptRequestedCopyWith(ServiceRequestApplicationsAcceptRequested value, $Res Function(ServiceRequestApplicationsAcceptRequested) _then) = _$ServiceRequestApplicationsAcceptRequestedCopyWithImpl;
@useResult
$Res call({
 String applicationId, String freelancerName
});




}
/// @nodoc
class _$ServiceRequestApplicationsAcceptRequestedCopyWithImpl<$Res>
    implements $ServiceRequestApplicationsAcceptRequestedCopyWith<$Res> {
  _$ServiceRequestApplicationsAcceptRequestedCopyWithImpl(this._self, this._then);

  final ServiceRequestApplicationsAcceptRequested _self;
  final $Res Function(ServiceRequestApplicationsAcceptRequested) _then;

/// Create a copy of ServiceRequestApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? freelancerName = null,}) {
  return _then(ServiceRequestApplicationsAcceptRequested(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,freelancerName: null == freelancerName ? _self.freelancerName : freelancerName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ServiceRequestApplicationsRejectRequested implements ServiceRequestApplicationsEvent {
  const ServiceRequestApplicationsRejectRequested({required this.applicationId, required this.freelancerName});
  

 final  String applicationId;
 final  String freelancerName;

/// Create a copy of ServiceRequestApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestApplicationsRejectRequestedCopyWith<ServiceRequestApplicationsRejectRequested> get copyWith => _$ServiceRequestApplicationsRejectRequestedCopyWithImpl<ServiceRequestApplicationsRejectRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsRejectRequested&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.freelancerName, freelancerName) || other.freelancerName == freelancerName));
}


@override
int get hashCode => Object.hash(runtimeType,applicationId,freelancerName);

@override
String toString() {
  return 'ServiceRequestApplicationsEvent.rejectRequested(applicationId: $applicationId, freelancerName: $freelancerName)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestApplicationsRejectRequestedCopyWith<$Res> implements $ServiceRequestApplicationsEventCopyWith<$Res> {
  factory $ServiceRequestApplicationsRejectRequestedCopyWith(ServiceRequestApplicationsRejectRequested value, $Res Function(ServiceRequestApplicationsRejectRequested) _then) = _$ServiceRequestApplicationsRejectRequestedCopyWithImpl;
@useResult
$Res call({
 String applicationId, String freelancerName
});




}
/// @nodoc
class _$ServiceRequestApplicationsRejectRequestedCopyWithImpl<$Res>
    implements $ServiceRequestApplicationsRejectRequestedCopyWith<$Res> {
  _$ServiceRequestApplicationsRejectRequestedCopyWithImpl(this._self, this._then);

  final ServiceRequestApplicationsRejectRequested _self;
  final $Res Function(ServiceRequestApplicationsRejectRequested) _then;

/// Create a copy of ServiceRequestApplicationsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applicationId = null,Object? freelancerName = null,}) {
  return _then(ServiceRequestApplicationsRejectRequested(
applicationId: null == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String,freelancerName: null == freelancerName ? _self.freelancerName : freelancerName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
