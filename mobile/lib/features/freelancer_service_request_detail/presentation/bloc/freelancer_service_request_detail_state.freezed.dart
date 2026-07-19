// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelancer_service_request_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FreelancerServiceRequestDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerServiceRequestDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerServiceRequestDetailState()';
}


}

/// @nodoc
class $FreelancerServiceRequestDetailStateCopyWith<$Res>  {
$FreelancerServiceRequestDetailStateCopyWith(FreelancerServiceRequestDetailState _, $Res Function(FreelancerServiceRequestDetailState) __);
}


/// Adds pattern-matching-related methods to [FreelancerServiceRequestDetailState].
extension FreelancerServiceRequestDetailStatePatterns on FreelancerServiceRequestDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FreelancerServiceRequestDetailInitial value)?  initial,TResult Function( FreelancerServiceRequestDetailLoading value)?  loading,TResult Function( FreelancerServiceRequestDetailLoaded value)?  loaded,TResult Function( FreelancerServiceRequestDetailApplying value)?  applying,TResult Function( FreelancerServiceRequestDetailApplySuccess value)?  applySuccess,TResult Function( FreelancerServiceRequestDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FreelancerServiceRequestDetailInitial() when initial != null:
return initial(_that);case FreelancerServiceRequestDetailLoading() when loading != null:
return loading(_that);case FreelancerServiceRequestDetailLoaded() when loaded != null:
return loaded(_that);case FreelancerServiceRequestDetailApplying() when applying != null:
return applying(_that);case FreelancerServiceRequestDetailApplySuccess() when applySuccess != null:
return applySuccess(_that);case FreelancerServiceRequestDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FreelancerServiceRequestDetailInitial value)  initial,required TResult Function( FreelancerServiceRequestDetailLoading value)  loading,required TResult Function( FreelancerServiceRequestDetailLoaded value)  loaded,required TResult Function( FreelancerServiceRequestDetailApplying value)  applying,required TResult Function( FreelancerServiceRequestDetailApplySuccess value)  applySuccess,required TResult Function( FreelancerServiceRequestDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case FreelancerServiceRequestDetailInitial():
return initial(_that);case FreelancerServiceRequestDetailLoading():
return loading(_that);case FreelancerServiceRequestDetailLoaded():
return loaded(_that);case FreelancerServiceRequestDetailApplying():
return applying(_that);case FreelancerServiceRequestDetailApplySuccess():
return applySuccess(_that);case FreelancerServiceRequestDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FreelancerServiceRequestDetailInitial value)?  initial,TResult? Function( FreelancerServiceRequestDetailLoading value)?  loading,TResult? Function( FreelancerServiceRequestDetailLoaded value)?  loaded,TResult? Function( FreelancerServiceRequestDetailApplying value)?  applying,TResult? Function( FreelancerServiceRequestDetailApplySuccess value)?  applySuccess,TResult? Function( FreelancerServiceRequestDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case FreelancerServiceRequestDetailInitial() when initial != null:
return initial(_that);case FreelancerServiceRequestDetailLoading() when loading != null:
return loading(_that);case FreelancerServiceRequestDetailLoaded() when loaded != null:
return loaded(_that);case FreelancerServiceRequestDetailApplying() when applying != null:
return applying(_that);case FreelancerServiceRequestDetailApplySuccess() when applySuccess != null:
return applySuccess(_that);case FreelancerServiceRequestDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( OpenServiceRequestDetail detail)?  loaded,TResult Function( OpenServiceRequestDetail detail)?  applying,TResult Function()?  applySuccess,TResult Function( String message,  OpenServiceRequestDetail? detail)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FreelancerServiceRequestDetailInitial() when initial != null:
return initial();case FreelancerServiceRequestDetailLoading() when loading != null:
return loading();case FreelancerServiceRequestDetailLoaded() when loaded != null:
return loaded(_that.detail);case FreelancerServiceRequestDetailApplying() when applying != null:
return applying(_that.detail);case FreelancerServiceRequestDetailApplySuccess() when applySuccess != null:
return applySuccess();case FreelancerServiceRequestDetailFailure() when failure != null:
return failure(_that.message,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( OpenServiceRequestDetail detail)  loaded,required TResult Function( OpenServiceRequestDetail detail)  applying,required TResult Function()  applySuccess,required TResult Function( String message,  OpenServiceRequestDetail? detail)  failure,}) {final _that = this;
switch (_that) {
case FreelancerServiceRequestDetailInitial():
return initial();case FreelancerServiceRequestDetailLoading():
return loading();case FreelancerServiceRequestDetailLoaded():
return loaded(_that.detail);case FreelancerServiceRequestDetailApplying():
return applying(_that.detail);case FreelancerServiceRequestDetailApplySuccess():
return applySuccess();case FreelancerServiceRequestDetailFailure():
return failure(_that.message,_that.detail);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( OpenServiceRequestDetail detail)?  loaded,TResult? Function( OpenServiceRequestDetail detail)?  applying,TResult? Function()?  applySuccess,TResult? Function( String message,  OpenServiceRequestDetail? detail)?  failure,}) {final _that = this;
switch (_that) {
case FreelancerServiceRequestDetailInitial() when initial != null:
return initial();case FreelancerServiceRequestDetailLoading() when loading != null:
return loading();case FreelancerServiceRequestDetailLoaded() when loaded != null:
return loaded(_that.detail);case FreelancerServiceRequestDetailApplying() when applying != null:
return applying(_that.detail);case FreelancerServiceRequestDetailApplySuccess() when applySuccess != null:
return applySuccess();case FreelancerServiceRequestDetailFailure() when failure != null:
return failure(_that.message,_that.detail);case _:
  return null;

}
}

}

