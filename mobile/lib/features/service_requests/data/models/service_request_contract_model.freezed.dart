// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_contract_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceRequestContractModel {

@JsonKey(fromJson: stringFromJson) String get id;@JsonKey(fromJson: stringFromJson) String get serviceRequestId; String get terms;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get startDate;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get endDate; double get amount; String get status; double? get suggestedAmount; bool get canEdit;@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? get signedByClientAt;@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? get signedByFreelancerAt;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get createdAt;@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? get updatedAt;
/// Create a copy of ServiceRequestContractModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestContractModelCopyWith<ServiceRequestContractModel> get copyWith => _$ServiceRequestContractModelCopyWithImpl<ServiceRequestContractModel>(this as ServiceRequestContractModel, _$identity);

  /// Serializes this ServiceRequestContractModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestContractModel&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId)&&(identical(other.terms, terms) || other.terms == terms)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.suggestedAmount, suggestedAmount) || other.suggestedAmount == suggestedAmount)&&(identical(other.canEdit, canEdit) || other.canEdit == canEdit)&&(identical(other.signedByClientAt, signedByClientAt) || other.signedByClientAt == signedByClientAt)&&(identical(other.signedByFreelancerAt, signedByFreelancerAt) || other.signedByFreelancerAt == signedByFreelancerAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceRequestId,terms,startDate,endDate,amount,status,suggestedAmount,canEdit,signedByClientAt,signedByFreelancerAt,createdAt,updatedAt);

@override
String toString() {
  return 'ServiceRequestContractModel(id: $id, serviceRequestId: $serviceRequestId, terms: $terms, startDate: $startDate, endDate: $endDate, amount: $amount, status: $status, suggestedAmount: $suggestedAmount, canEdit: $canEdit, signedByClientAt: $signedByClientAt, signedByFreelancerAt: $signedByFreelancerAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestContractModelCopyWith<$Res>  {
  factory $ServiceRequestContractModelCopyWith(ServiceRequestContractModel value, $Res Function(ServiceRequestContractModel) _then) = _$ServiceRequestContractModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id,@JsonKey(fromJson: stringFromJson) String serviceRequestId, String terms,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime startDate,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime endDate, double amount, String status, double? suggestedAmount, bool canEdit,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? signedByClientAt,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? signedByFreelancerAt,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? updatedAt
});




}
/// @nodoc
class _$ServiceRequestContractModelCopyWithImpl<$Res>
    implements $ServiceRequestContractModelCopyWith<$Res> {
  _$ServiceRequestContractModelCopyWithImpl(this._self, this._then);

  final ServiceRequestContractModel _self;
  final $Res Function(ServiceRequestContractModel) _then;

/// Create a copy of ServiceRequestContractModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serviceRequestId = null,Object? terms = null,Object? startDate = null,Object? endDate = null,Object? amount = null,Object? status = null,Object? suggestedAmount = freezed,Object? canEdit = null,Object? signedByClientAt = freezed,Object? signedByFreelancerAt = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(ServiceRequestContractModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,terms: null == terms ? _self.terms : terms // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,suggestedAmount: freezed == suggestedAmount ? _self.suggestedAmount : suggestedAmount // ignore: cast_nullable_to_non_nullable
as double?,canEdit: null == canEdit ? _self.canEdit : canEdit // ignore: cast_nullable_to_non_nullable
as bool,signedByClientAt: freezed == signedByClientAt ? _self.signedByClientAt : signedByClientAt // ignore: cast_nullable_to_non_nullable
as DateTime?,signedByFreelancerAt: freezed == signedByFreelancerAt ? _self.signedByFreelancerAt : signedByFreelancerAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestContractModel].
extension ServiceRequestContractModelPatterns on ServiceRequestContractModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestContractModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestContractModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestContractModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestContractModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestContractModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestContractModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id, @JsonKey(fromJson: stringFromJson)  String serviceRequestId,  String terms, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime startDate, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime endDate,  double amount,  String status,  double? suggestedAmount,  bool canEdit, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? signedByClientAt, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? signedByFreelancerAt, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestContractModel() when $default != null:
return $default(_that.id,_that.serviceRequestId,_that.terms,_that.startDate,_that.endDate,_that.amount,_that.status,_that.suggestedAmount,_that.canEdit,_that.signedByClientAt,_that.signedByFreelancerAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id, @JsonKey(fromJson: stringFromJson)  String serviceRequestId,  String terms, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime startDate, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime endDate,  double amount,  String status,  double? suggestedAmount,  bool canEdit, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? signedByClientAt, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? signedByFreelancerAt, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestContractModel():
return $default(_that.id,_that.serviceRequestId,_that.terms,_that.startDate,_that.endDate,_that.amount,_that.status,_that.suggestedAmount,_that.canEdit,_that.signedByClientAt,_that.signedByFreelancerAt,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String id, @JsonKey(fromJson: stringFromJson)  String serviceRequestId,  String terms, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime startDate, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime endDate,  double amount,  String status,  double? suggestedAmount,  bool canEdit, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? signedByClientAt, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? signedByFreelancerAt, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestContractModel() when $default != null:
return $default(_that.id,_that.serviceRequestId,_that.terms,_that.startDate,_that.endDate,_that.amount,_that.status,_that.suggestedAmount,_that.canEdit,_that.signedByClientAt,_that.signedByFreelancerAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestContractModel extends ServiceRequestContractModel {
  const _ServiceRequestContractModel({@JsonKey(fromJson: stringFromJson) required this.id, @JsonKey(fromJson: stringFromJson) required this.serviceRequestId, this.terms = '', @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.startDate, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.endDate, required this.amount, this.status = '', this.suggestedAmount, this.canEdit = false, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) this.signedByClientAt, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) this.signedByFreelancerAt, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.createdAt, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) this.updatedAt}): super._();
  factory _ServiceRequestContractModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestContractModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override@JsonKey(fromJson: stringFromJson) final  String serviceRequestId;
@override@JsonKey() final  String terms;
@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime startDate;
@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime endDate;
@override final  double amount;
@override@JsonKey() final  String status;
@override final  double? suggestedAmount;
@override@JsonKey() final  bool canEdit;
@override@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) final  DateTime? signedByClientAt;
@override@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) final  DateTime? signedByFreelancerAt;
@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime createdAt;
@override@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) final  DateTime? updatedAt;

