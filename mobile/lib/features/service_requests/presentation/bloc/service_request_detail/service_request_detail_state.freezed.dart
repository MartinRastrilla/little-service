// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServiceRequestDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestDetailState()';
}


}

/// @nodoc
class $ServiceRequestDetailStateCopyWith<$Res>  {
$ServiceRequestDetailStateCopyWith(ServiceRequestDetailState _, $Res Function(ServiceRequestDetailState) __);
}


/// Adds pattern-matching-related methods to [ServiceRequestDetailState].
extension ServiceRequestDetailStatePatterns on ServiceRequestDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServiceRequestDetailInitial value)?  initial,TResult Function( ServiceRequestDetailLoading value)?  loading,TResult Function( ServiceRequestDetailLoaded value)?  loaded,TResult Function( ServiceRequestDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServiceRequestDetailInitial() when initial != null:
return initial(_that);case ServiceRequestDetailLoading() when loading != null:
return loading(_that);case ServiceRequestDetailLoaded() when loaded != null:
return loaded(_that);case ServiceRequestDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServiceRequestDetailInitial value)  initial,required TResult Function( ServiceRequestDetailLoading value)  loading,required TResult Function( ServiceRequestDetailLoaded value)  loaded,required TResult Function( ServiceRequestDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case ServiceRequestDetailInitial():
return initial(_that);case ServiceRequestDetailLoading():
return loading(_that);case ServiceRequestDetailLoaded():
return loaded(_that);case ServiceRequestDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServiceRequestDetailInitial value)?  initial,TResult? Function( ServiceRequestDetailLoading value)?  loading,TResult? Function( ServiceRequestDetailLoaded value)?  loaded,TResult? Function( ServiceRequestDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ServiceRequestDetailInitial() when initial != null:
return initial(_that);case ServiceRequestDetailLoading() when loading != null:
return loading(_that);case ServiceRequestDetailLoaded() when loaded != null:
return loaded(_that);case ServiceRequestDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ServiceRequestInfo info,  ServiceRequestActivity? activity,  ActivityLoadStatus activityStatus,  String? activityErrorMessage,  ServiceRequestProfessional? professional,  FreelancerPublicProfile? freelancerProfile,  ActivityLoadStatus professionalStatus,  String? professionalErrorMessage,  bool isRevokingEngagement)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServiceRequestDetailInitial() when initial != null:
return initial();case ServiceRequestDetailLoading() when loading != null:
return loading();case ServiceRequestDetailLoaded() when loaded != null:
return loaded(_that.info,_that.activity,_that.activityStatus,_that.activityErrorMessage,_that.professional,_that.freelancerProfile,_that.professionalStatus,_that.professionalErrorMessage,_that.isRevokingEngagement);case ServiceRequestDetailFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ServiceRequestInfo info,  ServiceRequestActivity? activity,  ActivityLoadStatus activityStatus,  String? activityErrorMessage,  ServiceRequestProfessional? professional,  FreelancerPublicProfile? freelancerProfile,  ActivityLoadStatus professionalStatus,  String? professionalErrorMessage,  bool isRevokingEngagement)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ServiceRequestDetailInitial():
return initial();case ServiceRequestDetailLoading():
return loading();case ServiceRequestDetailLoaded():
return loaded(_that.info,_that.activity,_that.activityStatus,_that.activityErrorMessage,_that.professional,_that.freelancerProfile,_that.professionalStatus,_that.professionalErrorMessage,_that.isRevokingEngagement);case ServiceRequestDetailFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ServiceRequestInfo info,  ServiceRequestActivity? activity,  ActivityLoadStatus activityStatus,  String? activityErrorMessage,  ServiceRequestProfessional? professional,  FreelancerPublicProfile? freelancerProfile,  ActivityLoadStatus professionalStatus,  String? professionalErrorMessage,  bool isRevokingEngagement)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ServiceRequestDetailInitial() when initial != null:
return initial();case ServiceRequestDetailLoading() when loading != null:
return loading();case ServiceRequestDetailLoaded() when loaded != null:
return loaded(_that.info,_that.activity,_that.activityStatus,_that.activityErrorMessage,_that.professional,_that.freelancerProfile,_that.professionalStatus,_that.professionalErrorMessage,_that.isRevokingEngagement);case ServiceRequestDetailFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ServiceRequestDetailInitial implements ServiceRequestDetailState {
  const ServiceRequestDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestDetailState.initial()';
}


}




/// @nodoc


class ServiceRequestDetailLoading implements ServiceRequestDetailState {
  const ServiceRequestDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServiceRequestDetailState.loading()';
}


}




/// @nodoc


class ServiceRequestDetailLoaded implements ServiceRequestDetailState {
  const ServiceRequestDetailLoaded({required this.info, this.activity, this.activityStatus = ActivityLoadStatus.initial, this.activityErrorMessage, this.professional, this.freelancerProfile, this.professionalStatus = ActivityLoadStatus.initial, this.professionalErrorMessage, this.isRevokingEngagement = false});
  

