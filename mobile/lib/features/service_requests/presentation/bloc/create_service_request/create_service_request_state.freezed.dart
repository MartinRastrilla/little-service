// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_service_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateServiceRequestState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateServiceRequestState()';
}


}

/// @nodoc
class $CreateServiceRequestStateCopyWith<$Res>  {
$CreateServiceRequestStateCopyWith(CreateServiceRequestState _, $Res Function(CreateServiceRequestState) __);
}


/// Adds pattern-matching-related methods to [CreateServiceRequestState].
extension CreateServiceRequestStatePatterns on CreateServiceRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateServiceRequestInitial value)?  initial,TResult Function( CreateServiceRequestEditing value)?  editing,TResult Function( CreateServiceRequestSubmitting value)?  submitting,TResult Function( CreateServiceRequestSuccess value)?  success,TResult Function( CreateServiceRequestFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateServiceRequestInitial() when initial != null:
return initial(_that);case CreateServiceRequestEditing() when editing != null:
return editing(_that);case CreateServiceRequestSubmitting() when submitting != null:
return submitting(_that);case CreateServiceRequestSuccess() when success != null:
return success(_that);case CreateServiceRequestFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateServiceRequestInitial value)  initial,required TResult Function( CreateServiceRequestEditing value)  editing,required TResult Function( CreateServiceRequestSubmitting value)  submitting,required TResult Function( CreateServiceRequestSuccess value)  success,required TResult Function( CreateServiceRequestFailure value)  failure,}){
final _that = this;
switch (_that) {
case CreateServiceRequestInitial():
return initial(_that);case CreateServiceRequestEditing():
return editing(_that);case CreateServiceRequestSubmitting():
return submitting(_that);case CreateServiceRequestSuccess():
return success(_that);case CreateServiceRequestFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateServiceRequestInitial value)?  initial,TResult? Function( CreateServiceRequestEditing value)?  editing,TResult? Function( CreateServiceRequestSubmitting value)?  submitting,TResult? Function( CreateServiceRequestSuccess value)?  success,TResult? Function( CreateServiceRequestFailure value)?  failure,}){
final _that = this;
switch (_that) {
case CreateServiceRequestInitial() when initial != null:
return initial(_that);case CreateServiceRequestEditing() when editing != null:
return editing(_that);case CreateServiceRequestSubmitting() when submitting != null:
return submitting(_that);case CreateServiceRequestSuccess() when success != null:
return success(_that);case CreateServiceRequestFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int currentStep,  CreateServiceRequestDraft draft,  String? stepError)?  editing,TResult Function( CreateServiceRequestDraft draft)?  submitting,TResult Function( ServiceRequestDetail detail)?  success,TResult Function( String message,  int currentStep,  CreateServiceRequestDraft draft)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateServiceRequestInitial() when initial != null:
return initial();case CreateServiceRequestEditing() when editing != null:
return editing(_that.currentStep,_that.draft,_that.stepError);case CreateServiceRequestSubmitting() when submitting != null:
return submitting(_that.draft);case CreateServiceRequestSuccess() when success != null:
return success(_that.detail);case CreateServiceRequestFailure() when failure != null:
return failure(_that.message,_that.currentStep,_that.draft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int currentStep,  CreateServiceRequestDraft draft,  String? stepError)  editing,required TResult Function( CreateServiceRequestDraft draft)  submitting,required TResult Function( ServiceRequestDetail detail)  success,required TResult Function( String message,  int currentStep,  CreateServiceRequestDraft draft)  failure,}) {final _that = this;
switch (_that) {
case CreateServiceRequestInitial():
return initial();case CreateServiceRequestEditing():
return editing(_that.currentStep,_that.draft,_that.stepError);case CreateServiceRequestSubmitting():
return submitting(_that.draft);case CreateServiceRequestSuccess():
return success(_that.detail);case CreateServiceRequestFailure():
return failure(_that.message,_that.currentStep,_that.draft);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int currentStep,  CreateServiceRequestDraft draft,  String? stepError)?  editing,TResult? Function( CreateServiceRequestDraft draft)?  submitting,TResult? Function( ServiceRequestDetail detail)?  success,TResult? Function( String message,  int currentStep,  CreateServiceRequestDraft draft)?  failure,}) {final _that = this;
switch (_that) {
case CreateServiceRequestInitial() when initial != null:
return initial();case CreateServiceRequestEditing() when editing != null:
return editing(_that.currentStep,_that.draft,_that.stepError);case CreateServiceRequestSubmitting() when submitting != null:
return submitting(_that.draft);case CreateServiceRequestSuccess() when success != null:
return success(_that.detail);case CreateServiceRequestFailure() when failure != null:
return failure(_that.message,_that.currentStep,_that.draft);case _:
  return null;

}
}

}

