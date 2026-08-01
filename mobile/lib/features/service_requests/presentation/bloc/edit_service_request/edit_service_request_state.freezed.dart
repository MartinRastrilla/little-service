// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_service_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditServiceRequestState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditServiceRequestState()';
}


}

/// @nodoc
class $EditServiceRequestStateCopyWith<$Res>  {
$EditServiceRequestStateCopyWith(EditServiceRequestState _, $Res Function(EditServiceRequestState) __);
}


/// Adds pattern-matching-related methods to [EditServiceRequestState].
extension EditServiceRequestStatePatterns on EditServiceRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EditServiceRequestInitial value)?  initial,TResult Function( EditServiceRequestLoading value)?  loading,TResult Function( EditServiceRequestEditing value)?  editing,TResult Function( EditServiceRequestSaving value)?  saving,TResult Function( EditServiceRequestCancelling value)?  cancelling,TResult Function( EditServiceRequestSaveSuccess value)?  saveSuccess,TResult Function( EditServiceRequestCancelSuccess value)?  cancelSuccess,TResult Function( EditServiceRequestFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EditServiceRequestInitial() when initial != null:
return initial(_that);case EditServiceRequestLoading() when loading != null:
return loading(_that);case EditServiceRequestEditing() when editing != null:
return editing(_that);case EditServiceRequestSaving() when saving != null:
return saving(_that);case EditServiceRequestCancelling() when cancelling != null:
return cancelling(_that);case EditServiceRequestSaveSuccess() when saveSuccess != null:
return saveSuccess(_that);case EditServiceRequestCancelSuccess() when cancelSuccess != null:
return cancelSuccess(_that);case EditServiceRequestFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EditServiceRequestInitial value)  initial,required TResult Function( EditServiceRequestLoading value)  loading,required TResult Function( EditServiceRequestEditing value)  editing,required TResult Function( EditServiceRequestSaving value)  saving,required TResult Function( EditServiceRequestCancelling value)  cancelling,required TResult Function( EditServiceRequestSaveSuccess value)  saveSuccess,required TResult Function( EditServiceRequestCancelSuccess value)  cancelSuccess,required TResult Function( EditServiceRequestFailure value)  failure,}){
final _that = this;
switch (_that) {
case EditServiceRequestInitial():
return initial(_that);case EditServiceRequestLoading():
return loading(_that);case EditServiceRequestEditing():
return editing(_that);case EditServiceRequestSaving():
return saving(_that);case EditServiceRequestCancelling():
return cancelling(_that);case EditServiceRequestSaveSuccess():
return saveSuccess(_that);case EditServiceRequestCancelSuccess():
return cancelSuccess(_that);case EditServiceRequestFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EditServiceRequestInitial value)?  initial,TResult? Function( EditServiceRequestLoading value)?  loading,TResult? Function( EditServiceRequestEditing value)?  editing,TResult? Function( EditServiceRequestSaving value)?  saving,TResult? Function( EditServiceRequestCancelling value)?  cancelling,TResult? Function( EditServiceRequestSaveSuccess value)?  saveSuccess,TResult? Function( EditServiceRequestCancelSuccess value)?  cancelSuccess,TResult? Function( EditServiceRequestFailure value)?  failure,}){
final _that = this;
switch (_that) {
case EditServiceRequestInitial() when initial != null:
return initial(_that);case EditServiceRequestLoading() when loading != null:
return loading(_that);case EditServiceRequestEditing() when editing != null:
return editing(_that);case EditServiceRequestSaving() when saving != null:
return saving(_that);case EditServiceRequestCancelling() when cancelling != null:
return cancelling(_that);case EditServiceRequestSaveSuccess() when saveSuccess != null:
return saveSuccess(_that);case EditServiceRequestCancelSuccess() when cancelSuccess != null:
return cancelSuccess(_that);case EditServiceRequestFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ServiceRequestInfo info,  EditServiceRequestDraft draft,  EditServiceRequestDraft initialDraft,  bool isDirty,  String? fieldError)?  editing,TResult Function( ServiceRequestInfo info,  EditServiceRequestDraft draft,  EditServiceRequestDraft initialDraft)?  saving,TResult Function( ServiceRequestInfo info,  EditServiceRequestDraft draft,  EditServiceRequestDraft initialDraft)?  cancelling,TResult Function()?  saveSuccess,TResult Function()?  cancelSuccess,TResult Function( String message,  ServiceRequestInfo? info,  EditServiceRequestDraft? draft,  EditServiceRequestDraft? initialDraft)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EditServiceRequestInitial() when initial != null:
return initial();case EditServiceRequestLoading() when loading != null:
return loading();case EditServiceRequestEditing() when editing != null:
return editing(_that.info,_that.draft,_that.initialDraft,_that.isDirty,_that.fieldError);case EditServiceRequestSaving() when saving != null:
return saving(_that.info,_that.draft,_that.initialDraft);case EditServiceRequestCancelling() when cancelling != null:
return cancelling(_that.info,_that.draft,_that.initialDraft);case EditServiceRequestSaveSuccess() when saveSuccess != null:
return saveSuccess();case EditServiceRequestCancelSuccess() when cancelSuccess != null:
return cancelSuccess();case EditServiceRequestFailure() when failure != null:
return failure(_that.message,_that.info,_that.draft,_that.initialDraft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ServiceRequestInfo info,  EditServiceRequestDraft draft,  EditServiceRequestDraft initialDraft,  bool isDirty,  String? fieldError)  editing,required TResult Function( ServiceRequestInfo info,  EditServiceRequestDraft draft,  EditServiceRequestDraft initialDraft)  saving,required TResult Function( ServiceRequestInfo info,  EditServiceRequestDraft draft,  EditServiceRequestDraft initialDraft)  cancelling,required TResult Function()  saveSuccess,required TResult Function()  cancelSuccess,required TResult Function( String message,  ServiceRequestInfo? info,  EditServiceRequestDraft? draft,  EditServiceRequestDraft? initialDraft)  failure,}) {final _that = this;
switch (_that) {
case EditServiceRequestInitial():
return initial();case EditServiceRequestLoading():
return loading();case EditServiceRequestEditing():
return editing(_that.info,_that.draft,_that.initialDraft,_that.isDirty,_that.fieldError);case EditServiceRequestSaving():
return saving(_that.info,_that.draft,_that.initialDraft);case EditServiceRequestCancelling():
return cancelling(_that.info,_that.draft,_that.initialDraft);case EditServiceRequestSaveSuccess():
return saveSuccess();case EditServiceRequestCancelSuccess():
return cancelSuccess();case EditServiceRequestFailure():
return failure(_that.message,_that.info,_that.draft,_that.initialDraft);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ServiceRequestInfo info,  EditServiceRequestDraft draft,  EditServiceRequestDraft initialDraft,  bool isDirty,  String? fieldError)?  editing,TResult? Function( ServiceRequestInfo info,  EditServiceRequestDraft draft,  EditServiceRequestDraft initialDraft)?  saving,TResult? Function( ServiceRequestInfo info,  EditServiceRequestDraft draft,  EditServiceRequestDraft initialDraft)?  cancelling,TResult? Function()?  saveSuccess,TResult? Function()?  cancelSuccess,TResult? Function( String message,  ServiceRequestInfo? info,  EditServiceRequestDraft? draft,  EditServiceRequestDraft? initialDraft)?  failure,}) {final _that = this;
switch (_that) {
case EditServiceRequestInitial() when initial != null:
return initial();case EditServiceRequestLoading() when loading != null:
return loading();case EditServiceRequestEditing() when editing != null:
return editing(_that.info,_that.draft,_that.initialDraft,_that.isDirty,_that.fieldError);case EditServiceRequestSaving() when saving != null:
return saving(_that.info,_that.draft,_that.initialDraft);case EditServiceRequestCancelling() when cancelling != null:
return cancelling(_that.info,_that.draft,_that.initialDraft);case EditServiceRequestSaveSuccess() when saveSuccess != null:
return saveSuccess();case EditServiceRequestCancelSuccess() when cancelSuccess != null:
return cancelSuccess();case EditServiceRequestFailure() when failure != null:
return failure(_that.message,_that.info,_that.draft,_that.initialDraft);case _:
  return null;

}
}

}

