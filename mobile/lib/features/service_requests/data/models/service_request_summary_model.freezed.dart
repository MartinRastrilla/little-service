// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceRequestSummaryModel {

@JsonKey(fromJson: stringFromJson) String get id; String get title; String get description; String get location; String get status; String get displayStatus; double? get price;@JsonKey(fromJson: stringFromJson) String get clientId;@JsonKey(fromJson: stringFromJson) String? get freelancerPickedId; int get photosCount; String? get contractStatus; String? get coverPhotoUrl;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get createdAt;
/// Create a copy of ServiceRequestSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestSummaryModelCopyWith<ServiceRequestSummaryModel> get copyWith => _$ServiceRequestSummaryModelCopyWithImpl<ServiceRequestSummaryModel>(this as ServiceRequestSummaryModel, _$identity);

  /// Serializes this ServiceRequestSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestSummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus)&&(identical(other.price, price) || other.price == price)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.freelancerPickedId, freelancerPickedId) || other.freelancerPickedId == freelancerPickedId)&&(identical(other.photosCount, photosCount) || other.photosCount == photosCount)&&(identical(other.contractStatus, contractStatus) || other.contractStatus == contractStatus)&&(identical(other.coverPhotoUrl, coverPhotoUrl) || other.coverPhotoUrl == coverPhotoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,location,status,displayStatus,price,clientId,freelancerPickedId,photosCount,contractStatus,coverPhotoUrl,createdAt);

