// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_applications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceRequestApplicationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestApplicationsState()';
}


}

/// @nodoc
class $ServiceRequestApplicationsStateCopyWith<$Res>  {
$ServiceRequestApplicationsStateCopyWith(ServiceRequestApplicationsState _, $Res Function(ServiceRequestApplicationsState) __);
}


/// Adds pattern-matching-related methods to [ServiceRequestApplicationsState].
extension ServiceRequestApplicationsStatePatterns on ServiceRequestApplicationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServiceRequestApplicationsInitial value)?  initial,TResult Function( ServiceRequestApplicationsLoading value)?  loading,TResult Function( ServiceRequestApplicationsLoaded value)?  loaded,TResult Function( ServiceRequestApplicationsEmpty value)?  empty,TResult Function( ServiceRequestApplicationsFailure value)?  failure,TResult Function( ServiceRequestApplicationsActionSuccess value)?  actionSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServiceRequestApplicationsInitial() when initial != null:
return initial(_that);case ServiceRequestApplicationsLoading() when loading != null:
return loading(_that);case ServiceRequestApplicationsLoaded() when loaded != null:
return loaded(_that);case ServiceRequestApplicationsEmpty() when empty != null:
return empty(_that);case ServiceRequestApplicationsFailure() when failure != null:
return failure(_that);case ServiceRequestApplicationsActionSuccess() when actionSuccess != null:
return actionSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServiceRequestApplicationsInitial value)  initial,required TResult Function( ServiceRequestApplicationsLoading value)  loading,required TResult Function( ServiceRequestApplicationsLoaded value)  loaded,required TResult Function( ServiceRequestApplicationsEmpty value)  empty,required TResult Function( ServiceRequestApplicationsFailure value)  failure,required TResult Function( ServiceRequestApplicationsActionSuccess value)  actionSuccess,}){
final _that = this;
switch (_that) {
case ServiceRequestApplicationsInitial():
return initial(_that);case ServiceRequestApplicationsLoading():
return loading(_that);case ServiceRequestApplicationsLoaded():
return loaded(_that);case ServiceRequestApplicationsEmpty():
return empty(_that);case ServiceRequestApplicationsFailure():
return failure(_that);case ServiceRequestApplicationsActionSuccess():
return actionSuccess(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServiceRequestApplicationsInitial value)?  initial,TResult? Function( ServiceRequestApplicationsLoading value)?  loading,TResult? Function( ServiceRequestApplicationsLoaded value)?  loaded,TResult? Function( ServiceRequestApplicationsEmpty value)?  empty,TResult? Function( ServiceRequestApplicationsFailure value)?  failure,TResult? Function( ServiceRequestApplicationsActionSuccess value)?  actionSuccess,}){
final _that = this;
switch (_that) {
case ServiceRequestApplicationsInitial() when initial != null:
return initial(_that);case ServiceRequestApplicationsLoading() when loading != null:
return loading(_that);case ServiceRequestApplicationsLoaded() when loaded != null:
return loaded(_that);case ServiceRequestApplicationsEmpty() when empty != null:
return empty(_that);case ServiceRequestApplicationsFailure() when failure != null:
return failure(_that);case ServiceRequestApplicationsActionSuccess() when actionSuccess != null:
return actionSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( ServiceRequestApplicationFilter filter)?  loading,TResult Function( List<ServiceRequestApplication> applications,  List<ServiceRequestApplication> allApplications,  bool canManageApplications,  String serviceRequestTitle,  String serviceRequestDisplayStatus,  ServiceRequestApplicationFilter filter,  String? actionInProgressApplicationId)?  loaded,TResult Function( bool canManageApplications,  String serviceRequestTitle,  String serviceRequestDisplayStatus,  ServiceRequestApplicationFilter filter)?  empty,TResult Function( String message,  ServiceRequestApplicationFilter filter)?  failure,TResult Function( bool accepted)?  actionSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServiceRequestApplicationsInitial() when initial != null:
return initial();case ServiceRequestApplicationsLoading() when loading != null:
return loading(_that.filter);case ServiceRequestApplicationsLoaded() when loaded != null:
return loaded(_that.applications,_that.allApplications,_that.canManageApplications,_that.serviceRequestTitle,_that.serviceRequestDisplayStatus,_that.filter,_that.actionInProgressApplicationId);case ServiceRequestApplicationsEmpty() when empty != null:
return empty(_that.canManageApplications,_that.serviceRequestTitle,_that.serviceRequestDisplayStatus,_that.filter);case ServiceRequestApplicationsFailure() when failure != null:
return failure(_that.message,_that.filter);case ServiceRequestApplicationsActionSuccess() when actionSuccess != null:
return actionSuccess(_that.accepted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( ServiceRequestApplicationFilter filter)  loading,required TResult Function( List<ServiceRequestApplication> applications,  List<ServiceRequestApplication> allApplications,  bool canManageApplications,  String serviceRequestTitle,  String serviceRequestDisplayStatus,  ServiceRequestApplicationFilter filter,  String? actionInProgressApplicationId)  loaded,required TResult Function( bool canManageApplications,  String serviceRequestTitle,  String serviceRequestDisplayStatus,  ServiceRequestApplicationFilter filter)  empty,required TResult Function( String message,  ServiceRequestApplicationFilter filter)  failure,required TResult Function( bool accepted)  actionSuccess,}) {final _that = this;
switch (_that) {
case ServiceRequestApplicationsInitial():
return initial();case ServiceRequestApplicationsLoading():
return loading(_that.filter);case ServiceRequestApplicationsLoaded():
return loaded(_that.applications,_that.allApplications,_that.canManageApplications,_that.serviceRequestTitle,_that.serviceRequestDisplayStatus,_that.filter,_that.actionInProgressApplicationId);case ServiceRequestApplicationsEmpty():
return empty(_that.canManageApplications,_that.serviceRequestTitle,_that.serviceRequestDisplayStatus,_that.filter);case ServiceRequestApplicationsFailure():
return failure(_that.message,_that.filter);case ServiceRequestApplicationsActionSuccess():
return actionSuccess(_that.accepted);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( ServiceRequestApplicationFilter filter)?  loading,TResult? Function( List<ServiceRequestApplication> applications,  List<ServiceRequestApplication> allApplications,  bool canManageApplications,  String serviceRequestTitle,  String serviceRequestDisplayStatus,  ServiceRequestApplicationFilter filter,  String? actionInProgressApplicationId)?  loaded,TResult? Function( bool canManageApplications,  String serviceRequestTitle,  String serviceRequestDisplayStatus,  ServiceRequestApplicationFilter filter)?  empty,TResult? Function( String message,  ServiceRequestApplicationFilter filter)?  failure,TResult? Function( bool accepted)?  actionSuccess,}) {final _that = this;
switch (_that) {
case ServiceRequestApplicationsInitial() when initial != null:
return initial();case ServiceRequestApplicationsLoading() when loading != null:
return loading(_that.filter);case ServiceRequestApplicationsLoaded() when loaded != null:
return loaded(_that.applications,_that.allApplications,_that.canManageApplications,_that.serviceRequestTitle,_that.serviceRequestDisplayStatus,_that.filter,_that.actionInProgressApplicationId);case ServiceRequestApplicationsEmpty() when empty != null:
return empty(_that.canManageApplications,_that.serviceRequestTitle,_that.serviceRequestDisplayStatus,_that.filter);case ServiceRequestApplicationsFailure() when failure != null:
return failure(_that.message,_that.filter);case ServiceRequestApplicationsActionSuccess() when actionSuccess != null:
return actionSuccess(_that.accepted);case _:
  return null;

}
}

}