/// @nodoc


class EditServiceRequestInitial implements EditServiceRequestState {
  const EditServiceRequestInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditServiceRequestState.initial()';
}


}




/// @nodoc


class EditServiceRequestLoading implements EditServiceRequestState {
  const EditServiceRequestLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditServiceRequestState.loading()';
}


}




/// @nodoc


class EditServiceRequestEditing implements EditServiceRequestState {
  const EditServiceRequestEditing({required this.info, required this.draft, required this.initialDraft, required this.isDirty, this.fieldError});
  

 final  ServiceRequestInfo info;
 final  EditServiceRequestDraft draft;
 final  EditServiceRequestDraft initialDraft;
 final  bool isDirty;
 final  String? fieldError;

/// Create a copy of EditServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditServiceRequestEditingCopyWith<EditServiceRequestEditing> get copyWith => _$EditServiceRequestEditingCopyWithImpl<EditServiceRequestEditing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestEditing&&(identical(other.info, info) || other.info == info)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.initialDraft, initialDraft) || other.initialDraft == initialDraft)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty)&&(identical(other.fieldError, fieldError) || other.fieldError == fieldError));
}


@override
int get hashCode => Object.hash(runtimeType,info,draft,initialDraft,isDirty,fieldError);

@override
String toString() {
  return 'EditServiceRequestState.editing(info: $info, draft: $draft, initialDraft: $initialDraft, isDirty: $isDirty, fieldError: $fieldError)';
}


}