/// Create a copy of ServiceRequestContractModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestContractModelCopyWith<_ServiceRequestContractModel> get copyWith => __$ServiceRequestContractModelCopyWithImpl<_ServiceRequestContractModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestContractModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestContractModel&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId)&&(identical(other.terms, terms) || other.terms == terms)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.suggestedAmount, suggestedAmount) || other.suggestedAmount == suggestedAmount)&&(identical(other.canEdit, canEdit) || other.canEdit == canEdit)&&(identical(other.signedByClientAt, signedByClientAt) || other.signedByClientAt == signedByClientAt)&&(identical(other.signedByFreelancerAt, signedByFreelancerAt) || other.signedByFreelancerAt == signedByFreelancerAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,serviceRequestId,terms,startDate,endDate,amount,status,suggestedAmount,canEdit,signedByClientAt,signedByFreelancerAt,createdAt,updatedAt);

@override
String toString() {
  return 'ServiceRequestContractModel(id: $id, serviceRequestId: $serviceRequestId, terms: $terms, startDate: $startDate, endDate: $endDate, amount: $amount, status: $status, suggestedAmount: $suggestedAmount, canEdit: $canEdit, signedByClientAt: $signedByClientAt, signedByFreelancerAt: $signedByFreelancerAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestContractModelCopyWith<$Res> implements $ServiceRequestContractModelCopyWith<$Res> {
  factory _$ServiceRequestContractModelCopyWith(_ServiceRequestContractModel value, $Res Function(_ServiceRequestContractModel) _then) = __$ServiceRequestContractModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id,@JsonKey(fromJson: stringFromJson) String serviceRequestId, String terms,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime startDate,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime endDate, double amount, String status, double? suggestedAmount, bool canEdit,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? signedByClientAt,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? signedByFreelancerAt,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? updatedAt
});




}
/// @nodoc
class __$ServiceRequestContractModelCopyWithImpl<$Res>
    implements _$ServiceRequestContractModelCopyWith<$Res> {
  __$ServiceRequestContractModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestContractModel _self;
  final $Res Function(_ServiceRequestContractModel) _then;

/// Create a copy of ServiceRequestContractModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceRequestId = null,Object? terms = null,Object? startDate = null,Object? endDate = null,Object? amount = null,Object? status = null,Object? suggestedAmount = freezed,Object? canEdit = null,Object? signedByClientAt = freezed,Object? signedByFreelancerAt = freezed,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_ServiceRequestContractModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,terms: null == terms ? _self.terms : terms // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,suggestedAmount: freezed == suggestedAmount ? _self.suggestedAmount : suggestedAmount // ignore: cast_nullable_to_non_nullable
as double?,canEdit: null == canEdit ? _self.canEdit : canEdit // ignore: cast_nullable_to_non_nullable
as bool,signedByClientAt: freezed == signedByClientAt ? _self.signedByClientAt : signedByClientAt // ignore: cast_nullable_to_non_nullable
as DateTime?,signedByFreelancerAt: freezed == signedByFreelancerAt ? _self.signedByFreelancerAt : signedByFreelancerAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
