// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractFormState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractFormState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractFormState()';
}


}

/// @nodoc
class $ContractFormStateCopyWith<$Res>  {
$ContractFormStateCopyWith(ContractFormState _, $Res Function(ContractFormState) __);
}


/// Adds pattern-matching-related methods to [ContractFormState].
extension ContractFormStatePatterns on ContractFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ContractFormInitial value)?  initial,TResult Function( ContractFormLoading value)?  loading,TResult Function( ContractFormReady value)?  ready,TResult Function( ContractFormFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ContractFormInitial() when initial != null:
return initial(_that);case ContractFormLoading() when loading != null:
return loading(_that);case ContractFormReady() when ready != null:
return ready(_that);case ContractFormFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ContractFormInitial value)  initial,required TResult Function( ContractFormLoading value)  loading,required TResult Function( ContractFormReady value)  ready,required TResult Function( ContractFormFailure value)  failure,}){
final _that = this;
switch (_that) {
case ContractFormInitial():
return initial(_that);case ContractFormLoading():
return loading(_that);case ContractFormReady():
return ready(_that);case ContractFormFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ContractFormInitial value)?  initial,TResult? Function( ContractFormLoading value)?  loading,TResult? Function( ContractFormReady value)?  ready,TResult? Function( ContractFormFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ContractFormInitial() when initial != null:
return initial(_that);case ContractFormLoading() when loading != null:
return loading(_that);case ContractFormReady() when ready != null:
return ready(_that);case ContractFormFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ServiceRequestContract? contract,  double? suggestedAmount,  bool canCreate,  bool canEdit,  bool isSaving,  String? errorMessage)?  ready,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ContractFormInitial() when initial != null:
return initial();case ContractFormLoading() when loading != null:
return loading();case ContractFormReady() when ready != null:
return ready(_that.contract,_that.suggestedAmount,_that.canCreate,_that.canEdit,_that.isSaving,_that.errorMessage);case ContractFormFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ServiceRequestContract? contract,  double? suggestedAmount,  bool canCreate,  bool canEdit,  bool isSaving,  String? errorMessage)  ready,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ContractFormInitial():
return initial();case ContractFormLoading():
return loading();case ContractFormReady():
return ready(_that.contract,_that.suggestedAmount,_that.canCreate,_that.canEdit,_that.isSaving,_that.errorMessage);case ContractFormFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ServiceRequestContract? contract,  double? suggestedAmount,  bool canCreate,  bool canEdit,  bool isSaving,  String? errorMessage)?  ready,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ContractFormInitial() when initial != null:
return initial();case ContractFormLoading() when loading != null:
return loading();case ContractFormReady() when ready != null:
return ready(_that.contract,_that.suggestedAmount,_that.canCreate,_that.canEdit,_that.isSaving,_that.errorMessage);case ContractFormFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ContractFormInitial implements ContractFormState {
  const ContractFormInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractFormInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractFormState.initial()';
}


}




/// @nodoc


class ContractFormLoading implements ContractFormState {
  const ContractFormLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractFormLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractFormState.loading()';
}


}




/// @nodoc


class ContractFormReady implements ContractFormState {
  const ContractFormReady({this.contract, this.suggestedAmount, required this.canCreate, required this.canEdit, this.isSaving = false, this.errorMessage});
  

 final  ServiceRequestContract? contract;
 final  double? suggestedAmount;
 final  bool canCreate;
 final  bool canEdit;
@JsonKey() final  bool isSaving;
 final  String? errorMessage;

/// Create a copy of ContractFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractFormReadyCopyWith<ContractFormReady> get copyWith => _$ContractFormReadyCopyWithImpl<ContractFormReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractFormReady&&(identical(other.contract, contract) || other.contract == contract)&&(identical(other.suggestedAmount, suggestedAmount) || other.suggestedAmount == suggestedAmount)&&(identical(other.canCreate, canCreate) || other.canCreate == canCreate)&&(identical(other.canEdit, canEdit) || other.canEdit == canEdit)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,contract,suggestedAmount,canCreate,canEdit,isSaving,errorMessage);

@override
String toString() {
  return 'ContractFormState.ready(contract: $contract, suggestedAmount: $suggestedAmount, canCreate: $canCreate, canEdit: $canEdit, isSaving: $isSaving, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ContractFormReadyCopyWith<$Res> implements $ContractFormStateCopyWith<$Res> {
  factory $ContractFormReadyCopyWith(ContractFormReady value, $Res Function(ContractFormReady) _then) = _$ContractFormReadyCopyWithImpl;
@useResult
$Res call({
 ServiceRequestContract? contract, double? suggestedAmount, bool canCreate, bool canEdit, bool isSaving, String? errorMessage
});




}
/// @nodoc
class _$ContractFormReadyCopyWithImpl<$Res>
    implements $ContractFormReadyCopyWith<$Res> {
  _$ContractFormReadyCopyWithImpl(this._self, this._then);

  final ContractFormReady _self;
  final $Res Function(ContractFormReady) _then;

/// Create a copy of ContractFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? contract = freezed,Object? suggestedAmount = freezed,Object? canCreate = null,Object? canEdit = null,Object? isSaving = null,Object? errorMessage = freezed,}) {
  return _then(ContractFormReady(
contract: freezed == contract ? _self.contract : contract // ignore: cast_nullable_to_non_nullable
as ServiceRequestContract?,suggestedAmount: freezed == suggestedAmount ? _self.suggestedAmount : suggestedAmount // ignore: cast_nullable_to_non_nullable
as double?,canCreate: null == canCreate ? _self.canCreate : canCreate // ignore: cast_nullable_to_non_nullable
as bool,canEdit: null == canEdit ? _self.canEdit : canEdit // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ContractFormFailure implements ContractFormState {
  const ContractFormFailure({required this.message});
  

 final  String message;

/// Create a copy of ContractFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractFormFailureCopyWith<ContractFormFailure> get copyWith => _$ContractFormFailureCopyWithImpl<ContractFormFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractFormFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ContractFormState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ContractFormFailureCopyWith<$Res> implements $ContractFormStateCopyWith<$Res> {
  factory $ContractFormFailureCopyWith(ContractFormFailure value, $Res Function(ContractFormFailure) _then) = _$ContractFormFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ContractFormFailureCopyWithImpl<$Res>
    implements $ContractFormFailureCopyWith<$Res> {
  _$ContractFormFailureCopyWithImpl(this._self, this._then);

  final ContractFormFailure _self;
  final $Res Function(ContractFormFailure) _then;

/// Create a copy of ContractFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ContractFormFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
