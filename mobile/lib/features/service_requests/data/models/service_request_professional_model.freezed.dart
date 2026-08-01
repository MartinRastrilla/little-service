// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_professional_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceRequestContractSummaryModel {

 bool get hasContract;@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) DateTime? get startDate; double? get amount; String? get status; String? get displayStatus;
/// Create a copy of ServiceRequestContractSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestContractSummaryModelCopyWith<ServiceRequestContractSummaryModel> get copyWith => _$ServiceRequestContractSummaryModelCopyWithImpl<ServiceRequestContractSummaryModel>(this as ServiceRequestContractSummaryModel, _$identity);

  /// Serializes this ServiceRequestContractSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestContractSummaryModel&&(identical(other.hasContract, hasContract) || other.hasContract == hasContract)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasContract,startDate,amount,status,displayStatus);

@override
String toString() {
  return 'ServiceRequestContractSummaryModel(hasContract: $hasContract, startDate: $startDate, amount: $amount, status: $status, displayStatus: $displayStatus)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestContractSummaryModelCopyWith<$Res>  {
  factory $ServiceRequestContractSummaryModelCopyWith(ServiceRequestContractSummaryModel value, $Res Function(ServiceRequestContractSummaryModel) _then) = _$ServiceRequestContractSummaryModelCopyWithImpl;
@useResult
$Res call({
 bool hasContract,@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) DateTime? startDate, double? amount, String? status, String? displayStatus
});




}
/// @nodoc
class _$ServiceRequestContractSummaryModelCopyWithImpl<$Res>
    implements $ServiceRequestContractSummaryModelCopyWith<$Res> {
  _$ServiceRequestContractSummaryModelCopyWithImpl(this._self, this._then);

  final ServiceRequestContractSummaryModel _self;
  final $Res Function(ServiceRequestContractSummaryModel) _then;

/// Create a copy of ServiceRequestContractSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasContract = null,Object? startDate = freezed,Object? amount = freezed,Object? status = freezed,Object? displayStatus = freezed,}) {
  return _then(ServiceRequestContractSummaryModel(
hasContract: null == hasContract ? _self.hasContract : hasContract // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,displayStatus: freezed == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestContractSummaryModel].
extension ServiceRequestContractSummaryModelPatterns on ServiceRequestContractSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestContractSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestContractSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestContractSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestContractSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestContractSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestContractSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasContract, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)  DateTime? startDate,  double? amount,  String? status,  String? displayStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestContractSummaryModel() when $default != null:
return $default(_that.hasContract,_that.startDate,_that.amount,_that.status,_that.displayStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasContract, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)  DateTime? startDate,  double? amount,  String? status,  String? displayStatus)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestContractSummaryModel():
return $default(_that.hasContract,_that.startDate,_that.amount,_that.status,_that.displayStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasContract, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)  DateTime? startDate,  double? amount,  String? status,  String? displayStatus)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestContractSummaryModel() when $default != null:
return $default(_that.hasContract,_that.startDate,_that.amount,_that.status,_that.displayStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestContractSummaryModel extends ServiceRequestContractSummaryModel {
  const _ServiceRequestContractSummaryModel({this.hasContract = false, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) this.startDate, this.amount, this.status, this.displayStatus}): super._();
  factory _ServiceRequestContractSummaryModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestContractSummaryModelFromJson(json);

@override@JsonKey() final  bool hasContract;
@override@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) final  DateTime? startDate;
@override final  double? amount;
@override final  String? status;
@override final  String? displayStatus;

/// Create a copy of ServiceRequestContractSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestContractSummaryModelCopyWith<_ServiceRequestContractSummaryModel> get copyWith => __$ServiceRequestContractSummaryModelCopyWithImpl<_ServiceRequestContractSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestContractSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestContractSummaryModel&&(identical(other.hasContract, hasContract) || other.hasContract == hasContract)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasContract,startDate,amount,status,displayStatus);

