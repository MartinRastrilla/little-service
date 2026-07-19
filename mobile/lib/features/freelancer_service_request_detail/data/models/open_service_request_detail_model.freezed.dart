// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_service_request_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpenServiceRequestClientSummaryModel {

@JsonKey(fromJson: stringFromJson) String get clientId; String get clientName; String? get clientProfilePictureUrl; String get ratingLabel; int get publishedJobsCount;
/// Create a copy of OpenServiceRequestClientSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenServiceRequestClientSummaryModelCopyWith<OpenServiceRequestClientSummaryModel> get copyWith => _$OpenServiceRequestClientSummaryModelCopyWithImpl<OpenServiceRequestClientSummaryModel>(this as OpenServiceRequestClientSummaryModel, _$identity);

  /// Serializes this OpenServiceRequestClientSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenServiceRequestClientSummaryModel&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientProfilePictureUrl, clientProfilePictureUrl) || other.clientProfilePictureUrl == clientProfilePictureUrl)&&(identical(other.ratingLabel, ratingLabel) || other.ratingLabel == ratingLabel)&&(identical(other.publishedJobsCount, publishedJobsCount) || other.publishedJobsCount == publishedJobsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,clientName,clientProfilePictureUrl,ratingLabel,publishedJobsCount);

@override
String toString() {
  return 'OpenServiceRequestClientSummaryModel(clientId: $clientId, clientName: $clientName, clientProfilePictureUrl: $clientProfilePictureUrl, ratingLabel: $ratingLabel, publishedJobsCount: $publishedJobsCount)';
}


}