 final  ServiceRequestInfo info;
 final  ServiceRequestActivity? activity;
@JsonKey() final  ActivityLoadStatus activityStatus;
 final  String? activityErrorMessage;
 final  ServiceRequestProfessional? professional;
 final  FreelancerPublicProfile? freelancerProfile;
@JsonKey() final  ActivityLoadStatus professionalStatus;
 final  String? professionalErrorMessage;
@JsonKey() final  bool isRevokingEngagement;

/// Create a copy of ServiceRequestDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestDetailLoadedCopyWith<ServiceRequestDetailLoaded> get copyWith => _$ServiceRequestDetailLoadedCopyWithImpl<ServiceRequestDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailLoaded&&(identical(other.info, info) || other.info == info)&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.activityStatus, activityStatus) || other.activityStatus == activityStatus)&&(identical(other.activityErrorMessage, activityErrorMessage) || other.activityErrorMessage == activityErrorMessage)&&(identical(other.professional, professional) || other.professional == professional)&&(identical(other.freelancerProfile, freelancerProfile) || other.freelancerProfile == freelancerProfile)&&(identical(other.professionalStatus, professionalStatus) || other.professionalStatus == professionalStatus)&&(identical(other.professionalErrorMessage, professionalErrorMessage) || other.professionalErrorMessage == professionalErrorMessage)&&(identical(other.isRevokingEngagement, isRevokingEngagement) || other.isRevokingEngagement == isRevokingEngagement));
}


@override
int get hashCode => Object.hash(runtimeType,info,activity,activityStatus,activityErrorMessage,professional,freelancerProfile,professionalStatus,professionalErrorMessage,isRevokingEngagement);

@override
String toString() {
  return 'ServiceRequestDetailState.loaded(info: $info, activity: $activity, activityStatus: $activityStatus, activityErrorMessage: $activityErrorMessage, professional: $professional, freelancerProfile: $freelancerProfile, professionalStatus: $professionalStatus, professionalErrorMessage: $professionalErrorMessage, isRevokingEngagement: $isRevokingEngagement)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestDetailLoadedCopyWith<$Res> implements $ServiceRequestDetailStateCopyWith<$Res> {
  factory $ServiceRequestDetailLoadedCopyWith(ServiceRequestDetailLoaded value, $Res Function(ServiceRequestDetailLoaded) _then) = _$ServiceRequestDetailLoadedCopyWithImpl;
@useResult
$Res call({
 ServiceRequestInfo info, ServiceRequestActivity? activity, ActivityLoadStatus activityStatus, String? activityErrorMessage, ServiceRequestProfessional? professional, FreelancerPublicProfile? freelancerProfile, ActivityLoadStatus professionalStatus, String? professionalErrorMessage, bool isRevokingEngagement
});




}
/// @nodoc
class _$ServiceRequestDetailLoadedCopyWithImpl<$Res>
    implements $ServiceRequestDetailLoadedCopyWith<$Res> {
  _$ServiceRequestDetailLoadedCopyWithImpl(this._self, this._then);

  final ServiceRequestDetailLoaded _self;
  final $Res Function(ServiceRequestDetailLoaded) _then;

/// Create a copy of ServiceRequestDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,Object? activity = freezed,Object? activityStatus = null,Object? activityErrorMessage = freezed,Object? professional = freezed,Object? freelancerProfile = freezed,Object? professionalStatus = null,Object? professionalErrorMessage = freezed,Object? isRevokingEngagement = null,}) {
  return _then(ServiceRequestDetailLoaded(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as ServiceRequestInfo,activity: freezed == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as ServiceRequestActivity?,activityStatus: null == activityStatus ? _self.activityStatus : activityStatus // ignore: cast_nullable_to_non_nullable
as ActivityLoadStatus,activityErrorMessage: freezed == activityErrorMessage ? _self.activityErrorMessage : activityErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,professional: freezed == professional ? _self.professional : professional // ignore: cast_nullable_to_non_nullable
as ServiceRequestProfessional?,freelancerProfile: freezed == freelancerProfile ? _self.freelancerProfile : freelancerProfile // ignore: cast_nullable_to_non_nullable
as FreelancerPublicProfile?,professionalStatus: null == professionalStatus ? _self.professionalStatus : professionalStatus // ignore: cast_nullable_to_non_nullable
as ActivityLoadStatus,professionalErrorMessage: freezed == professionalErrorMessage ? _self.professionalErrorMessage : professionalErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,isRevokingEngagement: null == isRevokingEngagement ? _self.isRevokingEngagement : isRevokingEngagement // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ServiceRequestDetailFailure implements ServiceRequestDetailState {
  const ServiceRequestDetailFailure({required this.message});
  

 final  String message;

/// Create a copy of ServiceRequestDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestDetailFailureCopyWith<ServiceRequestDetailFailure> get copyWith => _$ServiceRequestDetailFailureCopyWithImpl<ServiceRequestDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ServiceRequestDetailState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestDetailFailureCopyWith<$Res> implements $ServiceRequestDetailStateCopyWith<$Res> {
  factory $ServiceRequestDetailFailureCopyWith(ServiceRequestDetailFailure value, $Res Function(ServiceRequestDetailFailure) _then) = _$ServiceRequestDetailFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ServiceRequestDetailFailureCopyWithImpl<$Res>
    implements $ServiceRequestDetailFailureCopyWith<$Res> {
  _$ServiceRequestDetailFailureCopyWithImpl(this._self, this._then);

  final ServiceRequestDetailFailure _self;
  final $Res Function(ServiceRequestDetailFailure) _then;

/// Create a copy of ServiceRequestDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ServiceRequestDetailFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