/// @nodoc


class FreelancerServiceRequestDetailInitial implements FreelancerServiceRequestDetailState {
  const FreelancerServiceRequestDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerServiceRequestDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerServiceRequestDetailState.initial()';
}


}




/// @nodoc


class FreelancerServiceRequestDetailLoading implements FreelancerServiceRequestDetailState {
  const FreelancerServiceRequestDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerServiceRequestDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerServiceRequestDetailState.loading()';
}


}




/// @nodoc


class FreelancerServiceRequestDetailLoaded implements FreelancerServiceRequestDetailState {
  const FreelancerServiceRequestDetailLoaded({required this.detail});
  

 final  OpenServiceRequestDetail detail;

/// Create a copy of FreelancerServiceRequestDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerServiceRequestDetailLoadedCopyWith<FreelancerServiceRequestDetailLoaded> get copyWith => _$FreelancerServiceRequestDetailLoadedCopyWithImpl<FreelancerServiceRequestDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerServiceRequestDetailLoaded&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,detail);

@override
String toString() {
  return 'FreelancerServiceRequestDetailState.loaded(detail: $detail)';
}


}

/// @nodoc
abstract mixin class $FreelancerServiceRequestDetailLoadedCopyWith<$Res> implements $FreelancerServiceRequestDetailStateCopyWith<$Res> {
  factory $FreelancerServiceRequestDetailLoadedCopyWith(FreelancerServiceRequestDetailLoaded value, $Res Function(FreelancerServiceRequestDetailLoaded) _then) = _$FreelancerServiceRequestDetailLoadedCopyWithImpl;
@useResult
$Res call({
 OpenServiceRequestDetail detail
});




}
/// @nodoc
class _$FreelancerServiceRequestDetailLoadedCopyWithImpl<$Res>
    implements $FreelancerServiceRequestDetailLoadedCopyWith<$Res> {
  _$FreelancerServiceRequestDetailLoadedCopyWithImpl(this._self, this._then);

  final FreelancerServiceRequestDetailLoaded _self;
  final $Res Function(FreelancerServiceRequestDetailLoaded) _then;

/// Create a copy of FreelancerServiceRequestDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(FreelancerServiceRequestDetailLoaded(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as OpenServiceRequestDetail,
  ));
}


}