/// @nodoc
abstract mixin class $EditServiceRequestEditingCopyWith<$Res> implements $EditServiceRequestStateCopyWith<$Res> {
  factory $EditServiceRequestEditingCopyWith(EditServiceRequestEditing value, $Res Function(EditServiceRequestEditing) _then) = _$EditServiceRequestEditingCopyWithImpl;
@useResult
$Res call({
 ServiceRequestInfo info, EditServiceRequestDraft draft, EditServiceRequestDraft initialDraft, bool isDirty, String? fieldError
});




}
/// @nodoc
class _$EditServiceRequestEditingCopyWithImpl<$Res>
    implements $EditServiceRequestEditingCopyWith<$Res> {
  _$EditServiceRequestEditingCopyWithImpl(this._self, this._then);

  final EditServiceRequestEditing _self;
  final $Res Function(EditServiceRequestEditing) _then;

/// Create a copy of EditServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,Object? draft = null,Object? initialDraft = null,Object? isDirty = null,Object? fieldError = freezed,}) {
  return _then(EditServiceRequestEditing(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as ServiceRequestInfo,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as EditServiceRequestDraft,initialDraft: null == initialDraft ? _self.initialDraft : initialDraft // ignore: cast_nullable_to_non_nullable
as EditServiceRequestDraft,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
as bool,fieldError: freezed == fieldError ? _self.fieldError : fieldError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class EditServiceRequestSaving implements EditServiceRequestState {
  const EditServiceRequestSaving({required this.info, required this.draft, required this.initialDraft});
  

 final  ServiceRequestInfo info;
 final  EditServiceRequestDraft draft;
 final  EditServiceRequestDraft initialDraft;

/// Create a copy of EditServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditServiceRequestSavingCopyWith<EditServiceRequestSaving> get copyWith => _$EditServiceRequestSavingCopyWithImpl<EditServiceRequestSaving>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestSaving&&(identical(other.info, info) || other.info == info)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.initialDraft, initialDraft) || other.initialDraft == initialDraft));
}


@override
int get hashCode => Object.hash(runtimeType,info,draft,initialDraft);

@override
String toString() {
  return 'EditServiceRequestState.saving(info: $info, draft: $draft, initialDraft: $initialDraft)';
}


}

/// @nodoc
abstract mixin class $EditServiceRequestSavingCopyWith<$Res> implements $EditServiceRequestStateCopyWith<$Res> {
  factory $EditServiceRequestSavingCopyWith(EditServiceRequestSaving value, $Res Function(EditServiceRequestSaving) _then) = _$EditServiceRequestSavingCopyWithImpl;
@useResult
$Res call({
 ServiceRequestInfo info, EditServiceRequestDraft draft, EditServiceRequestDraft initialDraft
});




}
/// @nodoc
class _$EditServiceRequestSavingCopyWithImpl<$Res>
    implements $EditServiceRequestSavingCopyWith<$Res> {
  _$EditServiceRequestSavingCopyWithImpl(this._self, this._then);

  final EditServiceRequestSaving _self;
  final $Res Function(EditServiceRequestSaving) _then;

/// Create a copy of EditServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,Object? draft = null,Object? initialDraft = null,}) {
  return _then(EditServiceRequestSaving(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as ServiceRequestInfo,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as EditServiceRequestDraft,initialDraft: null == initialDraft ? _self.initialDraft : initialDraft // ignore: cast_nullable_to_non_nullable
as EditServiceRequestDraft,
  ));
}


}

/// @nodoc


class EditServiceRequestCancelling implements EditServiceRequestState {
  const EditServiceRequestCancelling({required this.info, required this.draft, required this.initialDraft});
  

 final  ServiceRequestInfo info;
 final  EditServiceRequestDraft draft;
 final  EditServiceRequestDraft initialDraft;

/// Create a copy of EditServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditServiceRequestCancellingCopyWith<EditServiceRequestCancelling> get copyWith => _$EditServiceRequestCancellingCopyWithImpl<EditServiceRequestCancelling>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestCancelling&&(identical(other.info, info) || other.info == info)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.initialDraft, initialDraft) || other.initialDraft == initialDraft));
}


@override
int get hashCode => Object.hash(runtimeType,info,draft,initialDraft);

@override
String toString() {
  return 'EditServiceRequestState.cancelling(info: $info, draft: $draft, initialDraft: $initialDraft)';
}


}

