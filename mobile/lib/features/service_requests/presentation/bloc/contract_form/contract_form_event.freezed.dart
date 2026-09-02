// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract_form_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContractFormEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractFormEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractFormEvent()';
}


}

/// @nodoc
class $ContractFormEventCopyWith<$Res>  {
$ContractFormEventCopyWith(ContractFormEvent _, $Res Function(ContractFormEvent) __);
}


/// Adds pattern-matching-related methods to [ContractFormEvent].
extension ContractFormEventPatterns on ContractFormEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ContractFormStarted value)?  started,TResult Function( ContractFormSaveRequested value)?  saveRequested,TResult Function( ContractFormSignRequested value)?  signRequested,TResult Function( ContractFormCancelRequested value)?  cancelRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ContractFormStarted() when started != null:
return started(_that);case ContractFormSaveRequested() when saveRequested != null:
return saveRequested(_that);case ContractFormSignRequested() when signRequested != null:
return signRequested(_that);case ContractFormCancelRequested() when cancelRequested != null:
return cancelRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ContractFormStarted value)  started,required TResult Function( ContractFormSaveRequested value)  saveRequested,required TResult Function( ContractFormSignRequested value)  signRequested,required TResult Function( ContractFormCancelRequested value)  cancelRequested,}){
final _that = this;
switch (_that) {
case ContractFormStarted():
return started(_that);case ContractFormSaveRequested():
return saveRequested(_that);case ContractFormSignRequested():
return signRequested(_that);case ContractFormCancelRequested():
return cancelRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ContractFormStarted value)?  started,TResult? Function( ContractFormSaveRequested value)?  saveRequested,TResult? Function( ContractFormSignRequested value)?  signRequested,TResult? Function( ContractFormCancelRequested value)?  cancelRequested,}){
final _that = this;
switch (_that) {
case ContractFormStarted() when started != null:
return started(_that);case ContractFormSaveRequested() when saveRequested != null:
return saveRequested(_that);case ContractFormSignRequested() when signRequested != null:
return signRequested(_that);case ContractFormCancelRequested() when cancelRequested != null:
return cancelRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String serviceRequestId,  double? suggestedAmount,  bool allowCreate)?  started,TResult Function( String terms,  DateTime startDate,  DateTime endDate,  double amount)?  saveRequested,TResult Function()?  signRequested,TResult Function()?  cancelRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ContractFormStarted() when started != null:
return started(_that.serviceRequestId,_that.suggestedAmount,_that.allowCreate);case ContractFormSaveRequested() when saveRequested != null:
return saveRequested(_that.terms,_that.startDate,_that.endDate,_that.amount);case ContractFormSignRequested() when signRequested != null:
return signRequested();case ContractFormCancelRequested() when cancelRequested != null:
return cancelRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String serviceRequestId,  double? suggestedAmount,  bool allowCreate)  started,required TResult Function( String terms,  DateTime startDate,  DateTime endDate,  double amount)  saveRequested,required TResult Function()  signRequested,required TResult Function()  cancelRequested,}) {final _that = this;
switch (_that) {
case ContractFormStarted():
return started(_that.serviceRequestId,_that.suggestedAmount,_that.allowCreate);case ContractFormSaveRequested():
return saveRequested(_that.terms,_that.startDate,_that.endDate,_that.amount);case ContractFormSignRequested():
return signRequested();case ContractFormCancelRequested():
return cancelRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String serviceRequestId,  double? suggestedAmount,  bool allowCreate)?  started,TResult? Function( String terms,  DateTime startDate,  DateTime endDate,  double amount)?  saveRequested,TResult? Function()?  signRequested,TResult? Function()?  cancelRequested,}) {final _that = this;
switch (_that) {
case ContractFormStarted() when started != null:
return started(_that.serviceRequestId,_that.suggestedAmount,_that.allowCreate);case ContractFormSaveRequested() when saveRequested != null:
return saveRequested(_that.terms,_that.startDate,_that.endDate,_that.amount);case ContractFormSignRequested() when signRequested != null:
return signRequested();case ContractFormCancelRequested() when cancelRequested != null:
return cancelRequested();case _:
  return null;

}
}

}

/// @nodoc