/// @nodoc


class ServiceRequestApplicationsInitial implements ServiceRequestApplicationsState {
  const ServiceRequestApplicationsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestApplicationsState.initial()';
}


}




/// @nodoc


class ServiceRequestApplicationsLoading implements ServiceRequestApplicationsState {
  const ServiceRequestApplicationsLoading({this.filter = ServiceRequestApplicationFilter.pending});
  

@JsonKey() final  ServiceRequestApplicationFilter filter;

/// Create a copy of ServiceRequestApplicationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestApplicationsLoadingCopyWith<ServiceRequestApplicationsLoading> get copyWith => _$ServiceRequestApplicationsLoadingCopyWithImpl<ServiceRequestApplicationsLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsLoading&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'ServiceRequestApplicationsState.loading(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestApplicationsLoadingCopyWith<$Res> implements $ServiceRequestApplicationsStateCopyWith<$Res> {
  factory $ServiceRequestApplicationsLoadingCopyWith(ServiceRequestApplicationsLoading value, $Res Function(ServiceRequestApplicationsLoading) _then) = _$ServiceRequestApplicationsLoadingCopyWithImpl;
@useResult
$Res call({
 ServiceRequestApplicationFilter filter
});




}
/// @nodoc
class _$ServiceRequestApplicationsLoadingCopyWithImpl<$Res>
    implements $ServiceRequestApplicationsLoadingCopyWith<$Res> {
  _$ServiceRequestApplicationsLoadingCopyWithImpl(this._self, this._then);

  final ServiceRequestApplicationsLoading _self;
  final $Res Function(ServiceRequestApplicationsLoading) _then;

/// Create a copy of ServiceRequestApplicationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(ServiceRequestApplicationsLoading(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ServiceRequestApplicationFilter,
  ));
}


}