/// @nodoc


class FreelancerServiceRequestDetailApplying implements FreelancerServiceRequestDetailState {
  const FreelancerServiceRequestDetailApplying({required this.detail});
  

 final  OpenServiceRequestDetail detail;

/// Create a copy of FreelancerServiceRequestDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerServiceRequestDetailApplyingCopyWith<FreelancerServiceRequestDetailApplying> get copyWith => _$FreelancerServiceRequestDetailApplyingCopyWithImpl<FreelancerServiceRequestDetailApplying>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerServiceRequestDetailApplying&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,detail);

@override
String toString() {
  return 'FreelancerServiceRequestDetailState.applying(detail: $detail)';
}


}

/// @nodoc
abstract mixin class $FreelancerServiceRequestDetailApplyingCopyWith<$Res> implements $FreelancerServiceRequestDetailStateCopyWith<$Res> {
  factory $FreelancerServiceRequestDetailApplyingCopyWith(FreelancerServiceRequestDetailApplying value, $Res Function(FreelancerServiceRequestDetailApplying) _then) = _$FreelancerServiceRequestDetailApplyingCopyWithImpl;
@useResult
$Res call({
 OpenServiceRequestDetail detail
});




}
/// @nodoc
class _$FreelancerServiceRequestDetailApplyingCopyWithImpl<$Res>
    implements $FreelancerServiceRequestDetailApplyingCopyWith<$Res> {
  _$FreelancerServiceRequestDetailApplyingCopyWithImpl(this._self, this._then);

  final FreelancerServiceRequestDetailApplying _self;
  final $Res Function(FreelancerServiceRequestDetailApplying) _then;

/// Create a copy of FreelancerServiceRequestDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(FreelancerServiceRequestDetailApplying(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as OpenServiceRequestDetail,
  ));
}


}

/// @nodoc


class FreelancerServiceRequestDetailApplySuccess implements FreelancerServiceRequestDetailState {
  const FreelancerServiceRequestDetailApplySuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerServiceRequestDetailApplySuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerServiceRequestDetailState.applySuccess()';
}


}




/// @nodoc


class FreelancerServiceRequestDetailFailure implements FreelancerServiceRequestDetailState {
  const FreelancerServiceRequestDetailFailure({required this.message, this.detail});
  

 final  String message;
 final  OpenServiceRequestDetail? detail;

/// Create a copy of FreelancerServiceRequestDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerServiceRequestDetailFailureCopyWith<FreelancerServiceRequestDetailFailure> get copyWith => _$FreelancerServiceRequestDetailFailureCopyWithImpl<FreelancerServiceRequestDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerServiceRequestDetailFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,message,detail);

@override
String toString() {
  return 'FreelancerServiceRequestDetailState.failure(message: $message, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $FreelancerServiceRequestDetailFailureCopyWith<$Res> implements $FreelancerServiceRequestDetailStateCopyWith<$Res> {
  factory $FreelancerServiceRequestDetailFailureCopyWith(FreelancerServiceRequestDetailFailure value, $Res Function(FreelancerServiceRequestDetailFailure) _then) = _$FreelancerServiceRequestDetailFailureCopyWithImpl;
@useResult
$Res call({
 String message, OpenServiceRequestDetail? detail
});




}
/// @nodoc
class _$FreelancerServiceRequestDetailFailureCopyWithImpl<$Res>
    implements $FreelancerServiceRequestDetailFailureCopyWith<$Res> {
  _$FreelancerServiceRequestDetailFailureCopyWithImpl(this._self, this._then);

  final FreelancerServiceRequestDetailFailure _self;
  final $Res Function(FreelancerServiceRequestDetailFailure) _then;

/// Create a copy of FreelancerServiceRequestDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? detail = freezed,}) {
  return _then(FreelancerServiceRequestDetailFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as OpenServiceRequestDetail?,
  ));
}


}

// dart format on