/// @nodoc
abstract mixin class $OpenServiceRequestClientSummaryModelCopyWith<$Res>  {
  factory $OpenServiceRequestClientSummaryModelCopyWith(OpenServiceRequestClientSummaryModel value, $Res Function(OpenServiceRequestClientSummaryModel) _then) = _$OpenServiceRequestClientSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String clientId, String clientName, String? clientProfilePictureUrl, String ratingLabel, int publishedJobsCount
});




}
/// @nodoc
class _$OpenServiceRequestClientSummaryModelCopyWithImpl<$Res>
    implements $OpenServiceRequestClientSummaryModelCopyWith<$Res> {
  _$OpenServiceRequestClientSummaryModelCopyWithImpl(this._self, this._then);

  final OpenServiceRequestClientSummaryModel _self;
  final $Res Function(OpenServiceRequestClientSummaryModel) _then;

/// Create a copy of OpenServiceRequestClientSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? clientName = null,Object? clientProfilePictureUrl = freezed,Object? ratingLabel = null,Object? publishedJobsCount = null,}) {
  return _then(OpenServiceRequestClientSummaryModel(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,clientProfilePictureUrl: freezed == clientProfilePictureUrl ? _self.clientProfilePictureUrl : clientProfilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,ratingLabel: null == ratingLabel ? _self.ratingLabel : ratingLabel // ignore: cast_nullable_to_non_nullable
as String,publishedJobsCount: null == publishedJobsCount ? _self.publishedJobsCount : publishedJobsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenServiceRequestClientSummaryModel].
extension OpenServiceRequestClientSummaryModelPatterns on OpenServiceRequestClientSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenServiceRequestClientSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenServiceRequestClientSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenServiceRequestClientSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _OpenServiceRequestClientSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenServiceRequestClientSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _OpenServiceRequestClientSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String clientId,  String clientName,  String? clientProfilePictureUrl,  String ratingLabel,  int publishedJobsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenServiceRequestClientSummaryModel() when $default != null:
return $default(_that.clientId,_that.clientName,_that.clientProfilePictureUrl,_that.ratingLabel,_that.publishedJobsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String clientId,  String clientName,  String? clientProfilePictureUrl,  String ratingLabel,  int publishedJobsCount)  $default,) {final _that = this;
switch (_that) {
case _OpenServiceRequestClientSummaryModel():
return $default(_that.clientId,_that.clientName,_that.clientProfilePictureUrl,_that.ratingLabel,_that.publishedJobsCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String clientId,  String clientName,  String? clientProfilePictureUrl,  String ratingLabel,  int publishedJobsCount)?  $default,) {final _that = this;
switch (_that) {
case _OpenServiceRequestClientSummaryModel() when $default != null:
return $default(_that.clientId,_that.clientName,_that.clientProfilePictureUrl,_that.ratingLabel,_that.publishedJobsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenServiceRequestClientSummaryModel extends OpenServiceRequestClientSummaryModel {
  const _OpenServiceRequestClientSummaryModel({@JsonKey(fromJson: stringFromJson) required this.clientId, required this.clientName, this.clientProfilePictureUrl, required this.ratingLabel, this.publishedJobsCount = 0}): super._();
  factory _OpenServiceRequestClientSummaryModel.fromJson(Map<String, dynamic> json) => _$OpenServiceRequestClientSummaryModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String clientId;
@override final  String clientName;
@override final  String? clientProfilePictureUrl;
@override final  String ratingLabel;
@override@JsonKey() final  int publishedJobsCount;

/// Create a copy of OpenServiceRequestClientSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenServiceRequestClientSummaryModelCopyWith<_OpenServiceRequestClientSummaryModel> get copyWith => __$OpenServiceRequestClientSummaryModelCopyWithImpl<_OpenServiceRequestClientSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenServiceRequestClientSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenServiceRequestClientSummaryModel&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientProfilePictureUrl, clientProfilePictureUrl) || other.clientProfilePictureUrl == clientProfilePictureUrl)&&(identical(other.ratingLabel, ratingLabel) || other.ratingLabel == ratingLabel)&&(identical(other.publishedJobsCount, publishedJobsCount) || other.publishedJobsCount == publishedJobsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,clientName,clientProfilePictureUrl,ratingLabel,publishedJobsCount);

@override
String toString() {
  return 'OpenServiceRequestClientSummaryModel(clientId: $clientId, clientName: $clientName, clientProfilePictureUrl: $clientProfilePictureUrl, ratingLabel: $ratingLabel, publishedJobsCount: $publishedJobsCount)';
}


}

/// @nodoc
abstract mixin class _$OpenServiceRequestClientSummaryModelCopyWith<$Res> implements $OpenServiceRequestClientSummaryModelCopyWith<$Res> {
  factory _$OpenServiceRequestClientSummaryModelCopyWith(_OpenServiceRequestClientSummaryModel value, $Res Function(_OpenServiceRequestClientSummaryModel) _then) = __$OpenServiceRequestClientSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String clientId, String clientName, String? clientProfilePictureUrl, String ratingLabel, int publishedJobsCount
});




}
/// @nodoc
class __$OpenServiceRequestClientSummaryModelCopyWithImpl<$Res>
    implements _$OpenServiceRequestClientSummaryModelCopyWith<$Res> {
  __$OpenServiceRequestClientSummaryModelCopyWithImpl(this._self, this._then);

  final _OpenServiceRequestClientSummaryModel _self;
  final $Res Function(_OpenServiceRequestClientSummaryModel) _then;

/// Create a copy of OpenServiceRequestClientSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? clientName = null,Object? clientProfilePictureUrl = freezed,Object? ratingLabel = null,Object? publishedJobsCount = null,}) {
  return _then(_OpenServiceRequestClientSummaryModel(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,clientProfilePictureUrl: freezed == clientProfilePictureUrl ? _self.clientProfilePictureUrl : clientProfilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,ratingLabel: null == ratingLabel ? _self.ratingLabel : ratingLabel // ignore: cast_nullable_to_non_nullable
as String,publishedJobsCount: null == publishedJobsCount ? _self.publishedJobsCount : publishedJobsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$OpenServiceRequestDetailPhotoModel {

@JsonKey(fromJson: stringFromJson) String get id;@JsonKey(name: 'filePath') String get url;
/// Create a copy of OpenServiceRequestDetailPhotoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenServiceRequestDetailPhotoModelCopyWith<OpenServiceRequestDetailPhotoModel> get copyWith => _$OpenServiceRequestDetailPhotoModelCopyWithImpl<OpenServiceRequestDetailPhotoModel>(this as OpenServiceRequestDetailPhotoModel, _$identity);

  /// Serializes this OpenServiceRequestDetailPhotoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenServiceRequestDetailPhotoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'OpenServiceRequestDetailPhotoModel(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class $OpenServiceRequestDetailPhotoModelCopyWith<$Res>  {
  factory $OpenServiceRequestDetailPhotoModelCopyWith(OpenServiceRequestDetailPhotoModel value, $Res Function(OpenServiceRequestDetailPhotoModel) _then) = _$OpenServiceRequestDetailPhotoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id,@JsonKey(name: 'filePath') String url
});




}
/// @nodoc
class _$OpenServiceRequestDetailPhotoModelCopyWithImpl<$Res>
    implements $OpenServiceRequestDetailPhotoModelCopyWith<$Res> {
  _$OpenServiceRequestDetailPhotoModelCopyWithImpl(this._self, this._then);

  final OpenServiceRequestDetailPhotoModel _self;
  final $Res Function(OpenServiceRequestDetailPhotoModel) _then;

/// Create a copy of OpenServiceRequestDetailPhotoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,}) {
  return _then(OpenServiceRequestDetailPhotoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenServiceRequestDetailPhotoModel].
extension OpenServiceRequestDetailPhotoModelPatterns on OpenServiceRequestDetailPhotoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenServiceRequestDetailPhotoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenServiceRequestDetailPhotoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenServiceRequestDetailPhotoModel value)  $default,){
final _that = this;
switch (_that) {
case _OpenServiceRequestDetailPhotoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenServiceRequestDetailPhotoModel value)?  $default,){
final _that = this;
switch (_that) {
case _OpenServiceRequestDetailPhotoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id, @JsonKey(name: 'filePath')  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenServiceRequestDetailPhotoModel() when $default != null:
return $default(_that.id,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id, @JsonKey(name: 'filePath')  String url)  $default,) {final _that = this;
switch (_that) {
case _OpenServiceRequestDetailPhotoModel():
return $default(_that.id,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String id, @JsonKey(name: 'filePath')  String url)?  $default,) {final _that = this;
switch (_that) {
case _OpenServiceRequestDetailPhotoModel() when $default != null:
return $default(_that.id,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenServiceRequestDetailPhotoModel extends OpenServiceRequestDetailPhotoModel {
  const _OpenServiceRequestDetailPhotoModel({@JsonKey(fromJson: stringFromJson) required this.id, @JsonKey(name: 'filePath') required this.url}): super._();
  factory _OpenServiceRequestDetailPhotoModel.fromJson(Map<String, dynamic> json) => _$OpenServiceRequestDetailPhotoModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override@JsonKey(name: 'filePath') final  String url;

/// Create a copy of OpenServiceRequestDetailPhotoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenServiceRequestDetailPhotoModelCopyWith<_OpenServiceRequestDetailPhotoModel> get copyWith => __$OpenServiceRequestDetailPhotoModelCopyWithImpl<_OpenServiceRequestDetailPhotoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenServiceRequestDetailPhotoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenServiceRequestDetailPhotoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url);

@override
String toString() {
  return 'OpenServiceRequestDetailPhotoModel(id: $id, url: $url)';
}


}

/// @nodoc
abstract mixin class _$OpenServiceRequestDetailPhotoModelCopyWith<$Res> implements $OpenServiceRequestDetailPhotoModelCopyWith<$Res> {
  factory _$OpenServiceRequestDetailPhotoModelCopyWith(_OpenServiceRequestDetailPhotoModel value, $Res Function(_OpenServiceRequestDetailPhotoModel) _then) = __$OpenServiceRequestDetailPhotoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id,@JsonKey(name: 'filePath') String url
});




}
/// @nodoc
class __$OpenServiceRequestDetailPhotoModelCopyWithImpl<$Res>
    implements _$OpenServiceRequestDetailPhotoModelCopyWith<$Res> {
  __$OpenServiceRequestDetailPhotoModelCopyWithImpl(this._self, this._then);

  final _OpenServiceRequestDetailPhotoModel _self;
  final $Res Function(_OpenServiceRequestDetailPhotoModel) _then;

/// Create a copy of OpenServiceRequestDetailPhotoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,}) {
  return _then(_OpenServiceRequestDetailPhotoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OpenServiceRequestDetailModel {

@JsonKey(fromJson: stringFromJson) String get id; String get title; String get description; String get location; String get status; String get displayStatus; double? get price; String get priceMode; int get photosCount; int get applicationsCount; List<OpenServiceRequestDetailPhotoModel> get photos;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get createdAt; bool get canApply; bool get hasApplied; String? get applicationStatus;@JsonKey(fromJson: stringFromJson) String? get applicationId; OpenServiceRequestClientSummaryModel get client;
/// Create a copy of OpenServiceRequestDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenServiceRequestDetailModelCopyWith<OpenServiceRequestDetailModel> get copyWith => _$OpenServiceRequestDetailModelCopyWithImpl<OpenServiceRequestDetailModel>(this as OpenServiceRequestDetailModel, _$identity);

  /// Serializes this OpenServiceRequestDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenServiceRequestDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.photosCount, photosCount) || other.photosCount == photosCount)&&(identical(other.applicationsCount, applicationsCount) || other.applicationsCount == applicationsCount)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.canApply, canApply) || other.canApply == canApply)&&(identical(other.hasApplied, hasApplied) || other.hasApplied == hasApplied)&&(identical(other.applicationStatus, applicationStatus) || other.applicationStatus == applicationStatus)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.client, client) || other.client == client));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,location,status,displayStatus,price,priceMode,photosCount,applicationsCount,const DeepCollectionEquality().hash(photos),createdAt,canApply,hasApplied,applicationStatus,applicationId,client);

@override
String toString() {
  return 'OpenServiceRequestDetailModel(id: $id, title: $title, description: $description, location: $location, status: $status, displayStatus: $displayStatus, price: $price, priceMode: $priceMode, photosCount: $photosCount, applicationsCount: $applicationsCount, photos: $photos, createdAt: $createdAt, canApply: $canApply, hasApplied: $hasApplied, applicationStatus: $applicationStatus, applicationId: $applicationId, client: $client)';
}


}

/// @nodoc
abstract mixin class $OpenServiceRequestDetailModelCopyWith<$Res>  {
  factory $OpenServiceRequestDetailModelCopyWith(OpenServiceRequestDetailModel value, $Res Function(OpenServiceRequestDetailModel) _then) = _$OpenServiceRequestDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String title, String description, String location, String status, String displayStatus, double? price, String priceMode, int photosCount, int applicationsCount, List<OpenServiceRequestDetailPhotoModel> photos,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt, bool canApply, bool hasApplied, String? applicationStatus,@JsonKey(fromJson: stringFromJson) String? applicationId, OpenServiceRequestClientSummaryModel client
});


$OpenServiceRequestClientSummaryModelCopyWith<$Res> get client;

}
/// @nodoc
class _$OpenServiceRequestDetailModelCopyWithImpl<$Res>
    implements $OpenServiceRequestDetailModelCopyWith<$Res> {
  _$OpenServiceRequestDetailModelCopyWithImpl(this._self, this._then);

  final OpenServiceRequestDetailModel _self;
  final $Res Function(OpenServiceRequestDetailModel) _then;

/// Create a copy of OpenServiceRequestDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? location = null,Object? status = null,Object? displayStatus = null,Object? price = freezed,Object? priceMode = null,Object? photosCount = null,Object? applicationsCount = null,Object? photos = null,Object? createdAt = null,Object? canApply = null,Object? hasApplied = null,Object? applicationStatus = freezed,Object? applicationId = freezed,Object? client = null,}) {
  return _then(OpenServiceRequestDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayStatus: null == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceMode: null == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String,photosCount: null == photosCount ? _self.photosCount : photosCount // ignore: cast_nullable_to_non_nullable
as int,applicationsCount: null == applicationsCount ? _self.applicationsCount : applicationsCount // ignore: cast_nullable_to_non_nullable
as int,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<OpenServiceRequestDetailPhotoModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,canApply: null == canApply ? _self.canApply : canApply // ignore: cast_nullable_to_non_nullable
as bool,hasApplied: null == hasApplied ? _self.hasApplied : hasApplied // ignore: cast_nullable_to_non_nullable
as bool,applicationStatus: freezed == applicationStatus ? _self.applicationStatus : applicationStatus // ignore: cast_nullable_to_non_nullable
as String?,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as OpenServiceRequestClientSummaryModel,
  ));
}
/// Create a copy of OpenServiceRequestDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpenServiceRequestClientSummaryModelCopyWith<$Res> get client {
  
  return $OpenServiceRequestClientSummaryModelCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}
}


/// Adds pattern-matching-related methods to [OpenServiceRequestDetailModel].
extension OpenServiceRequestDetailModelPatterns on OpenServiceRequestDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenServiceRequestDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenServiceRequestDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenServiceRequestDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _OpenServiceRequestDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenServiceRequestDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _OpenServiceRequestDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  String location,  String status,  String displayStatus,  double? price,  String priceMode,  int photosCount,  int applicationsCount,  List<OpenServiceRequestDetailPhotoModel> photos, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt,  bool canApply,  bool hasApplied,  String? applicationStatus, @JsonKey(fromJson: stringFromJson)  String? applicationId,  OpenServiceRequestClientSummaryModel client)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenServiceRequestDetailModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.location,_that.status,_that.displayStatus,_that.price,_that.priceMode,_that.photosCount,_that.applicationsCount,_that.photos,_that.createdAt,_that.canApply,_that.hasApplied,_that.applicationStatus,_that.applicationId,_that.client);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  String location,  String status,  String displayStatus,  double? price,  String priceMode,  int photosCount,  int applicationsCount,  List<OpenServiceRequestDetailPhotoModel> photos, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt,  bool canApply,  bool hasApplied,  String? applicationStatus, @JsonKey(fromJson: stringFromJson)  String? applicationId,  OpenServiceRequestClientSummaryModel client)  $default,) {final _that = this;
switch (_that) {
case _OpenServiceRequestDetailModel():
return $default(_that.id,_that.title,_that.description,_that.location,_that.status,_that.displayStatus,_that.price,_that.priceMode,_that.photosCount,_that.applicationsCount,_that.photos,_that.createdAt,_that.canApply,_that.hasApplied,_that.applicationStatus,_that.applicationId,_that.client);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  String location,  String status,  String displayStatus,  double? price,  String priceMode,  int photosCount,  int applicationsCount,  List<OpenServiceRequestDetailPhotoModel> photos, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt,  bool canApply,  bool hasApplied,  String? applicationStatus, @JsonKey(fromJson: stringFromJson)  String? applicationId,  OpenServiceRequestClientSummaryModel client)?  $default,) {final _that = this;
switch (_that) {
case _OpenServiceRequestDetailModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.location,_that.status,_that.displayStatus,_that.price,_that.priceMode,_that.photosCount,_that.applicationsCount,_that.photos,_that.createdAt,_that.canApply,_that.hasApplied,_that.applicationStatus,_that.applicationId,_that.client);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenServiceRequestDetailModel extends OpenServiceRequestDetailModel {
  const _OpenServiceRequestDetailModel({@JsonKey(fromJson: stringFromJson) required this.id, required this.title, required this.description, required this.location, required this.status, required this.displayStatus, this.price, required this.priceMode, this.photosCount = 0, this.applicationsCount = 0,  List<OpenServiceRequestDetailPhotoModel> photos = const [], @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.createdAt, this.canApply = false, this.hasApplied = false, this.applicationStatus, @JsonKey(fromJson: stringFromJson) this.applicationId, required this.client}): _photos = photos,super._();
  factory _OpenServiceRequestDetailModel.fromJson(Map<String, dynamic> json) => _$OpenServiceRequestDetailModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override final  String title;
@override final  String description;
@override final  String location;
@override final  String status;
@override final  String displayStatus;
@override final  double? price;
@override final  String priceMode;
@override@JsonKey() final  int photosCount;
@override@JsonKey() final  int applicationsCount;
 final  List<OpenServiceRequestDetailPhotoModel> _photos;
@override@JsonKey() List<OpenServiceRequestDetailPhotoModel> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime createdAt;
@override@JsonKey() final  bool canApply;
@override@JsonKey() final  bool hasApplied;
@override final  String? applicationStatus;
@override@JsonKey(fromJson: stringFromJson) final  String? applicationId;
@override final  OpenServiceRequestClientSummaryModel client;

/// Create a copy of OpenServiceRequestDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenServiceRequestDetailModelCopyWith<_OpenServiceRequestDetailModel> get copyWith => __$OpenServiceRequestDetailModelCopyWithImpl<_OpenServiceRequestDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenServiceRequestDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenServiceRequestDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.photosCount, photosCount) || other.photosCount == photosCount)&&(identical(other.applicationsCount, applicationsCount) || other.applicationsCount == applicationsCount)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.canApply, canApply) || other.canApply == canApply)&&(identical(other.hasApplied, hasApplied) || other.hasApplied == hasApplied)&&(identical(other.applicationStatus, applicationStatus) || other.applicationStatus == applicationStatus)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.client, client) || other.client == client));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,location,status,displayStatus,price,priceMode,photosCount,applicationsCount,const DeepCollectionEquality().hash(_photos),createdAt,canApply,hasApplied,applicationStatus,applicationId,client);

@override
String toString() {
  return 'OpenServiceRequestDetailModel(id: $id, title: $title, description: $description, location: $location, status: $status, displayStatus: $displayStatus, price: $price, priceMode: $priceMode, photosCount: $photosCount, applicationsCount: $applicationsCount, photos: $photos, createdAt: $createdAt, canApply: $canApply, hasApplied: $hasApplied, applicationStatus: $applicationStatus, applicationId: $applicationId, client: $client)';
}


}

/// @nodoc
abstract mixin class _$OpenServiceRequestDetailModelCopyWith<$Res> implements $OpenServiceRequestDetailModelCopyWith<$Res> {
  factory _$OpenServiceRequestDetailModelCopyWith(_OpenServiceRequestDetailModel value, $Res Function(_OpenServiceRequestDetailModel) _then) = __$OpenServiceRequestDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String title, String description, String location, String status, String displayStatus, double? price, String priceMode, int photosCount, int applicationsCount, List<OpenServiceRequestDetailPhotoModel> photos,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt, bool canApply, bool hasApplied, String? applicationStatus,@JsonKey(fromJson: stringFromJson) String? applicationId, OpenServiceRequestClientSummaryModel client
});