/// @nodoc


class ServiceRequestApplicationsLoaded implements ServiceRequestApplicationsState {
  const ServiceRequestApplicationsLoaded({required  List<ServiceRequestApplication> applications, required  List<ServiceRequestApplication> allApplications, required this.canManageApplications, required this.serviceRequestTitle, required this.serviceRequestDisplayStatus, required this.filter, this.actionInProgressApplicationId}): _applications = applications,_allApplications = allApplications;
  

 final  List<ServiceRequestApplication> _applications;
 List<ServiceRequestApplication> get applications {
  if (_applications is EqualUnmodifiableListView) return _applications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applications);
}

 final  List<ServiceRequestApplication> _allApplications;
 List<ServiceRequestApplication> get allApplications {
  if (_allApplications is EqualUnmodifiableListView) return _allApplications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allApplications);
}

 final  bool canManageApplications;
 final  String serviceRequestTitle;
 final  String serviceRequestDisplayStatus;
 final  ServiceRequestApplicationFilter filter;
 final  String? actionInProgressApplicationId;

/// Create a copy of ServiceRequestApplicationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestApplicationsLoadedCopyWith<ServiceRequestApplicationsLoaded> get copyWith => _$ServiceRequestApplicationsLoadedCopyWithImpl<ServiceRequestApplicationsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsLoaded&&const DeepCollectionEquality().equals(other._applications, _applications)&&const DeepCollectionEquality().equals(other._allApplications, _allApplications)&&(identical(other.canManageApplications, canManageApplications) || other.canManageApplications == canManageApplications)&&(identical(other.serviceRequestTitle, serviceRequestTitle) || other.serviceRequestTitle == serviceRequestTitle)&&(identical(other.serviceRequestDisplayStatus, serviceRequestDisplayStatus) || other.serviceRequestDisplayStatus == serviceRequestDisplayStatus)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.actionInProgressApplicationId, actionInProgressApplicationId) || other.actionInProgressApplicationId == actionInProgressApplicationId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_applications),const DeepCollectionEquality().hash(_allApplications),canManageApplications,serviceRequestTitle,serviceRequestDisplayStatus,filter,actionInProgressApplicationId);