/// @nodoc
abstract mixin class $EditServiceRequestCancellingCopyWith<$Res> implements $EditServiceRequestStateCopyWith<$Res> {
  factory $EditServiceRequestCancellingCopyWith(EditServiceRequestCancelling value, $Res Function(EditServiceRequestCancelling) _then) = _$EditServiceRequestCancellingCopyWithImpl;
@useResult
$Res call({
 ServiceRequestInfo info, EditServiceRequestDraft draft, EditServiceRequestDraft initialDraft
});




}
/// @nodoc
class _$EditServiceRequestCancellingCopyWithImpl<$Res>
    implements $EditServiceRequestCancellingCopyWith<$Res> {
  _$EditServiceRequestCancellingCopyWithImpl(this._self, this._then);

  final EditServiceRequestCancelling _self;
  final $Res Function(EditServiceRequestCancelling) _then;

/// Create a copy of EditServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,Object? draft = null,Object? initialDraft = null,}) {
  return _then(EditServiceRequestCancelling(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as ServiceRequestInfo,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as EditServiceRequestDraft,initialDraft: null == initialDraft ? _self.initialDraft : initialDraft // ignore: cast_nullable_to_non_nullable
as EditServiceRequestDraft,
  ));
}


}

/// @nodoc


class EditServiceRequestSaveSuccess implements EditServiceRequestState {
  const EditServiceRequestSaveSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestSaveSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditServiceRequestState.saveSuccess()';
}


}




/// @nodoc


class EditServiceRequestCancelSuccess implements EditServiceRequestState {
  const EditServiceRequestCancelSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestCancelSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditServiceRequestState.cancelSuccess()';
}


}




/// @nodoc


class EditServiceRequestFailure implements EditServiceRequestState {
  const EditServiceRequestFailure({required this.message, this.info, this.draft, this.initialDraft});
  

 final  String message;
 final  ServiceRequestInfo? info;
 final  EditServiceRequestDraft? draft;
 final  EditServiceRequestDraft? initialDraft;

/// Create a copy of EditServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditServiceRequestFailureCopyWith<EditServiceRequestFailure> get copyWith => _$EditServiceRequestFailureCopyWithImpl<EditServiceRequestFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestFailure&&(identical(other.message, message) || other.message == message)&&(identical(other.info, info) || other.info == info)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.initialDraft, initialDraft) || other.initialDraft == initialDraft));
}


@override
int get hashCode => Object.hash(runtimeType,message,info,draft,initialDraft);

@override
String toString() {
  return 'EditServiceRequestState.failure(message: $message, info: $info, draft: $draft, initialDraft: $initialDraft)';
}


}

/// @nodoc
abstract mixin class $EditServiceRequestFailureCopyWith<$Res> implements $EditServiceRequestStateCopyWith<$Res> {
  factory $EditServiceRequestFailureCopyWith(EditServiceRequestFailure value, $Res Function(EditServiceRequestFailure) _then) = _$EditServiceRequestFailureCopyWithImpl;
@useResult
$Res call({
 String message, ServiceRequestInfo? info, EditServiceRequestDraft? draft, EditServiceRequestDraft? initialDraft
});




}
/// @nodoc
class _$EditServiceRequestFailureCopyWithImpl<$Res>
    implements $EditServiceRequestFailureCopyWith<$Res> {
  _$EditServiceRequestFailureCopyWithImpl(this._self, this._then);

  final EditServiceRequestFailure _self;
  final $Res Function(EditServiceRequestFailure) _then;

/// Create a copy of EditServiceRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? info = freezed,Object? draft = freezed,Object? initialDraft = freezed,}) {
  return _then(EditServiceRequestFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as ServiceRequestInfo?,draft: freezed == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as EditServiceRequestDraft?,initialDraft: freezed == initialDraft ? _self.initialDraft : initialDraft // ignore: cast_nullable_to_non_nullable
as EditServiceRequestDraft?,
  ));
}


}

// dart format on
