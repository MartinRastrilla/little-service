// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelancer_work_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FreelancerWorkItemModel {

@JsonKey(fromJson: stringFromJson) String get id; String get title; String get location; String get status; String get displayStatus; double? get price; String get priceMode; int get photosCount; int get applicationsCount; String? get coverPhotoUrl;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get createdAt;@JsonKey(fromJson: stringFromJson) String? get applicationId; String? get applicationStatus;@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? get applicationCreatedAt; bool get canViewApplicationDetail; String? get clientName; double? get contractAmount;@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? get contractStartDate; bool get hasContract; int get unreadMessagesCount;
/// Create a copy of FreelancerWorkItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerWorkItemModelCopyWith<FreelancerWorkItemModel> get copyWith => _$FreelancerWorkItemModelCopyWithImpl<FreelancerWorkItemModel>(this as FreelancerWorkItemModel, _$identity);

  /// Serializes this FreelancerWorkItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerWorkItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.photosCount, photosCount) || other.photosCount == photosCount)&&(identical(other.applicationsCount, applicationsCount) || other.applicationsCount == applicationsCount)&&(identical(other.coverPhotoUrl, coverPhotoUrl) || other.coverPhotoUrl == coverPhotoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.applicationStatus, applicationStatus) || other.applicationStatus == applicationStatus)&&(identical(other.applicationCreatedAt, applicationCreatedAt) || other.applicationCreatedAt == applicationCreatedAt)&&(identical(other.canViewApplicationDetail, canViewApplicationDetail) || other.canViewApplicationDetail == canViewApplicationDetail)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.contractAmount, contractAmount) || other.contractAmount == contractAmount)&&(identical(other.contractStartDate, contractStartDate) || other.contractStartDate == contractStartDate)&&(identical(other.hasContract, hasContract) || other.hasContract == hasContract)&&(identical(other.unreadMessagesCount, unreadMessagesCount) || other.unreadMessagesCount == unreadMessagesCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,location,status,displayStatus,price,priceMode,photosCount,applicationsCount,coverPhotoUrl,createdAt,applicationId,applicationStatus,applicationCreatedAt,canViewApplicationDetail,clientName,contractAmount,contractStartDate,hasContract,unreadMessagesCount]);

@override
String toString() {
  return 'FreelancerWorkItemModel(id: $id, title: $title, location: $location, status: $status, displayStatus: $displayStatus, price: $price, priceMode: $priceMode, photosCount: $photosCount, applicationsCount: $applicationsCount, coverPhotoUrl: $coverPhotoUrl, createdAt: $createdAt, applicationId: $applicationId, applicationStatus: $applicationStatus, applicationCreatedAt: $applicationCreatedAt, canViewApplicationDetail: $canViewApplicationDetail, clientName: $clientName, contractAmount: $contractAmount, contractStartDate: $contractStartDate, hasContract: $hasContract, unreadMessagesCount: $unreadMessagesCount)';
}


}