/// @nodoc


class CreateServiceRequestInitial implements CreateServiceRequestState {
  const CreateServiceRequestInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateServiceRequestState.initial()';
}


}




/// @nodoc


class CreateServiceRequestEditing implements CreateServiceRequestState {
  const CreateServiceRequestEditing({required this.currentStep, required this.draft, this.stepError});
  

 final  int currentStep;
 final  CreateServiceRequestDraft draft;
 final  String? stepError;

/// Create a copy of CreateServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateServiceRequestEditingCopyWith<CreateServiceRequestEditing> get copyWith => _$CreateServiceRequestEditingCopyWithImpl<CreateServiceRequestEditing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestEditing&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.stepError, stepError) || other.stepError == stepError));
}


@override
int get hashCode => Object.hash(runtimeType,currentStep,draft,stepError);

@override
String toString() {
  return 'CreateServiceRequestState.editing(currentStep: $currentStep, draft: $draft, stepError: $stepError)';
}


}

/// @nodoc
abstract mixin class $CreateServiceRequestEditingCopyWith<$Res> implements $CreateServiceRequestStateCopyWith<$Res> {
  factory $CreateServiceRequestEditingCopyWith(CreateServiceRequestEditing value, $Res Function(CreateServiceRequestEditing) _then) = _$CreateServiceRequestEditingCopyWithImpl;
@useResult
$Res call({
 int currentStep, CreateServiceRequestDraft draft, String? stepError
});




}
/// @nodoc
class _$CreateServiceRequestEditingCopyWithImpl<$Res>
    implements $CreateServiceRequestEditingCopyWith<$Res> {
  _$CreateServiceRequestEditingCopyWithImpl(this._self, this._then);

  final CreateServiceRequestEditing _self;
  final $Res Function(CreateServiceRequestEditing) _then;

/// Create a copy of CreateServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentStep = null,Object? draft = null,Object? stepError = freezed,}) {
  return _then(CreateServiceRequestEditing(
currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as CreateServiceRequestDraft,stepError: freezed == stepError ? _self.stepError : stepError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class CreateServiceRequestSubmitting implements CreateServiceRequestState {
  const CreateServiceRequestSubmitting({required this.draft});
  

 final  CreateServiceRequestDraft draft;

/// Create a copy of CreateServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateServiceRequestSubmittingCopyWith<CreateServiceRequestSubmitting> get copyWith => _$CreateServiceRequestSubmittingCopyWithImpl<CreateServiceRequestSubmitting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestSubmitting&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'CreateServiceRequestState.submitting(draft: $draft)';
}


}

/// @nodoc
abstract mixin class $CreateServiceRequestSubmittingCopyWith<$Res> implements $CreateServiceRequestStateCopyWith<$Res> {
  factory $CreateServiceRequestSubmittingCopyWith(CreateServiceRequestSubmitting value, $Res Function(CreateServiceRequestSubmitting) _then) = _$CreateServiceRequestSubmittingCopyWithImpl;
@useResult
$Res call({
 CreateServiceRequestDraft draft
});




}
/// @nodoc
class _$CreateServiceRequestSubmittingCopyWithImpl<$Res>
    implements $CreateServiceRequestSubmittingCopyWith<$Res> {
  _$CreateServiceRequestSubmittingCopyWithImpl(this._self, this._then);

  final CreateServiceRequestSubmitting _self;
  final $Res Function(CreateServiceRequestSubmitting) _then;

/// Create a copy of CreateServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(CreateServiceRequestSubmitting(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as CreateServiceRequestDraft,
  ));
}


}