@override
String toString() {
  return 'ServiceRequestApplicationsState.loaded(applications: $applications, allApplications: $allApplications, canManageApplications: $canManageApplications, serviceRequestTitle: $serviceRequestTitle, serviceRequestDisplayStatus: $serviceRequestDisplayStatus, filter: $filter, actionInProgressApplicationId: $actionInProgressApplicationId)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestApplicationsLoadedCopyWith<$Res> implements $ServiceRequestApplicationsStateCopyWith<$Res> {
  factory $ServiceRequestApplicationsLoadedCopyWith(ServiceRequestApplicationsLoaded value, $Res Function(ServiceRequestApplicationsLoaded) _then) = _$ServiceRequestApplicationsLoadedCopyWithImpl;
@useResult
$Res call({
 List<ServiceRequestApplication> applications, List<ServiceRequestApplication> allApplications, bool canManageApplications, String serviceRequestTitle, String serviceRequestDisplayStatus, ServiceRequestApplicationFilter filter, String? actionInProgressApplicationId
});




}
/// @nodoc
class _$ServiceRequestApplicationsLoadedCopyWithImpl<$Res>
    implements $ServiceRequestApplicationsLoadedCopyWith<$Res> {
  _$ServiceRequestApplicationsLoadedCopyWithImpl(this._self, this._then);

  final ServiceRequestApplicationsLoaded _self;
  final $Res Function(ServiceRequestApplicationsLoaded) _then;

/// Create a copy of ServiceRequestApplicationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? applications = null,Object? allApplications = null,Object? canManageApplications = null,Object? serviceRequestTitle = null,Object? serviceRequestDisplayStatus = null,Object? filter = null,Object? actionInProgressApplicationId = freezed,}) {
  return _then(ServiceRequestApplicationsLoaded(
applications: null == applications ? _self._applications : applications // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestApplication>,allApplications: null == allApplications ? _self._allApplications : allApplications // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestApplication>,canManageApplications: null == canManageApplications ? _self.canManageApplications : canManageApplications // ignore: cast_nullable_to_non_nullable
as bool,serviceRequestTitle: null == serviceRequestTitle ? _self.serviceRequestTitle : serviceRequestTitle // ignore: cast_nullable_to_non_nullable
as String,serviceRequestDisplayStatus: null == serviceRequestDisplayStatus ? _self.serviceRequestDisplayStatus : serviceRequestDisplayStatus // ignore: cast_nullable_to_non_nullable
as String,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ServiceRequestApplicationFilter,actionInProgressApplicationId: freezed == actionInProgressApplicationId ? _self.actionInProgressApplicationId : actionInProgressApplicationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ServiceRequestApplicationsEmpty implements ServiceRequestApplicationsState {
  const ServiceRequestApplicationsEmpty({required this.canManageApplications, required this.serviceRequestTitle, required this.serviceRequestDisplayStatus, required this.filter});
  

 final  bool canManageApplications;
 final  String serviceRequestTitle;
 final  String serviceRequestDisplayStatus;
 final  ServiceRequestApplicationFilter filter;

/// Create a copy of ServiceRequestApplicationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestApplicationsEmptyCopyWith<ServiceRequestApplicationsEmpty> get copyWith => _$ServiceRequestApplicationsEmptyCopyWithImpl<ServiceRequestApplicationsEmpty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsEmpty&&(identical(other.canManageApplications, canManageApplications) || other.canManageApplications == canManageApplications)&&(identical(other.serviceRequestTitle, serviceRequestTitle) || other.serviceRequestTitle == serviceRequestTitle)&&(identical(other.serviceRequestDisplayStatus, serviceRequestDisplayStatus) || other.serviceRequestDisplayStatus == serviceRequestDisplayStatus)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,canManageApplications,serviceRequestTitle,serviceRequestDisplayStatus,filter);

@override
String toString() {
  return 'ServiceRequestApplicationsState.empty(canManageApplications: $canManageApplications, serviceRequestTitle: $serviceRequestTitle, serviceRequestDisplayStatus: $serviceRequestDisplayStatus, filter: $filter)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestApplicationsEmptyCopyWith<$Res> implements $ServiceRequestApplicationsStateCopyWith<$Res> {
  factory $ServiceRequestApplicationsEmptyCopyWith(ServiceRequestApplicationsEmpty value, $Res Function(ServiceRequestApplicationsEmpty) _then) = _$ServiceRequestApplicationsEmptyCopyWithImpl;
@useResult
$Res call({
 bool canManageApplications, String serviceRequestTitle, String serviceRequestDisplayStatus, ServiceRequestApplicationFilter filter
});




}
/// @nodoc
class _$ServiceRequestApplicationsEmptyCopyWithImpl<$Res>
    implements $ServiceRequestApplicationsEmptyCopyWith<$Res> {
  _$ServiceRequestApplicationsEmptyCopyWithImpl(this._self, this._then);

  final ServiceRequestApplicationsEmpty _self;
  final $Res Function(ServiceRequestApplicationsEmpty) _then;

/// Create a copy of ServiceRequestApplicationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? canManageApplications = null,Object? serviceRequestTitle = null,Object? serviceRequestDisplayStatus = null,Object? filter = null,}) {
  return _then(ServiceRequestApplicationsEmpty(
canManageApplications: null == canManageApplications ? _self.canManageApplications : canManageApplications // ignore: cast_nullable_to_non_nullable
as bool,serviceRequestTitle: null == serviceRequestTitle ? _self.serviceRequestTitle : serviceRequestTitle // ignore: cast_nullable_to_non_nullable
as String,serviceRequestDisplayStatus: null == serviceRequestDisplayStatus ? _self.serviceRequestDisplayStatus : serviceRequestDisplayStatus // ignore: cast_nullable_to_non_nullable
as String,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ServiceRequestApplicationFilter,
  ));
}


}

/// @nodoc


class ServiceRequestApplicationsFailure implements ServiceRequestApplicationsState {
  const ServiceRequestApplicationsFailure({required this.message, required this.filter});
  

 final  String message;
 final  ServiceRequestApplicationFilter filter;

/// Create a copy of ServiceRequestApplicationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestApplicationsFailureCopyWith<ServiceRequestApplicationsFailure> get copyWith => _$ServiceRequestApplicationsFailureCopyWithImpl<ServiceRequestApplicationsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,message,filter);

@override
String toString() {
  return 'ServiceRequestApplicationsState.failure(message: $message, filter: $filter)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestApplicationsFailureCopyWith<$Res> implements $ServiceRequestApplicationsStateCopyWith<$Res> {
  factory $ServiceRequestApplicationsFailureCopyWith(ServiceRequestApplicationsFailure value, $Res Function(ServiceRequestApplicationsFailure) _then) = _$ServiceRequestApplicationsFailureCopyWithImpl;
@useResult
$Res call({
 String message, ServiceRequestApplicationFilter filter
});




}
/// @nodoc
class _$ServiceRequestApplicationsFailureCopyWithImpl<$Res>
    implements $ServiceRequestApplicationsFailureCopyWith<$Res> {
  _$ServiceRequestApplicationsFailureCopyWithImpl(this._self, this._then);

  final ServiceRequestApplicationsFailure _self;
  final $Res Function(ServiceRequestApplicationsFailure) _then;

/// Create a copy of ServiceRequestApplicationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? filter = null,}) {
  return _then(ServiceRequestApplicationsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ServiceRequestApplicationFilter,
  ));
}


}

/// @nodoc


class ServiceRequestApplicationsActionSuccess implements ServiceRequestApplicationsState {
  const ServiceRequestApplicationsActionSuccess({required this.accepted});
  

 final  bool accepted;

/// Create a copy of ServiceRequestApplicationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestApplicationsActionSuccessCopyWith<ServiceRequestApplicationsActionSuccess> get copyWith => _$ServiceRequestApplicationsActionSuccessCopyWithImpl<ServiceRequestApplicationsActionSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsActionSuccess&&(identical(other.accepted, accepted) || other.accepted == accepted));
}


@override
int get hashCode => Object.hash(runtimeType,accepted);

@override
String toString() {
  return 'ServiceRequestApplicationsState.actionSuccess(accepted: $accepted)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestApplicationsActionSuccessCopyWith<$Res> implements $ServiceRequestApplicationsStateCopyWith<$Res> {
  factory $ServiceRequestApplicationsActionSuccessCopyWith(ServiceRequestApplicationsActionSuccess value, $Res Function(ServiceRequestApplicationsActionSuccess) _then) = _$ServiceRequestApplicationsActionSuccessCopyWithImpl;
@useResult
$Res call({
 bool accepted
});




}
/// @nodoc
class _$ServiceRequestApplicationsActionSuccessCopyWithImpl<$Res>
    implements $ServiceRequestApplicationsActionSuccessCopyWith<$Res> {
  _$ServiceRequestApplicationsActionSuccessCopyWithImpl(this._self, this._then);

  final ServiceRequestApplicationsActionSuccess _self;
  final $Res Function(ServiceRequestApplicationsActionSuccess) _then;

/// Create a copy of ServiceRequestApplicationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accepted = null,}) {
  return _then(ServiceRequestApplicationsActionSuccess(
accepted: null == accepted ? _self.accepted : accepted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