@override $OpenServiceRequestClientSummaryModelCopyWith<$Res> get client;

}
/// @nodoc
class __$OpenServiceRequestDetailModelCopyWithImpl<$Res>
    implements _$OpenServiceRequestDetailModelCopyWith<$Res> {
  __$OpenServiceRequestDetailModelCopyWithImpl(this._self, this._then);

  final _OpenServiceRequestDetailModel _self;
  final $Res Function(_OpenServiceRequestDetailModel) _then;

/// Create a copy of OpenServiceRequestDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? location = null,Object? status = null,Object? displayStatus = null,Object? price = freezed,Object? priceMode = null,Object? photosCount = null,Object? applicationsCount = null,Object? photos = null,Object? createdAt = null,Object? canApply = null,Object? hasApplied = null,Object? applicationStatus = freezed,Object? applicationId = freezed,Object? client = null,}) {
  return _then(_OpenServiceRequestDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayStatus: null == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceMode: null == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String,photosCount: null == photosCount ? _self.photosCount : photosCount // ignore: cast_nullable_to_non_nullable
as int,applicationsCount: null == applicationsCount ? _self.applicationsCount : applicationsCount // ignore: cast_nullable_to_non_nullable
as int,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<OpenServiceRequestDetailPhotoModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,canApply: null == canApply ? _self.canApply : canApply // ignore: cast_nullable_to_non_nullable
as bool,hasApplied: null == hasApplied ? _self.hasApplied : hasApplied // ignore: cast_nullable_to_non_nullable
as bool,applicationStatus: freezed == applicationStatus ? _self.applicationStatus : applicationStatus // ignore: cast_nullable_to_non_nullable
as String?,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as OpenServiceRequestClientSummaryModel,
  ));
}

/// Create a copy of OpenServiceRequestDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpenServiceRequestClientSummaryModelCopyWith<$Res> get client {
  
  return $OpenServiceRequestClientSummaryModelCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}
}

// dart format on
