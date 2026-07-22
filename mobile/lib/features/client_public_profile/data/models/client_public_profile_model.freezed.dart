// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_public_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientReviewPreviewModel {

@JsonKey(fromJson: stringFromJson) String get id; String get reviewerName; String? get reviewerProfilePictureUrl; int get rating; String? get comment; String get serviceRequestTitle;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get createdAt;
/// Create a copy of ClientReviewPreviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientReviewPreviewModelCopyWith<ClientReviewPreviewModel> get copyWith => _$ClientReviewPreviewModelCopyWithImpl<ClientReviewPreviewModel>(this as ClientReviewPreviewModel, _$identity);

  /// Serializes this ClientReviewPreviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientReviewPreviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reviewerName, reviewerName) || other.reviewerName == reviewerName)&&(identical(other.reviewerProfilePictureUrl, reviewerProfilePictureUrl) || other.reviewerProfilePictureUrl == reviewerProfilePictureUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.serviceRequestTitle, serviceRequestTitle) || other.serviceRequestTitle == serviceRequestTitle)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reviewerName,reviewerProfilePictureUrl,rating,comment,serviceRequestTitle,createdAt);

@override
String toString() {
  return 'ClientReviewPreviewModel(id: $id, reviewerName: $reviewerName, reviewerProfilePictureUrl: $reviewerProfilePictureUrl, rating: $rating, comment: $comment, serviceRequestTitle: $serviceRequestTitle, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ClientReviewPreviewModelCopyWith<$Res>  {
  factory $ClientReviewPreviewModelCopyWith(ClientReviewPreviewModel value, $Res Function(ClientReviewPreviewModel) _then) = _$ClientReviewPreviewModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String reviewerName, String? reviewerProfilePictureUrl, int rating, String? comment, String serviceRequestTitle,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt
});




}
/// @nodoc
class _$ClientReviewPreviewModelCopyWithImpl<$Res>
    implements $ClientReviewPreviewModelCopyWith<$Res> {
  _$ClientReviewPreviewModelCopyWithImpl(this._self, this._then);

  final ClientReviewPreviewModel _self;
  final $Res Function(ClientReviewPreviewModel) _then;

/// Create a copy of ClientReviewPreviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reviewerName = null,Object? reviewerProfilePictureUrl = freezed,Object? rating = null,Object? comment = freezed,Object? serviceRequestTitle = null,Object? createdAt = null,}) {
  return _then(ClientReviewPreviewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reviewerName: null == reviewerName ? _self.reviewerName : reviewerName // ignore: cast_nullable_to_non_nullable
as String,reviewerProfilePictureUrl: freezed == reviewerProfilePictureUrl ? _self.reviewerProfilePictureUrl : reviewerProfilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,serviceRequestTitle: null == serviceRequestTitle ? _self.serviceRequestTitle : serviceRequestTitle // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientReviewPreviewModel].
extension ClientReviewPreviewModelPatterns on ClientReviewPreviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientReviewPreviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientReviewPreviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientReviewPreviewModel value)  $default,){
final _that = this;
switch (_that) {
case _ClientReviewPreviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientReviewPreviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClientReviewPreviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String reviewerName,  String? reviewerProfilePictureUrl,  int rating,  String? comment,  String serviceRequestTitle, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientReviewPreviewModel() when $default != null:
return $default(_that.id,_that.reviewerName,_that.reviewerProfilePictureUrl,_that.rating,_that.comment,_that.serviceRequestTitle,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String reviewerName,  String? reviewerProfilePictureUrl,  int rating,  String? comment,  String serviceRequestTitle, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ClientReviewPreviewModel():
return $default(_that.id,_that.reviewerName,_that.reviewerProfilePictureUrl,_that.rating,_that.comment,_that.serviceRequestTitle,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String id,  String reviewerName,  String? reviewerProfilePictureUrl,  int rating,  String? comment,  String serviceRequestTitle, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ClientReviewPreviewModel() when $default != null:
return $default(_that.id,_that.reviewerName,_that.reviewerProfilePictureUrl,_that.rating,_that.comment,_that.serviceRequestTitle,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientReviewPreviewModel extends ClientReviewPreviewModel {
  const _ClientReviewPreviewModel({@JsonKey(fromJson: stringFromJson) required this.id, required this.reviewerName, this.reviewerProfilePictureUrl, required this.rating, this.comment, required this.serviceRequestTitle, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.createdAt}): super._();
  factory _ClientReviewPreviewModel.fromJson(Map<String, dynamic> json) => _$ClientReviewPreviewModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override final  String reviewerName;
@override final  String? reviewerProfilePictureUrl;
@override final  int rating;
@override final  String? comment;
@override final  String serviceRequestTitle;
@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime createdAt;

/// Create a copy of ClientReviewPreviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientReviewPreviewModelCopyWith<_ClientReviewPreviewModel> get copyWith => __$ClientReviewPreviewModelCopyWithImpl<_ClientReviewPreviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientReviewPreviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientReviewPreviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reviewerName, reviewerName) || other.reviewerName == reviewerName)&&(identical(other.reviewerProfilePictureUrl, reviewerProfilePictureUrl) || other.reviewerProfilePictureUrl == reviewerProfilePictureUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.serviceRequestTitle, serviceRequestTitle) || other.serviceRequestTitle == serviceRequestTitle)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reviewerName,reviewerProfilePictureUrl,rating,comment,serviceRequestTitle,createdAt);

@override
String toString() {
  return 'ClientReviewPreviewModel(id: $id, reviewerName: $reviewerName, reviewerProfilePictureUrl: $reviewerProfilePictureUrl, rating: $rating, comment: $comment, serviceRequestTitle: $serviceRequestTitle, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ClientReviewPreviewModelCopyWith<$Res> implements $ClientReviewPreviewModelCopyWith<$Res> {
  factory _$ClientReviewPreviewModelCopyWith(_ClientReviewPreviewModel value, $Res Function(_ClientReviewPreviewModel) _then) = __$ClientReviewPreviewModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String reviewerName, String? reviewerProfilePictureUrl, int rating, String? comment, String serviceRequestTitle,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt
});




}
/// @nodoc
class __$ClientReviewPreviewModelCopyWithImpl<$Res>
    implements _$ClientReviewPreviewModelCopyWith<$Res> {
  __$ClientReviewPreviewModelCopyWithImpl(this._self, this._then);

  final _ClientReviewPreviewModel _self;
  final $Res Function(_ClientReviewPreviewModel) _then;

/// Create a copy of ClientReviewPreviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reviewerName = null,Object? reviewerProfilePictureUrl = freezed,Object? rating = null,Object? comment = freezed,Object? serviceRequestTitle = null,Object? createdAt = null,}) {
  return _then(_ClientReviewPreviewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,reviewerName: null == reviewerName ? _self.reviewerName : reviewerName // ignore: cast_nullable_to_non_nullable
as String,reviewerProfilePictureUrl: freezed == reviewerProfilePictureUrl ? _self.reviewerProfilePictureUrl : reviewerProfilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,serviceRequestTitle: null == serviceRequestTitle ? _self.serviceRequestTitle : serviceRequestTitle // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ClientPublicProfileModel {

@JsonKey(fromJson: stringFromJson) String get clientId; String get fullName; String? get profilePictureUrl; bool get isVerified; bool get isEmailVerified;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get memberSince; double get averageRating; int get totalReviewsCount; int get publishedJobsCount; String? get location; bool get hasReports; List<ClientReviewPreviewModel> get recentReviews;
/// Create a copy of ClientPublicProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientPublicProfileModelCopyWith<ClientPublicProfileModel> get copyWith => _$ClientPublicProfileModelCopyWithImpl<ClientPublicProfileModel>(this as ClientPublicProfileModel, _$identity);

  /// Serializes this ClientPublicProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientPublicProfileModel&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.profilePictureUrl, profilePictureUrl) || other.profilePictureUrl == profilePictureUrl)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviewsCount, totalReviewsCount) || other.totalReviewsCount == totalReviewsCount)&&(identical(other.publishedJobsCount, publishedJobsCount) || other.publishedJobsCount == publishedJobsCount)&&(identical(other.location, location) || other.location == location)&&(identical(other.hasReports, hasReports) || other.hasReports == hasReports)&&const DeepCollectionEquality().equals(other.recentReviews, recentReviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,fullName,profilePictureUrl,isVerified,isEmailVerified,memberSince,averageRating,totalReviewsCount,publishedJobsCount,location,hasReports,const DeepCollectionEquality().hash(recentReviews));

@override
String toString() {
  return 'ClientPublicProfileModel(clientId: $clientId, fullName: $fullName, profilePictureUrl: $profilePictureUrl, isVerified: $isVerified, isEmailVerified: $isEmailVerified, memberSince: $memberSince, averageRating: $averageRating, totalReviewsCount: $totalReviewsCount, publishedJobsCount: $publishedJobsCount, location: $location, hasReports: $hasReports, recentReviews: $recentReviews)';
}


}

/// @nodoc
abstract mixin class $ClientPublicProfileModelCopyWith<$Res>  {
  factory $ClientPublicProfileModelCopyWith(ClientPublicProfileModel value, $Res Function(ClientPublicProfileModel) _then) = _$ClientPublicProfileModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String clientId, String fullName, String? profilePictureUrl, bool isVerified, bool isEmailVerified,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime memberSince, double averageRating, int totalReviewsCount, int publishedJobsCount, String? location, bool hasReports, List<ClientReviewPreviewModel> recentReviews
});




}
/// @nodoc
class _$ClientPublicProfileModelCopyWithImpl<$Res>
    implements $ClientPublicProfileModelCopyWith<$Res> {
  _$ClientPublicProfileModelCopyWithImpl(this._self, this._then);

  final ClientPublicProfileModel _self;
  final $Res Function(ClientPublicProfileModel) _then;

/// Create a copy of ClientPublicProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? fullName = null,Object? profilePictureUrl = freezed,Object? isVerified = null,Object? isEmailVerified = null,Object? memberSince = null,Object? averageRating = null,Object? totalReviewsCount = null,Object? publishedJobsCount = null,Object? location = freezed,Object? hasReports = null,Object? recentReviews = null,}) {
  return _then(ClientPublicProfileModel(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,profilePictureUrl: freezed == profilePictureUrl ? _self.profilePictureUrl : profilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isEmailVerified: null == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool,memberSince: null == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as DateTime,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviewsCount: null == totalReviewsCount ? _self.totalReviewsCount : totalReviewsCount // ignore: cast_nullable_to_non_nullable
as int,publishedJobsCount: null == publishedJobsCount ? _self.publishedJobsCount : publishedJobsCount // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,hasReports: null == hasReports ? _self.hasReports : hasReports // ignore: cast_nullable_to_non_nullable
as bool,recentReviews: null == recentReviews ? _self.recentReviews : recentReviews // ignore: cast_nullable_to_non_nullable
as List<ClientReviewPreviewModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientPublicProfileModel].
extension ClientPublicProfileModelPatterns on ClientPublicProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientPublicProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientPublicProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientPublicProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ClientPublicProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientPublicProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClientPublicProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String clientId,  String fullName,  String? profilePictureUrl,  bool isVerified,  bool isEmailVerified, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime memberSince,  double averageRating,  int totalReviewsCount,  int publishedJobsCount,  String? location,  bool hasReports,  List<ClientReviewPreviewModel> recentReviews)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientPublicProfileModel() when $default != null:
return $default(_that.clientId,_that.fullName,_that.profilePictureUrl,_that.isVerified,_that.isEmailVerified,_that.memberSince,_that.averageRating,_that.totalReviewsCount,_that.publishedJobsCount,_that.location,_that.hasReports,_that.recentReviews);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String clientId,  String fullName,  String? profilePictureUrl,  bool isVerified,  bool isEmailVerified, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime memberSince,  double averageRating,  int totalReviewsCount,  int publishedJobsCount,  String? location,  bool hasReports,  List<ClientReviewPreviewModel> recentReviews)  $default,) {final _that = this;
switch (_that) {
case _ClientPublicProfileModel():
return $default(_that.clientId,_that.fullName,_that.profilePictureUrl,_that.isVerified,_that.isEmailVerified,_that.memberSince,_that.averageRating,_that.totalReviewsCount,_that.publishedJobsCount,_that.location,_that.hasReports,_that.recentReviews);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String clientId,  String fullName,  String? profilePictureUrl,  bool isVerified,  bool isEmailVerified, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime memberSince,  double averageRating,  int totalReviewsCount,  int publishedJobsCount,  String? location,  bool hasReports,  List<ClientReviewPreviewModel> recentReviews)?  $default,) {final _that = this;
switch (_that) {
case _ClientPublicProfileModel() when $default != null:
return $default(_that.clientId,_that.fullName,_that.profilePictureUrl,_that.isVerified,_that.isEmailVerified,_that.memberSince,_that.averageRating,_that.totalReviewsCount,_that.publishedJobsCount,_that.location,_that.hasReports,_that.recentReviews);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientPublicProfileModel extends ClientPublicProfileModel {
  const _ClientPublicProfileModel({@JsonKey(fromJson: stringFromJson) required this.clientId, required this.fullName, this.profilePictureUrl, this.isVerified = false, this.isEmailVerified = false, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.memberSince, this.averageRating = 0, this.totalReviewsCount = 0, this.publishedJobsCount = 0, this.location, this.hasReports = false,  List<ClientReviewPreviewModel> recentReviews = const []}): _recentReviews = recentReviews,super._();
  factory _ClientPublicProfileModel.fromJson(Map<String, dynamic> json) => _$ClientPublicProfileModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String clientId;
@override final  String fullName;
@override final  String? profilePictureUrl;
@override@JsonKey() final  bool isVerified;
@override@JsonKey() final  bool isEmailVerified;
@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime memberSince;
@override@JsonKey() final  double averageRating;
@override@JsonKey() final  int totalReviewsCount;
@override@JsonKey() final  int publishedJobsCount;
@override final  String? location;
@override@JsonKey() final  bool hasReports;
 final  List<ClientReviewPreviewModel> _recentReviews;
@override@JsonKey() List<ClientReviewPreviewModel> get recentReviews {
  if (_recentReviews is EqualUnmodifiableListView) return _recentReviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentReviews);
}


/// Create a copy of ClientPublicProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientPublicProfileModelCopyWith<_ClientPublicProfileModel> get copyWith => __$ClientPublicProfileModelCopyWithImpl<_ClientPublicProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientPublicProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientPublicProfileModel&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.profilePictureUrl, profilePictureUrl) || other.profilePictureUrl == profilePictureUrl)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviewsCount, totalReviewsCount) || other.totalReviewsCount == totalReviewsCount)&&(identical(other.publishedJobsCount, publishedJobsCount) || other.publishedJobsCount == publishedJobsCount)&&(identical(other.location, location) || other.location == location)&&(identical(other.hasReports, hasReports) || other.hasReports == hasReports)&&const DeepCollectionEquality().equals(other._recentReviews, _recentReviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,fullName,profilePictureUrl,isVerified,isEmailVerified,memberSince,averageRating,totalReviewsCount,publishedJobsCount,location,hasReports,const DeepCollectionEquality().hash(_recentReviews));

@override
String toString() {
  return 'ClientPublicProfileModel(clientId: $clientId, fullName: $fullName, profilePictureUrl: $profilePictureUrl, isVerified: $isVerified, isEmailVerified: $isEmailVerified, memberSince: $memberSince, averageRating: $averageRating, totalReviewsCount: $totalReviewsCount, publishedJobsCount: $publishedJobsCount, location: $location, hasReports: $hasReports, recentReviews: $recentReviews)';
}


}

/// @nodoc
abstract mixin class _$ClientPublicProfileModelCopyWith<$Res> implements $ClientPublicProfileModelCopyWith<$Res> {
  factory _$ClientPublicProfileModelCopyWith(_ClientPublicProfileModel value, $Res Function(_ClientPublicProfileModel) _then) = __$ClientPublicProfileModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String clientId, String fullName, String? profilePictureUrl, bool isVerified, bool isEmailVerified,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime memberSince, double averageRating, int totalReviewsCount, int publishedJobsCount, String? location, bool hasReports, List<ClientReviewPreviewModel> recentReviews
});




}
/// @nodoc
class __$ClientPublicProfileModelCopyWithImpl<$Res>
    implements _$ClientPublicProfileModelCopyWith<$Res> {
  __$ClientPublicProfileModelCopyWithImpl(this._self, this._then);

  final _ClientPublicProfileModel _self;
  final $Res Function(_ClientPublicProfileModel) _then;

/// Create a copy of ClientPublicProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? fullName = null,Object? profilePictureUrl = freezed,Object? isVerified = null,Object? isEmailVerified = null,Object? memberSince = null,Object? averageRating = null,Object? totalReviewsCount = null,Object? publishedJobsCount = null,Object? location = freezed,Object? hasReports = null,Object? recentReviews = null,}) {
  return _then(_ClientPublicProfileModel(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,profilePictureUrl: freezed == profilePictureUrl ? _self.profilePictureUrl : profilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isEmailVerified: null == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool,memberSince: null == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as DateTime,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviewsCount: null == totalReviewsCount ? _self.totalReviewsCount : totalReviewsCount // ignore: cast_nullable_to_non_nullable
as int,publishedJobsCount: null == publishedJobsCount ? _self.publishedJobsCount : publishedJobsCount // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,hasReports: null == hasReports ? _self.hasReports : hasReports // ignore: cast_nullable_to_non_nullable
as bool,recentReviews: null == recentReviews ? _self._recentReviews : recentReviews // ignore: cast_nullable_to_non_nullable
as List<ClientReviewPreviewModel>,
  ));
}


}

// dart format on