class ContractFormStarted implements ContractFormEvent {
  const ContractFormStarted({required this.serviceRequestId, this.suggestedAmount, this.allowCreate = false});
  

 final  String serviceRequestId;
 final  double? suggestedAmount;
@JsonKey() final  bool allowCreate;

/// Create a copy of ContractFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractFormStartedCopyWith<ContractFormStarted> get copyWith => _$ContractFormStartedCopyWithImpl<ContractFormStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractFormStarted&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId)&&(identical(other.suggestedAmount, suggestedAmount) || other.suggestedAmount == suggestedAmount)&&(identical(other.allowCreate, allowCreate) || other.allowCreate == allowCreate));
}


@override
int get hashCode => Object.hash(runtimeType,serviceRequestId,suggestedAmount,allowCreate);

@override
String toString() {
  return 'ContractFormEvent.started(serviceRequestId: $serviceRequestId, suggestedAmount: $suggestedAmount, allowCreate: $allowCreate)';
}


}

/// @nodoc
abstract mixin class $ContractFormStartedCopyWith<$Res> implements $ContractFormEventCopyWith<$Res> {
  factory $ContractFormStartedCopyWith(ContractFormStarted value, $Res Function(ContractFormStarted) _then) = _$ContractFormStartedCopyWithImpl;
@useResult
$Res call({
 String serviceRequestId, double? suggestedAmount, bool allowCreate
});




}
/// @nodoc
class _$ContractFormStartedCopyWithImpl<$Res>
    implements $ContractFormStartedCopyWith<$Res> {
  _$ContractFormStartedCopyWithImpl(this._self, this._then);

  final ContractFormStarted _self;
  final $Res Function(ContractFormStarted) _then;

/// Create a copy of ContractFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceRequestId = null,Object? suggestedAmount = freezed,Object? allowCreate = null,}) {
  return _then(ContractFormStarted(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,suggestedAmount: freezed == suggestedAmount ? _self.suggestedAmount : suggestedAmount // ignore: cast_nullable_to_non_nullable
as double?,allowCreate: null == allowCreate ? _self.allowCreate : allowCreate // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ContractFormSaveRequested implements ContractFormEvent {
  const ContractFormSaveRequested({required this.terms, required this.startDate, required this.endDate, required this.amount});
  

 final  String terms;
 final  DateTime startDate;
 final  DateTime endDate;
 final  double amount;

/// Create a copy of ContractFormEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContractFormSaveRequestedCopyWith<ContractFormSaveRequested> get copyWith => _$ContractFormSaveRequestedCopyWithImpl<ContractFormSaveRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractFormSaveRequested&&(identical(other.terms, terms) || other.terms == terms)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.amount, amount) || other.amount == amount));
}


@override
int get hashCode => Object.hash(runtimeType,terms,startDate,endDate,amount);

@override
String toString() {
  return 'ContractFormEvent.saveRequested(terms: $terms, startDate: $startDate, endDate: $endDate, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $ContractFormSaveRequestedCopyWith<$Res> implements $ContractFormEventCopyWith<$Res> {
  factory $ContractFormSaveRequestedCopyWith(ContractFormSaveRequested value, $Res Function(ContractFormSaveRequested) _then) = _$ContractFormSaveRequestedCopyWithImpl;
@useResult
$Res call({
 String terms, DateTime startDate, DateTime endDate, double amount
});




}
/// @nodoc
class _$ContractFormSaveRequestedCopyWithImpl<$Res>
    implements $ContractFormSaveRequestedCopyWith<$Res> {
  _$ContractFormSaveRequestedCopyWithImpl(this._self, this._then);

  final ContractFormSaveRequested _self;
  final $Res Function(ContractFormSaveRequested) _then;

/// Create a copy of ContractFormEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? terms = null,Object? startDate = null,Object? endDate = null,Object? amount = null,}) {
  return _then(ContractFormSaveRequested(
terms: null == terms ? _self.terms : terms // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class ContractFormSignRequested implements ContractFormEvent {
  const ContractFormSignRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractFormSignRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractFormEvent.signRequested()';
}


}




/// @nodoc


class ContractFormCancelRequested implements ContractFormEvent {
  const ContractFormCancelRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContractFormCancelRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContractFormEvent.cancelRequested()';
}


}




// dart format on