@override
String toString() {
  return 'ServiceRequestContractSummaryModel(hasContract: $hasContract, startDate: $startDate, amount: $amount, status: $status, displayStatus: $displayStatus)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestContractSummaryModelCopyWith<$Res> implements $ServiceRequestContractSummaryModelCopyWith<$Res> {
  factory _$ServiceRequestContractSummaryModelCopyWith(_ServiceRequestContractSummaryModel value, $Res Function(_ServiceRequestContractSummaryModel) _then) = __$ServiceRequestContractSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 bool hasContract,@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) DateTime? startDate, double? amount, String? status, String? displayStatus
});




}
/// @nodoc
class __$ServiceRequestContractSummaryModelCopyWithImpl<$Res>
    implements _$ServiceRequestContractSummaryModelCopyWith<$Res> {
  __$ServiceRequestContractSummaryModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestContractSummaryModel _self;
  final $Res Function(_ServiceRequestContractSummaryModel) _then;

/// Create a copy of ServiceRequestContractSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasContract = null,Object? startDate = freezed,Object? amount = freezed,Object? status = freezed,Object? displayStatus = freezed,}) {
  return _then(_ServiceRequestContractSummaryModel(
hasContract: null == hasContract ? _self.hasContract : hasContract // ignore: cast_nullable_to_non_nullable
as bool,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,displayStatus: freezed == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ServiceRequestProfessionalActionsModel {

 bool get canRevokeEngagement; String? get revokeEngagementBlockedReason; bool get canOpenProfile; bool get canOpenChat; bool get canCall; bool get canViewContract;
/// Create a copy of ServiceRequestProfessionalActionsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestProfessionalActionsModelCopyWith<ServiceRequestProfessionalActionsModel> get copyWith => _$ServiceRequestProfessionalActionsModelCopyWithImpl<ServiceRequestProfessionalActionsModel>(this as ServiceRequestProfessionalActionsModel, _$identity);

  /// Serializes this ServiceRequestProfessionalActionsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestProfessionalActionsModel&&(identical(other.canRevokeEngagement, canRevokeEngagement) || other.canRevokeEngagement == canRevokeEngagement)&&(identical(other.revokeEngagementBlockedReason, revokeEngagementBlockedReason) || other.revokeEngagementBlockedReason == revokeEngagementBlockedReason)&&(identical(other.canOpenProfile, canOpenProfile) || other.canOpenProfile == canOpenProfile)&&(identical(other.canOpenChat, canOpenChat) || other.canOpenChat == canOpenChat)&&(identical(other.canCall, canCall) || other.canCall == canCall)&&(identical(other.canViewContract, canViewContract) || other.canViewContract == canViewContract));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canRevokeEngagement,revokeEngagementBlockedReason,canOpenProfile,canOpenChat,canCall,canViewContract);

@override
String toString() {
  return 'ServiceRequestProfessionalActionsModel(canRevokeEngagement: $canRevokeEngagement, revokeEngagementBlockedReason: $revokeEngagementBlockedReason, canOpenProfile: $canOpenProfile, canOpenChat: $canOpenChat, canCall: $canCall, canViewContract: $canViewContract)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestProfessionalActionsModelCopyWith<$Res>  {
  factory $ServiceRequestProfessionalActionsModelCopyWith(ServiceRequestProfessionalActionsModel value, $Res Function(ServiceRequestProfessionalActionsModel) _then) = _$ServiceRequestProfessionalActionsModelCopyWithImpl;
@useResult
$Res call({
 bool canRevokeEngagement, String? revokeEngagementBlockedReason, bool canOpenProfile, bool canOpenChat, bool canCall, bool canViewContract
});




}
/// @nodoc
class _$ServiceRequestProfessionalActionsModelCopyWithImpl<$Res>
    implements $ServiceRequestProfessionalActionsModelCopyWith<$Res> {
  _$ServiceRequestProfessionalActionsModelCopyWithImpl(this._self, this._then);

  final ServiceRequestProfessionalActionsModel _self;
  final $Res Function(ServiceRequestProfessionalActionsModel) _then;

/// Create a copy of ServiceRequestProfessionalActionsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? canRevokeEngagement = null,Object? revokeEngagementBlockedReason = freezed,Object? canOpenProfile = null,Object? canOpenChat = null,Object? canCall = null,Object? canViewContract = null,}) {
  return _then(ServiceRequestProfessionalActionsModel(
canRevokeEngagement: null == canRevokeEngagement ? _self.canRevokeEngagement : canRevokeEngagement // ignore: cast_nullable_to_non_nullable
as bool,revokeEngagementBlockedReason: freezed == revokeEngagementBlockedReason ? _self.revokeEngagementBlockedReason : revokeEngagementBlockedReason // ignore: cast_nullable_to_non_nullable
as String?,canOpenProfile: null == canOpenProfile ? _self.canOpenProfile : canOpenProfile // ignore: cast_nullable_to_non_nullable
as bool,canOpenChat: null == canOpenChat ? _self.canOpenChat : canOpenChat // ignore: cast_nullable_to_non_nullable
as bool,canCall: null == canCall ? _self.canCall : canCall // ignore: cast_nullable_to_non_nullable
as bool,canViewContract: null == canViewContract ? _self.canViewContract : canViewContract // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestProfessionalActionsModel].
extension ServiceRequestProfessionalActionsModelPatterns on ServiceRequestProfessionalActionsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestProfessionalActionsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestProfessionalActionsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestProfessionalActionsModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestProfessionalActionsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestProfessionalActionsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestProfessionalActionsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool canRevokeEngagement,  String? revokeEngagementBlockedReason,  bool canOpenProfile,  bool canOpenChat,  bool canCall,  bool canViewContract)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestProfessionalActionsModel() when $default != null:
return $default(_that.canRevokeEngagement,_that.revokeEngagementBlockedReason,_that.canOpenProfile,_that.canOpenChat,_that.canCall,_that.canViewContract);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool canRevokeEngagement,  String? revokeEngagementBlockedReason,  bool canOpenProfile,  bool canOpenChat,  bool canCall,  bool canViewContract)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestProfessionalActionsModel():
return $default(_that.canRevokeEngagement,_that.revokeEngagementBlockedReason,_that.canOpenProfile,_that.canOpenChat,_that.canCall,_that.canViewContract);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool canRevokeEngagement,  String? revokeEngagementBlockedReason,  bool canOpenProfile,  bool canOpenChat,  bool canCall,  bool canViewContract)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestProfessionalActionsModel() when $default != null:
return $default(_that.canRevokeEngagement,_that.revokeEngagementBlockedReason,_that.canOpenProfile,_that.canOpenChat,_that.canCall,_that.canViewContract);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestProfessionalActionsModel extends ServiceRequestProfessionalActionsModel {
  const _ServiceRequestProfessionalActionsModel({this.canRevokeEngagement = false, this.revokeEngagementBlockedReason, this.canOpenProfile = false, this.canOpenChat = false, this.canCall = false, this.canViewContract = false}): super._();
  factory _ServiceRequestProfessionalActionsModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestProfessionalActionsModelFromJson(json);

@override@JsonKey() final  bool canRevokeEngagement;
@override final  String? revokeEngagementBlockedReason;
@override@JsonKey() final  bool canOpenProfile;
@override@JsonKey() final  bool canOpenChat;
@override@JsonKey() final  bool canCall;
@override@JsonKey() final  bool canViewContract;

/// Create a copy of ServiceRequestProfessionalActionsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestProfessionalActionsModelCopyWith<_ServiceRequestProfessionalActionsModel> get copyWith => __$ServiceRequestProfessionalActionsModelCopyWithImpl<_ServiceRequestProfessionalActionsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestProfessionalActionsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestProfessionalActionsModel&&(identical(other.canRevokeEngagement, canRevokeEngagement) || other.canRevokeEngagement == canRevokeEngagement)&&(identical(other.revokeEngagementBlockedReason, revokeEngagementBlockedReason) || other.revokeEngagementBlockedReason == revokeEngagementBlockedReason)&&(identical(other.canOpenProfile, canOpenProfile) || other.canOpenProfile == canOpenProfile)&&(identical(other.canOpenChat, canOpenChat) || other.canOpenChat == canOpenChat)&&(identical(other.canCall, canCall) || other.canCall == canCall)&&(identical(other.canViewContract, canViewContract) || other.canViewContract == canViewContract));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,canRevokeEngagement,revokeEngagementBlockedReason,canOpenProfile,canOpenChat,canCall,canViewContract);

@override
String toString() {
  return 'ServiceRequestProfessionalActionsModel(canRevokeEngagement: $canRevokeEngagement, revokeEngagementBlockedReason: $revokeEngagementBlockedReason, canOpenProfile: $canOpenProfile, canOpenChat: $canOpenChat, canCall: $canCall, canViewContract: $canViewContract)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestProfessionalActionsModelCopyWith<$Res> implements $ServiceRequestProfessionalActionsModelCopyWith<$Res> {
  factory _$ServiceRequestProfessionalActionsModelCopyWith(_ServiceRequestProfessionalActionsModel value, $Res Function(_ServiceRequestProfessionalActionsModel) _then) = __$ServiceRequestProfessionalActionsModelCopyWithImpl;
@override @useResult
$Res call({
 bool canRevokeEngagement, String? revokeEngagementBlockedReason, bool canOpenProfile, bool canOpenChat, bool canCall, bool canViewContract
});




}
/// @nodoc
class __$ServiceRequestProfessionalActionsModelCopyWithImpl<$Res>
    implements _$ServiceRequestProfessionalActionsModelCopyWith<$Res> {
  __$ServiceRequestProfessionalActionsModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestProfessionalActionsModel _self;
  final $Res Function(_ServiceRequestProfessionalActionsModel) _then;

/// Create a copy of ServiceRequestProfessionalActionsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? canRevokeEngagement = null,Object? revokeEngagementBlockedReason = freezed,Object? canOpenProfile = null,Object? canOpenChat = null,Object? canCall = null,Object? canViewContract = null,}) {
  return _then(_ServiceRequestProfessionalActionsModel(
canRevokeEngagement: null == canRevokeEngagement ? _self.canRevokeEngagement : canRevokeEngagement // ignore: cast_nullable_to_non_nullable
as bool,revokeEngagementBlockedReason: freezed == revokeEngagementBlockedReason ? _self.revokeEngagementBlockedReason : revokeEngagementBlockedReason // ignore: cast_nullable_to_non_nullable
as String?,canOpenProfile: null == canOpenProfile ? _self.canOpenProfile : canOpenProfile // ignore: cast_nullable_to_non_nullable
as bool,canOpenChat: null == canOpenChat ? _self.canOpenChat : canOpenChat // ignore: cast_nullable_to_non_nullable
as bool,canCall: null == canCall ? _self.canCall : canCall // ignore: cast_nullable_to_non_nullable
as bool,canViewContract: null == canViewContract ? _self.canViewContract : canViewContract // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ServiceRequestProfessionalModel {

 bool get hasAssignedProfessional;@JsonKey(fromJson: stringFromJson) String? get freelancerId; String get serviceLocation; String get displayStatus;@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) DateTime? get selectedAt; ServiceRequestContractSummaryModel get contractSummary; ServiceRequestProfessionalActionsModel get actions;
/// Create a copy of ServiceRequestProfessionalModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestProfessionalModelCopyWith<ServiceRequestProfessionalModel> get copyWith => _$ServiceRequestProfessionalModelCopyWithImpl<ServiceRequestProfessionalModel>(this as ServiceRequestProfessionalModel, _$identity);

  /// Serializes this ServiceRequestProfessionalModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestProfessionalModel&&(identical(other.hasAssignedProfessional, hasAssignedProfessional) || other.hasAssignedProfessional == hasAssignedProfessional)&&(identical(other.freelancerId, freelancerId) || other.freelancerId == freelancerId)&&(identical(other.serviceLocation, serviceLocation) || other.serviceLocation == serviceLocation)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus)&&(identical(other.selectedAt, selectedAt) || other.selectedAt == selectedAt)&&(identical(other.contractSummary, contractSummary) || other.contractSummary == contractSummary)&&(identical(other.actions, actions) || other.actions == actions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasAssignedProfessional,freelancerId,serviceLocation,displayStatus,selectedAt,contractSummary,actions);

@override
String toString() {
  return 'ServiceRequestProfessionalModel(hasAssignedProfessional: $hasAssignedProfessional, freelancerId: $freelancerId, serviceLocation: $serviceLocation, displayStatus: $displayStatus, selectedAt: $selectedAt, contractSummary: $contractSummary, actions: $actions)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestProfessionalModelCopyWith<$Res>  {
  factory $ServiceRequestProfessionalModelCopyWith(ServiceRequestProfessionalModel value, $Res Function(ServiceRequestProfessionalModel) _then) = _$ServiceRequestProfessionalModelCopyWithImpl;
@useResult
$Res call({
 bool hasAssignedProfessional,@JsonKey(fromJson: stringFromJson) String? freelancerId, String serviceLocation, String displayStatus,@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) DateTime? selectedAt, ServiceRequestContractSummaryModel contractSummary, ServiceRequestProfessionalActionsModel actions
});


$ServiceRequestContractSummaryModelCopyWith<$Res> get contractSummary;$ServiceRequestProfessionalActionsModelCopyWith<$Res> get actions;

}
/// @nodoc
class _$ServiceRequestProfessionalModelCopyWithImpl<$Res>
    implements $ServiceRequestProfessionalModelCopyWith<$Res> {
  _$ServiceRequestProfessionalModelCopyWithImpl(this._self, this._then);

  final ServiceRequestProfessionalModel _self;
  final $Res Function(ServiceRequestProfessionalModel) _then;

/// Create a copy of ServiceRequestProfessionalModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasAssignedProfessional = null,Object? freelancerId = freezed,Object? serviceLocation = null,Object? displayStatus = null,Object? selectedAt = freezed,Object? contractSummary = null,Object? actions = null,}) {
  return _then(ServiceRequestProfessionalModel(
hasAssignedProfessional: null == hasAssignedProfessional ? _self.hasAssignedProfessional : hasAssignedProfessional // ignore: cast_nullable_to_non_nullable
as bool,freelancerId: freezed == freelancerId ? _self.freelancerId : freelancerId // ignore: cast_nullable_to_non_nullable
as String?,serviceLocation: null == serviceLocation ? _self.serviceLocation : serviceLocation // ignore: cast_nullable_to_non_nullable
as String,displayStatus: null == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String,selectedAt: freezed == selectedAt ? _self.selectedAt : selectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,contractSummary: null == contractSummary ? _self.contractSummary : contractSummary // ignore: cast_nullable_to_non_nullable
as ServiceRequestContractSummaryModel,actions: null == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as ServiceRequestProfessionalActionsModel,
  ));
}
/// Create a copy of ServiceRequestProfessionalModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceRequestContractSummaryModelCopyWith<$Res> get contractSummary {
  
  return $ServiceRequestContractSummaryModelCopyWith<$Res>(_self.contractSummary, (value) {
    return _then(_self.copyWith(contractSummary: value));
  });
}/// Create a copy of ServiceRequestProfessionalModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceRequestProfessionalActionsModelCopyWith<$Res> get actions {
  
  return $ServiceRequestProfessionalActionsModelCopyWith<$Res>(_self.actions, (value) {
    return _then(_self.copyWith(actions: value));
  });
}
}


/// Adds pattern-matching-related methods to [ServiceRequestProfessionalModel].
extension ServiceRequestProfessionalModelPatterns on ServiceRequestProfessionalModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestProfessionalModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestProfessionalModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestProfessionalModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestProfessionalModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestProfessionalModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestProfessionalModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasAssignedProfessional, @JsonKey(fromJson: stringFromJson)  String? freelancerId,  String serviceLocation,  String displayStatus, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)  DateTime? selectedAt,  ServiceRequestContractSummaryModel contractSummary,  ServiceRequestProfessionalActionsModel actions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestProfessionalModel() when $default != null:
return $default(_that.hasAssignedProfessional,_that.freelancerId,_that.serviceLocation,_that.displayStatus,_that.selectedAt,_that.contractSummary,_that.actions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasAssignedProfessional, @JsonKey(fromJson: stringFromJson)  String? freelancerId,  String serviceLocation,  String displayStatus, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)  DateTime? selectedAt,  ServiceRequestContractSummaryModel contractSummary,  ServiceRequestProfessionalActionsModel actions)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestProfessionalModel():
return $default(_that.hasAssignedProfessional,_that.freelancerId,_that.serviceLocation,_that.displayStatus,_that.selectedAt,_that.contractSummary,_that.actions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasAssignedProfessional, @JsonKey(fromJson: stringFromJson)  String? freelancerId,  String serviceLocation,  String displayStatus, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)  DateTime? selectedAt,  ServiceRequestContractSummaryModel contractSummary,  ServiceRequestProfessionalActionsModel actions)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestProfessionalModel() when $default != null:
return $default(_that.hasAssignedProfessional,_that.freelancerId,_that.serviceLocation,_that.displayStatus,_that.selectedAt,_that.contractSummary,_that.actions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestProfessionalModel extends ServiceRequestProfessionalModel {
  const _ServiceRequestProfessionalModel({this.hasAssignedProfessional = false, @JsonKey(fromJson: stringFromJson) this.freelancerId, this.serviceLocation = '', this.displayStatus = '', @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) this.selectedAt, this.contractSummary = const ServiceRequestContractSummaryModel(), this.actions = const ServiceRequestProfessionalActionsModel()}): super._();
  factory _ServiceRequestProfessionalModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestProfessionalModelFromJson(json);

@override@JsonKey() final  bool hasAssignedProfessional;
@override@JsonKey(fromJson: stringFromJson) final  String? freelancerId;
@override@JsonKey() final  String serviceLocation;
@override@JsonKey() final  String displayStatus;
@override@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) final  DateTime? selectedAt;
@override@JsonKey() final  ServiceRequestContractSummaryModel contractSummary;
@override@JsonKey() final  ServiceRequestProfessionalActionsModel actions;

/// Create a copy of ServiceRequestProfessionalModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestProfessionalModelCopyWith<_ServiceRequestProfessionalModel> get copyWith => __$ServiceRequestProfessionalModelCopyWithImpl<_ServiceRequestProfessionalModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestProfessionalModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestProfessionalModel&&(identical(other.hasAssignedProfessional, hasAssignedProfessional) || other.hasAssignedProfessional == hasAssignedProfessional)&&(identical(other.freelancerId, freelancerId) || other.freelancerId == freelancerId)&&(identical(other.serviceLocation, serviceLocation) || other.serviceLocation == serviceLocation)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus)&&(identical(other.selectedAt, selectedAt) || other.selectedAt == selectedAt)&&(identical(other.contractSummary, contractSummary) || other.contractSummary == contractSummary)&&(identical(other.actions, actions) || other.actions == actions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasAssignedProfessional,freelancerId,serviceLocation,displayStatus,selectedAt,contractSummary,actions);

@override
String toString() {
  return 'ServiceRequestProfessionalModel(hasAssignedProfessional: $hasAssignedProfessional, freelancerId: $freelancerId, serviceLocation: $serviceLocation, displayStatus: $displayStatus, selectedAt: $selectedAt, contractSummary: $contractSummary, actions: $actions)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestProfessionalModelCopyWith<$Res> implements $ServiceRequestProfessionalModelCopyWith<$Res> {
  factory _$ServiceRequestProfessionalModelCopyWith(_ServiceRequestProfessionalModel value, $Res Function(_ServiceRequestProfessionalModel) _then) = __$ServiceRequestProfessionalModelCopyWithImpl;
@override @useResult
$Res call({
 bool hasAssignedProfessional,@JsonKey(fromJson: stringFromJson) String? freelancerId, String serviceLocation, String displayStatus,@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) DateTime? selectedAt, ServiceRequestContractSummaryModel contractSummary, ServiceRequestProfessionalActionsModel actions
});