/// @nodoc


class CreateServiceRequestSuccess implements CreateServiceRequestState {
  const CreateServiceRequestSuccess({required this.detail});
  

 final  ServiceRequestDetail detail;

/// Create a copy of CreateServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateServiceRequestSuccessCopyWith<CreateServiceRequestSuccess> get copyWith => _$CreateServiceRequestSuccessCopyWithImpl<CreateServiceRequestSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestSuccess&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,detail);

@override
String toString() {
  return 'CreateServiceRequestState.success(detail: $detail)';
}


}

/// @nodoc
abstract mixin class $CreateServiceRequestSuccessCopyWith<$Res> implements $CreateServiceRequestStateCopyWith<$Res> {
  factory $CreateServiceRequestSuccessCopyWith(CreateServiceRequestSuccess value, $Res Function(CreateServiceRequestSuccess) _then) = _$CreateServiceRequestSuccessCopyWithImpl;
@useResult
$Res call({
 ServiceRequestDetail detail
});




}
/// @nodoc
class _$CreateServiceRequestSuccessCopyWithImpl<$Res>
    implements $CreateServiceRequestSuccessCopyWith<$Res> {
  _$CreateServiceRequestSuccessCopyWithImpl(this._self, this._then);

  final CreateServiceRequestSuccess _self;
  final $Res Function(CreateServiceRequestSuccess) _then;

/// Create a copy of CreateServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(CreateServiceRequestSuccess(
detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as ServiceRequestDetail,
  ));
}


}

/// @nodoc


class CreateServiceRequestFailure implements CreateServiceRequestState {
  const CreateServiceRequestFailure({required this.message, required this.currentStep, required this.draft});
  

 final  String message;
 final  int currentStep;
 final  CreateServiceRequestDraft draft;

/// Create a copy of CreateServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateServiceRequestFailureCopyWith<CreateServiceRequestFailure> get copyWith => _$CreateServiceRequestFailureCopyWithImpl<CreateServiceRequestFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.currentStep, currentStep) || other.currentStep == currentStep)&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,message,currentStep,draft);

@override
String toString() {
  return 'CreateServiceRequestState.failure(message: $message, currentStep: $currentStep, draft: $draft)';
}


}

/// @nodoc
abstract mixin class $CreateServiceRequestFailureCopyWith<$Res> implements $CreateServiceRequestStateCopyWith<$Res> {
  factory $CreateServiceRequestFailureCopyWith(CreateServiceRequestFailure value, $Res Function(CreateServiceRequestFailure) _then) = _$CreateServiceRequestFailureCopyWithImpl;
@useResult
$Res call({
 String message, int currentStep, CreateServiceRequestDraft draft
});




}
/// @nodoc
class _$CreateServiceRequestFailureCopyWithImpl<$Res>
    implements $CreateServiceRequestFailureCopyWith<$Res> {
  _$CreateServiceRequestFailureCopyWithImpl(this._self, this._then);

  final CreateServiceRequestFailure _self;
  final $Res Function(CreateServiceRequestFailure) _then;

/// Create a copy of CreateServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? currentStep = null,Object? draft = null,}) {
  return _then(CreateServiceRequestFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,currentStep: null == currentStep ? _self.currentStep : currentStep // ignore: cast_nullable_to_non_nullable
as int,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as CreateServiceRequestDraft,
  ));
}


}

// dart format on