@override
String toString() {
  return 'ServiceRequestSummaryModel(id: $id, title: $title, description: $description, location: $location, status: $status, displayStatus: $displayStatus, price: $price, clientId: $clientId, freelancerPickedId: $freelancerPickedId, photosCount: $photosCount, contractStatus: $contractStatus, coverPhotoUrl: $coverPhotoUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestSummaryModelCopyWith<$Res>  {
  factory $ServiceRequestSummaryModelCopyWith(ServiceRequestSummaryModel value, $Res Function(ServiceRequestSummaryModel) _then) = _$ServiceRequestSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String title, String description, String location, String status, String displayStatus, double? price,@JsonKey(fromJson: stringFromJson) String clientId,@JsonKey(fromJson: stringFromJson) String? freelancerPickedId, int photosCount, String? contractStatus, String? coverPhotoUrl,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt
});




}
/// @nodoc
class _$ServiceRequestSummaryModelCopyWithImpl<$Res>
    implements $ServiceRequestSummaryModelCopyWith<$Res> {
  _$ServiceRequestSummaryModelCopyWithImpl(this._self, this._then);

  final ServiceRequestSummaryModel _self;
  final $Res Function(ServiceRequestSummaryModel) _then;

/// Create a copy of ServiceRequestSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? location = null,Object? status = null,Object? displayStatus = null,Object? price = freezed,Object? clientId = null,Object? freelancerPickedId = freezed,Object? photosCount = null,Object? contractStatus = freezed,Object? coverPhotoUrl = freezed,Object? createdAt = null,}) {
  return _then(ServiceRequestSummaryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayStatus: null == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,freelancerPickedId: freezed == freelancerPickedId ? _self.freelancerPickedId : freelancerPickedId // ignore: cast_nullable_to_non_nullable
as String?,photosCount: null == photosCount ? _self.photosCount : photosCount // ignore: cast_nullable_to_non_nullable
as int,contractStatus: freezed == contractStatus ? _self.contractStatus : contractStatus // ignore: cast_nullable_to_non_nullable
as String?,coverPhotoUrl: freezed == coverPhotoUrl ? _self.coverPhotoUrl : coverPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestSummaryModel].
extension ServiceRequestSummaryModelPatterns on ServiceRequestSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  String location,  String status,  String displayStatus,  double? price, @JsonKey(fromJson: stringFromJson)  String clientId, @JsonKey(fromJson: stringFromJson)  String? freelancerPickedId,  int photosCount,  String? contractStatus,  String? coverPhotoUrl, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestSummaryModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.location,_that.status,_that.displayStatus,_that.price,_that.clientId,_that.freelancerPickedId,_that.photosCount,_that.contractStatus,_that.coverPhotoUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  String location,  String status,  String displayStatus,  double? price, @JsonKey(fromJson: stringFromJson)  String clientId, @JsonKey(fromJson: stringFromJson)  String? freelancerPickedId,  int photosCount,  String? contractStatus,  String? coverPhotoUrl, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestSummaryModel():
return $default(_that.id,_that.title,_that.description,_that.location,_that.status,_that.displayStatus,_that.price,_that.clientId,_that.freelancerPickedId,_that.photosCount,_that.contractStatus,_that.coverPhotoUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  String location,  String status,  String displayStatus,  double? price, @JsonKey(fromJson: stringFromJson)  String clientId, @JsonKey(fromJson: stringFromJson)  String? freelancerPickedId,  int photosCount,  String? contractStatus,  String? coverPhotoUrl, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestSummaryModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.location,_that.status,_that.displayStatus,_that.price,_that.clientId,_that.freelancerPickedId,_that.photosCount,_that.contractStatus,_that.coverPhotoUrl,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestSummaryModel extends ServiceRequestSummaryModel {
  const _ServiceRequestSummaryModel({@JsonKey(fromJson: stringFromJson) required this.id, required this.title, required this.description, required this.location, required this.status, required this.displayStatus, this.price, @JsonKey(fromJson: stringFromJson) required this.clientId, @JsonKey(fromJson: stringFromJson) this.freelancerPickedId, this.photosCount = 0, this.contractStatus, this.coverPhotoUrl, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.createdAt}): super._();
  factory _ServiceRequestSummaryModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestSummaryModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override final  String title;
@override final  String description;
@override final  String location;
@override final  String status;
@override final  String displayStatus;
@override final  double? price;
@override@JsonKey(fromJson: stringFromJson) final  String clientId;
@override@JsonKey(fromJson: stringFromJson) final  String? freelancerPickedId;
@override@JsonKey() final  int photosCount;
@override final  String? contractStatus;
@override final  String? coverPhotoUrl;
@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime createdAt;

/// Create a copy of ServiceRequestSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestSummaryModelCopyWith<_ServiceRequestSummaryModel> get copyWith => __$ServiceRequestSummaryModelCopyWithImpl<_ServiceRequestSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestSummaryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus)&&(identical(other.price, price) || other.price == price)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.freelancerPickedId, freelancerPickedId) || other.freelancerPickedId == freelancerPickedId)&&(identical(other.photosCount, photosCount) || other.photosCount == photosCount)&&(identical(other.contractStatus, contractStatus) || other.contractStatus == contractStatus)&&(identical(other.coverPhotoUrl, coverPhotoUrl) || other.coverPhotoUrl == coverPhotoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,location,status,displayStatus,price,clientId,freelancerPickedId,photosCount,contractStatus,coverPhotoUrl,createdAt);

@override
String toString() {
  return 'ServiceRequestSummaryModel(id: $id, title: $title, description: $description, location: $location, status: $status, displayStatus: $displayStatus, price: $price, clientId: $clientId, freelancerPickedId: $freelancerPickedId, photosCount: $photosCount, contractStatus: $contractStatus, coverPhotoUrl: $coverPhotoUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestSummaryModelCopyWith<$Res> implements $ServiceRequestSummaryModelCopyWith<$Res> {
  factory _$ServiceRequestSummaryModelCopyWith(_ServiceRequestSummaryModel value, $Res Function(_ServiceRequestSummaryModel) _then) = __$ServiceRequestSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String title, String description, String location, String status, String displayStatus, double? price,@JsonKey(fromJson: stringFromJson) String clientId,@JsonKey(fromJson: stringFromJson) String? freelancerPickedId, int photosCount, String? contractStatus, String? coverPhotoUrl,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt
});




}
/// @nodoc
class __$ServiceRequestSummaryModelCopyWithImpl<$Res>
    implements _$ServiceRequestSummaryModelCopyWith<$Res> {
  __$ServiceRequestSummaryModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestSummaryModel _self;
  final $Res Function(_ServiceRequestSummaryModel) _then;

/// Create a copy of ServiceRequestSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? location = null,Object? status = null,Object? displayStatus = null,Object? price = freezed,Object? clientId = null,Object? freelancerPickedId = freezed,Object? photosCount = null,Object? contractStatus = freezed,Object? coverPhotoUrl = freezed,Object? createdAt = null,}) {
  return _then(_ServiceRequestSummaryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayStatus: null == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,freelancerPickedId: freezed == freelancerPickedId ? _self.freelancerPickedId : freelancerPickedId // ignore: cast_nullable_to_non_nullable
as String?,photosCount: null == photosCount ? _self.photosCount : photosCount // ignore: cast_nullable_to_non_nullable
as int,contractStatus: freezed == contractStatus ? _self.contractStatus : contractStatus // ignore: cast_nullable_to_non_nullable
as String?,coverPhotoUrl: freezed == coverPhotoUrl ? _self.coverPhotoUrl : coverPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