/// @nodoc
abstract mixin class $FreelancerWorkItemModelCopyWith<$Res>  {
  factory $FreelancerWorkItemModelCopyWith(FreelancerWorkItemModel value, $Res Function(FreelancerWorkItemModel) _then) = _$FreelancerWorkItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String title, String location, String status, String displayStatus, double? price, String priceMode, int photosCount, int applicationsCount, String? coverPhotoUrl,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt,@JsonKey(fromJson: stringFromJson) String? applicationId, String? applicationStatus,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? applicationCreatedAt, bool canViewApplicationDetail, String? clientName, double? contractAmount,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? contractStartDate, bool hasContract, int unreadMessagesCount
});




}
/// @nodoc
class _$FreelancerWorkItemModelCopyWithImpl<$Res>
    implements $FreelancerWorkItemModelCopyWith<$Res> {
  _$FreelancerWorkItemModelCopyWithImpl(this._self, this._then);

  final FreelancerWorkItemModel _self;
  final $Res Function(FreelancerWorkItemModel) _then;

/// Create a copy of FreelancerWorkItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? location = null,Object? status = null,Object? displayStatus = null,Object? price = freezed,Object? priceMode = null,Object? photosCount = null,Object? applicationsCount = null,Object? coverPhotoUrl = freezed,Object? createdAt = null,Object? applicationId = freezed,Object? applicationStatus = freezed,Object? applicationCreatedAt = freezed,Object? canViewApplicationDetail = null,Object? clientName = freezed,Object? contractAmount = freezed,Object? contractStartDate = freezed,Object? hasContract = null,Object? unreadMessagesCount = null,}) {
  return _then(FreelancerWorkItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayStatus: null == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceMode: null == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String,photosCount: null == photosCount ? _self.photosCount : photosCount // ignore: cast_nullable_to_non_nullable
as int,applicationsCount: null == applicationsCount ? _self.applicationsCount : applicationsCount // ignore: cast_nullable_to_non_nullable
as int,coverPhotoUrl: freezed == coverPhotoUrl ? _self.coverPhotoUrl : coverPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,applicationStatus: freezed == applicationStatus ? _self.applicationStatus : applicationStatus // ignore: cast_nullable_to_non_nullable
as String?,applicationCreatedAt: freezed == applicationCreatedAt ? _self.applicationCreatedAt : applicationCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,canViewApplicationDetail: null == canViewApplicationDetail ? _self.canViewApplicationDetail : canViewApplicationDetail // ignore: cast_nullable_to_non_nullable
as bool,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,contractAmount: freezed == contractAmount ? _self.contractAmount : contractAmount // ignore: cast_nullable_to_non_nullable
as double?,contractStartDate: freezed == contractStartDate ? _self.contractStartDate : contractStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasContract: null == hasContract ? _self.hasContract : hasContract // ignore: cast_nullable_to_non_nullable
as bool,unreadMessagesCount: null == unreadMessagesCount ? _self.unreadMessagesCount : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FreelancerWorkItemModel].
extension FreelancerWorkItemModelPatterns on FreelancerWorkItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FreelancerWorkItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FreelancerWorkItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FreelancerWorkItemModel value)  $default,){
final _that = this;
switch (_that) {
case _FreelancerWorkItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FreelancerWorkItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _FreelancerWorkItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String location,  String status,  String displayStatus,  double? price,  String priceMode,  int photosCount,  int applicationsCount,  String? coverPhotoUrl, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt, @JsonKey(fromJson: stringFromJson)  String? applicationId,  String? applicationStatus, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? applicationCreatedAt,  bool canViewApplicationDetail,  String? clientName,  double? contractAmount, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? contractStartDate,  bool hasContract,  int unreadMessagesCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FreelancerWorkItemModel() when $default != null:
return $default(_that.id,_that.title,_that.location,_that.status,_that.displayStatus,_that.price,_that.priceMode,_that.photosCount,_that.applicationsCount,_that.coverPhotoUrl,_that.createdAt,_that.applicationId,_that.applicationStatus,_that.applicationCreatedAt,_that.canViewApplicationDetail,_that.clientName,_that.contractAmount,_that.contractStartDate,_that.hasContract,_that.unreadMessagesCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String location,  String status,  String displayStatus,  double? price,  String priceMode,  int photosCount,  int applicationsCount,  String? coverPhotoUrl, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt, @JsonKey(fromJson: stringFromJson)  String? applicationId,  String? applicationStatus, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? applicationCreatedAt,  bool canViewApplicationDetail,  String? clientName,  double? contractAmount, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? contractStartDate,  bool hasContract,  int unreadMessagesCount)  $default,) {final _that = this;
switch (_that) {
case _FreelancerWorkItemModel():
return $default(_that.id,_that.title,_that.location,_that.status,_that.displayStatus,_that.price,_that.priceMode,_that.photosCount,_that.applicationsCount,_that.coverPhotoUrl,_that.createdAt,_that.applicationId,_that.applicationStatus,_that.applicationCreatedAt,_that.canViewApplicationDetail,_that.clientName,_that.contractAmount,_that.contractStartDate,_that.hasContract,_that.unreadMessagesCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String location,  String status,  String displayStatus,  double? price,  String priceMode,  int photosCount,  int applicationsCount,  String? coverPhotoUrl, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt, @JsonKey(fromJson: stringFromJson)  String? applicationId,  String? applicationStatus, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? applicationCreatedAt,  bool canViewApplicationDetail,  String? clientName,  double? contractAmount, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? contractStartDate,  bool hasContract,  int unreadMessagesCount)?  $default,) {final _that = this;
switch (_that) {
case _FreelancerWorkItemModel() when $default != null:
return $default(_that.id,_that.title,_that.location,_that.status,_that.displayStatus,_that.price,_that.priceMode,_that.photosCount,_that.applicationsCount,_that.coverPhotoUrl,_that.createdAt,_that.applicationId,_that.applicationStatus,_that.applicationCreatedAt,_that.canViewApplicationDetail,_that.clientName,_that.contractAmount,_that.contractStartDate,_that.hasContract,_that.unreadMessagesCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FreelancerWorkItemModel extends FreelancerWorkItemModel {
  const _FreelancerWorkItemModel({@JsonKey(fromJson: stringFromJson) required this.id, required this.title, required this.location, required this.status, required this.displayStatus, this.price, this.priceMode = 'ToBeAgreed', this.photosCount = 0, this.applicationsCount = 0, this.coverPhotoUrl, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.createdAt, @JsonKey(fromJson: stringFromJson) this.applicationId, this.applicationStatus, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) this.applicationCreatedAt, this.canViewApplicationDetail = false, this.clientName, this.contractAmount, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) this.contractStartDate, this.hasContract = false, this.unreadMessagesCount = 0}): super._();
  factory _FreelancerWorkItemModel.fromJson(Map<String, dynamic> json) => _$FreelancerWorkItemModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override final  String title;
@override final  String location;
@override final  String status;
@override final  String displayStatus;
@override final  double? price;
@override@JsonKey() final  String priceMode;
@override@JsonKey() final  int photosCount;
@override@JsonKey() final  int applicationsCount;
@override final  String? coverPhotoUrl;
@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime createdAt;
@override@JsonKey(fromJson: stringFromJson) final  String? applicationId;
@override final  String? applicationStatus;
@override@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) final  DateTime? applicationCreatedAt;
@override@JsonKey() final  bool canViewApplicationDetail;
@override final  String? clientName;
@override final  double? contractAmount;
@override@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) final  DateTime? contractStartDate;
@override@JsonKey() final  bool hasContract;
@override@JsonKey() final  int unreadMessagesCount;

/// Create a copy of FreelancerWorkItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreelancerWorkItemModelCopyWith<_FreelancerWorkItemModel> get copyWith => __$FreelancerWorkItemModelCopyWithImpl<_FreelancerWorkItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FreelancerWorkItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreelancerWorkItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.photosCount, photosCount) || other.photosCount == photosCount)&&(identical(other.applicationsCount, applicationsCount) || other.applicationsCount == applicationsCount)&&(identical(other.coverPhotoUrl, coverPhotoUrl) || other.coverPhotoUrl == coverPhotoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.applicationStatus, applicationStatus) || other.applicationStatus == applicationStatus)&&(identical(other.applicationCreatedAt, applicationCreatedAt) || other.applicationCreatedAt == applicationCreatedAt)&&(identical(other.canViewApplicationDetail, canViewApplicationDetail) || other.canViewApplicationDetail == canViewApplicationDetail)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.contractAmount, contractAmount) || other.contractAmount == contractAmount)&&(identical(other.contractStartDate, contractStartDate) || other.contractStartDate == contractStartDate)&&(identical(other.hasContract, hasContract) || other.hasContract == hasContract)&&(identical(other.unreadMessagesCount, unreadMessagesCount) || other.unreadMessagesCount == unreadMessagesCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,location,status,displayStatus,price,priceMode,photosCount,applicationsCount,coverPhotoUrl,createdAt,applicationId,applicationStatus,applicationCreatedAt,canViewApplicationDetail,clientName,contractAmount,contractStartDate,hasContract,unreadMessagesCount]);

@override
String toString() {
  return 'FreelancerWorkItemModel(id: $id, title: $title, location: $location, status: $status, displayStatus: $displayStatus, price: $price, priceMode: $priceMode, photosCount: $photosCount, applicationsCount: $applicationsCount, coverPhotoUrl: $coverPhotoUrl, createdAt: $createdAt, applicationId: $applicationId, applicationStatus: $applicationStatus, applicationCreatedAt: $applicationCreatedAt, canViewApplicationDetail: $canViewApplicationDetail, clientName: $clientName, contractAmount: $contractAmount, contractStartDate: $contractStartDate, hasContract: $hasContract, unreadMessagesCount: $unreadMessagesCount)';
}


}

/// @nodoc
abstract mixin class _$FreelancerWorkItemModelCopyWith<$Res> implements $FreelancerWorkItemModelCopyWith<$Res> {
  factory _$FreelancerWorkItemModelCopyWith(_FreelancerWorkItemModel value, $Res Function(_FreelancerWorkItemModel) _then) = __$FreelancerWorkItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String title, String location, String status, String displayStatus, double? price, String priceMode, int photosCount, int applicationsCount, String? coverPhotoUrl,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt,@JsonKey(fromJson: stringFromJson) String? applicationId, String? applicationStatus,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? applicationCreatedAt, bool canViewApplicationDetail, String? clientName, double? contractAmount,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? contractStartDate, bool hasContract, int unreadMessagesCount
});




}
/// @nodoc
class __$FreelancerWorkItemModelCopyWithImpl<$Res>
    implements _$FreelancerWorkItemModelCopyWith<$Res> {
  __$FreelancerWorkItemModelCopyWithImpl(this._self, this._then);

  final _FreelancerWorkItemModel _self;
  final $Res Function(_FreelancerWorkItemModel) _then;

/// Create a copy of FreelancerWorkItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? location = null,Object? status = null,Object? displayStatus = null,Object? price = freezed,Object? priceMode = null,Object? photosCount = null,Object? applicationsCount = null,Object? coverPhotoUrl = freezed,Object? createdAt = null,Object? applicationId = freezed,Object? applicationStatus = freezed,Object? applicationCreatedAt = freezed,Object? canViewApplicationDetail = null,Object? clientName = freezed,Object? contractAmount = freezed,Object? contractStartDate = freezed,Object? hasContract = null,Object? unreadMessagesCount = null,}) {
  return _then(_FreelancerWorkItemModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayStatus: null == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceMode: null == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String,photosCount: null == photosCount ? _self.photosCount : photosCount // ignore: cast_nullable_to_non_nullable
as int,applicationsCount: null == applicationsCount ? _self.applicationsCount : applicationsCount // ignore: cast_nullable_to_non_nullable
as int,coverPhotoUrl: freezed == coverPhotoUrl ? _self.coverPhotoUrl : coverPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,applicationStatus: freezed == applicationStatus ? _self.applicationStatus : applicationStatus // ignore: cast_nullable_to_non_nullable
as String?,applicationCreatedAt: freezed == applicationCreatedAt ? _self.applicationCreatedAt : applicationCreatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,canViewApplicationDetail: null == canViewApplicationDetail ? _self.canViewApplicationDetail : canViewApplicationDetail // ignore: cast_nullable_to_non_nullable
as bool,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,contractAmount: freezed == contractAmount ? _self.contractAmount : contractAmount // ignore: cast_nullable_to_non_nullable
as double?,contractStartDate: freezed == contractStartDate ? _self.contractStartDate : contractStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,hasContract: null == hasContract ? _self.hasContract : hasContract // ignore: cast_nullable_to_non_nullable
as bool,unreadMessagesCount: null == unreadMessagesCount ? _self.unreadMessagesCount : unreadMessagesCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