@override $ServiceRequestContractSummaryModelCopyWith<$Res> get contractSummary;@override $ServiceRequestProfessionalActionsModelCopyWith<$Res> get actions;

}
/// @nodoc
class __$ServiceRequestProfessionalModelCopyWithImpl<$Res>
    implements _$ServiceRequestProfessionalModelCopyWith<$Res> {
  __$ServiceRequestProfessionalModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestProfessionalModel _self;
  final $Res Function(_ServiceRequestProfessionalModel) _then;

/// Create a copy of ServiceRequestProfessionalModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasAssignedProfessional = null,Object? freelancerId = freezed,Object? serviceLocation = null,Object? displayStatus = null,Object? selectedAt = freezed,Object? contractSummary = null,Object? actions = null,}) {
  return _then(_ServiceRequestProfessionalModel(
hasAssignedProfessional: null == hasAssignedProfessional ? _self.hasAssignedProfessional : hasAssignedProfessional // ignore: cast_nullable_to_non_nullable
as bool,freelancerId: freezed == freelancerId ? _self.freelancerId : freelancerId // ignore: cast_nullable_to_non_nullable
as String?,serviceLocation: null == serviceLocation ? _self.serviceLocation : serviceLocation // ignore: cast_nullable_to_non_nullable
as String,displayStatus: null == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String,selectedAt: freezed == selectedAt ? _self.selectedAt : selectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,contractSummary: null == contractSummary ? _self.contractSummary : contractSummary // ignore: cast_nullable_to_non_nullable
as ServiceRequestContractSummaryModel,actions: null == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as ServiceRequestProfessionalActionsModel,
  ));
}

/// Create a copy of ServiceRequestProfessionalModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceRequestContractSummaryModelCopyWith<$Res> get contractSummary {
  
  return $ServiceRequestContractSummaryModelCopyWith<$Res>(_self.contractSummary, (value) {
    return _then(_self.copyWith(contractSummary: value));
  });
}/// Create a copy of ServiceRequestProfessionalModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceRequestProfessionalActionsModelCopyWith<$Res> get actions {
  
  return $ServiceRequestProfessionalActionsModelCopyWith<$Res>(_self.actions, (value) {
    return _then(_self.copyWith(actions: value));
  });
}
}

// dart format on
