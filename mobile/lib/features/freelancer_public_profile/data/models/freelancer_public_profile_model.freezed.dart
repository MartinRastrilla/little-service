// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelancer_public_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FreelancerReviewPreviewModel {

@JsonKey(fromJson: stringFromJson) String get id; String get reviewerName; String? get reviewerProfilePictureUrl; int get rating; String? get comment; String get serviceRequestTitle;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get createdAt;
/// Create a copy of FreelancerReviewPreviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerReviewPreviewModelCopyWith<FreelancerReviewPreviewModel> get copyWith => _$FreelancerReviewPreviewModelCopyWithImpl<FreelancerReviewPreviewModel>(this as FreelancerReviewPreviewModel, _$identity);

  /// Serializes this FreelancerReviewPreviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerReviewPreviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reviewerName, reviewerName) || other.reviewerName == reviewerName)&&(identical(other.reviewerProfilePictureUrl, reviewerProfilePictureUrl) || other.reviewerProfilePictureUrl == reviewerProfilePictureUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.serviceRequestTitle, serviceRequestTitle) || other.serviceRequestTitle == serviceRequestTitle)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reviewerName,reviewerProfilePictureUrl,rating,comment,serviceRequestTitle,createdAt);

@override
String toString() {
  return 'FreelancerReviewPreviewModel(id: $id, reviewerName: $reviewerName, reviewerProfilePictureUrl: $reviewerProfilePictureUrl, rating: $rating, comment: $comment, serviceRequestTitle: $serviceRequestTitle, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $FreelancerReviewPreviewModelCopyWith<$Res>  {
  factory $FreelancerReviewPreviewModelCopyWith(FreelancerReviewPreviewModel value, $Res Function(FreelancerReviewPreviewModel) _then) = _$FreelancerReviewPreviewModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String reviewerName, String? reviewerProfilePictureUrl, int rating, String? comment, String serviceRequestTitle,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt
});




}
/// @nodoc
class _$FreelancerReviewPreviewModelCopyWithImpl<$Res>
    implements $FreelancerReviewPreviewModelCopyWith<$Res> {
  _$FreelancerReviewPreviewModelCopyWithImpl(this._self, this._then);

  final FreelancerReviewPreviewModel _self;
  final $Res Function(FreelancerReviewPreviewModel) _then;

/// Create a copy of FreelancerReviewPreviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? reviewerName = null,Object? reviewerProfilePictureUrl = freezed,Object? rating = null,Object? comment = freezed,Object? serviceRequestTitle = null,Object? createdAt = null,}) {
  return _then(FreelancerReviewPreviewModel(
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


/// Adds pattern-matching-related methods to [FreelancerReviewPreviewModel].
extension FreelancerReviewPreviewModelPatterns on FreelancerReviewPreviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FreelancerReviewPreviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FreelancerReviewPreviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FreelancerReviewPreviewModel value)  $default,){
final _that = this;
switch (_that) {
case _FreelancerReviewPreviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FreelancerReviewPreviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _FreelancerReviewPreviewModel() when $default != null:
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
case _FreelancerReviewPreviewModel() when $default != null:
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
case _FreelancerReviewPreviewModel():
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
case _FreelancerReviewPreviewModel() when $default != null:
return $default(_that.id,_that.reviewerName,_that.reviewerProfilePictureUrl,_that.rating,_that.comment,_that.serviceRequestTitle,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FreelancerReviewPreviewModel extends FreelancerReviewPreviewModel {
  const _FreelancerReviewPreviewModel({@JsonKey(fromJson: stringFromJson) required this.id, required this.reviewerName, this.reviewerProfilePictureUrl, required this.rating, this.comment, required this.serviceRequestTitle, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.createdAt}): super._();
  factory _FreelancerReviewPreviewModel.fromJson(Map<String, dynamic> json) => _$FreelancerReviewPreviewModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override final  String reviewerName;
@override final  String? reviewerProfilePictureUrl;
@override final  int rating;
@override final  String? comment;
@override final  String serviceRequestTitle;
@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime createdAt;

/// Create a copy of FreelancerReviewPreviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreelancerReviewPreviewModelCopyWith<_FreelancerReviewPreviewModel> get copyWith => __$FreelancerReviewPreviewModelCopyWithImpl<_FreelancerReviewPreviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FreelancerReviewPreviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreelancerReviewPreviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.reviewerName, reviewerName) || other.reviewerName == reviewerName)&&(identical(other.reviewerProfilePictureUrl, reviewerProfilePictureUrl) || other.reviewerProfilePictureUrl == reviewerProfilePictureUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.serviceRequestTitle, serviceRequestTitle) || other.serviceRequestTitle == serviceRequestTitle)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,reviewerName,reviewerProfilePictureUrl,rating,comment,serviceRequestTitle,createdAt);

@override
String toString() {
  return 'FreelancerReviewPreviewModel(id: $id, reviewerName: $reviewerName, reviewerProfilePictureUrl: $reviewerProfilePictureUrl, rating: $rating, comment: $comment, serviceRequestTitle: $serviceRequestTitle, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$FreelancerReviewPreviewModelCopyWith<$Res> implements $FreelancerReviewPreviewModelCopyWith<$Res> {
  factory _$FreelancerReviewPreviewModelCopyWith(_FreelancerReviewPreviewModel value, $Res Function(_FreelancerReviewPreviewModel) _then) = __$FreelancerReviewPreviewModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String reviewerName, String? reviewerProfilePictureUrl, int rating, String? comment, String serviceRequestTitle,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt
});




}
/// @nodoc
class __$FreelancerReviewPreviewModelCopyWithImpl<$Res>
    implements _$FreelancerReviewPreviewModelCopyWith<$Res> {
  __$FreelancerReviewPreviewModelCopyWithImpl(this._self, this._then);

  final _FreelancerReviewPreviewModel _self;
  final $Res Function(_FreelancerReviewPreviewModel) _then;

/// Create a copy of FreelancerReviewPreviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? reviewerName = null,Object? reviewerProfilePictureUrl = freezed,Object? rating = null,Object? comment = freezed,Object? serviceRequestTitle = null,Object? createdAt = null,}) {
  return _then(_FreelancerReviewPreviewModel(
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
mixin _$FreelancerServicePreviewModel {

@JsonKey(fromJson: stringFromJson) String get id; String get title; String get description; num get price;
/// Create a copy of FreelancerServicePreviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerServicePreviewModelCopyWith<FreelancerServicePreviewModel> get copyWith => _$FreelancerServicePreviewModelCopyWithImpl<FreelancerServicePreviewModel>(this as FreelancerServicePreviewModel, _$identity);

  /// Serializes this FreelancerServicePreviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerServicePreviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,price);

@override
String toString() {
  return 'FreelancerServicePreviewModel(id: $id, title: $title, description: $description, price: $price)';
}


}

/// @nodoc
abstract mixin class $FreelancerServicePreviewModelCopyWith<$Res>  {
  factory $FreelancerServicePreviewModelCopyWith(FreelancerServicePreviewModel value, $Res Function(FreelancerServicePreviewModel) _then) = _$FreelancerServicePreviewModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String title, String description, num price
});




}
/// @nodoc
class _$FreelancerServicePreviewModelCopyWithImpl<$Res>
    implements $FreelancerServicePreviewModelCopyWith<$Res> {
  _$FreelancerServicePreviewModelCopyWithImpl(this._self, this._then);

  final FreelancerServicePreviewModel _self;
  final $Res Function(FreelancerServicePreviewModel) _then;

/// Create a copy of FreelancerServicePreviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? price = null,}) {
  return _then(FreelancerServicePreviewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [FreelancerServicePreviewModel].
extension FreelancerServicePreviewModelPatterns on FreelancerServicePreviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FreelancerServicePreviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FreelancerServicePreviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FreelancerServicePreviewModel value)  $default,){
final _that = this;
switch (_that) {
case _FreelancerServicePreviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FreelancerServicePreviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _FreelancerServicePreviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  num price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FreelancerServicePreviewModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  num price)  $default,) {final _that = this;
switch (_that) {
case _FreelancerServicePreviewModel():
return $default(_that.id,_that.title,_that.description,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  num price)?  $default,) {final _that = this;
switch (_that) {
case _FreelancerServicePreviewModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FreelancerServicePreviewModel extends FreelancerServicePreviewModel {
  const _FreelancerServicePreviewModel({@JsonKey(fromJson: stringFromJson) required this.id, required this.title, required this.description, required this.price}): super._();
  factory _FreelancerServicePreviewModel.fromJson(Map<String, dynamic> json) => _$FreelancerServicePreviewModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override final  String title;
@override final  String description;
@override final  num price;

/// Create a copy of FreelancerServicePreviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreelancerServicePreviewModelCopyWith<_FreelancerServicePreviewModel> get copyWith => __$FreelancerServicePreviewModelCopyWithImpl<_FreelancerServicePreviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FreelancerServicePreviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreelancerServicePreviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,price);

@override
String toString() {
  return 'FreelancerServicePreviewModel(id: $id, title: $title, description: $description, price: $price)';
}


}

/// @nodoc
abstract mixin class _$FreelancerServicePreviewModelCopyWith<$Res> implements $FreelancerServicePreviewModelCopyWith<$Res> {
  factory _$FreelancerServicePreviewModelCopyWith(_FreelancerServicePreviewModel value, $Res Function(_FreelancerServicePreviewModel) _then) = __$FreelancerServicePreviewModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String title, String description, num price
});




}
/// @nodoc
class __$FreelancerServicePreviewModelCopyWithImpl<$Res>
    implements _$FreelancerServicePreviewModelCopyWith<$Res> {
  __$FreelancerServicePreviewModelCopyWithImpl(this._self, this._then);

  final _FreelancerServicePreviewModel _self;
  final $Res Function(_FreelancerServicePreviewModel) _then;

/// Create a copy of FreelancerServicePreviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? price = null,}) {
  return _then(_FreelancerServicePreviewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$FreelancerPublicProfileModel {

@JsonKey(fromJson: stringFromJson) String get freelancerId; String get fullName; String? get profilePictureUrl; String? get profession; String? get bio; bool get isVerified;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get memberSince; int get yearsOnPlatform; double get averageRating; int get totalReviewsCount; int get completedJobs; bool get hasReports; List<String> get skills; int get totalActiveServicesCount; List<FreelancerServicePreviewModel> get offeredServices; List<FreelancerReviewPreviewModel> get recentReviews;
/// Create a copy of FreelancerPublicProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerPublicProfileModelCopyWith<FreelancerPublicProfileModel> get copyWith => _$FreelancerPublicProfileModelCopyWithImpl<FreelancerPublicProfileModel>(this as FreelancerPublicProfileModel, _$identity);

  /// Serializes this FreelancerPublicProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerPublicProfileModel&&(identical(other.freelancerId, freelancerId) || other.freelancerId == freelancerId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.profilePictureUrl, profilePictureUrl) || other.profilePictureUrl == profilePictureUrl)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.yearsOnPlatform, yearsOnPlatform) || other.yearsOnPlatform == yearsOnPlatform)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviewsCount, totalReviewsCount) || other.totalReviewsCount == totalReviewsCount)&&(identical(other.completedJobs, completedJobs) || other.completedJobs == completedJobs)&&(identical(other.hasReports, hasReports) || other.hasReports == hasReports)&&const DeepCollectionEquality().equals(other.skills, skills)&&(identical(other.totalActiveServicesCount, totalActiveServicesCount) || other.totalActiveServicesCount == totalActiveServicesCount)&&const DeepCollectionEquality().equals(other.offeredServices, offeredServices)&&const DeepCollectionEquality().equals(other.recentReviews, recentReviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,freelancerId,fullName,profilePictureUrl,profession,bio,isVerified,memberSince,yearsOnPlatform,averageRating,totalReviewsCount,completedJobs,hasReports,const DeepCollectionEquality().hash(skills),totalActiveServicesCount,const DeepCollectionEquality().hash(offeredServices),const DeepCollectionEquality().hash(recentReviews));

@override
String toString() {
  return 'FreelancerPublicProfileModel(freelancerId: $freelancerId, fullName: $fullName, profilePictureUrl: $profilePictureUrl, profession: $profession, bio: $bio, isVerified: $isVerified, memberSince: $memberSince, yearsOnPlatform: $yearsOnPlatform, averageRating: $averageRating, totalReviewsCount: $totalReviewsCount, completedJobs: $completedJobs, hasReports: $hasReports, skills: $skills, totalActiveServicesCount: $totalActiveServicesCount, offeredServices: $offeredServices, recentReviews: $recentReviews)';
}


}

/// @nodoc
abstract mixin class $FreelancerPublicProfileModelCopyWith<$Res>  {
  factory $FreelancerPublicProfileModelCopyWith(FreelancerPublicProfileModel value, $Res Function(FreelancerPublicProfileModel) _then) = _$FreelancerPublicProfileModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String freelancerId, String fullName, String? profilePictureUrl, String? profession, String? bio, bool isVerified,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime memberSince, int yearsOnPlatform, double averageRating, int totalReviewsCount, int completedJobs, bool hasReports, List<String> skills, int totalActiveServicesCount, List<FreelancerServicePreviewModel> offeredServices, List<FreelancerReviewPreviewModel> recentReviews
});




}
/// @nodoc
class _$FreelancerPublicProfileModelCopyWithImpl<$Res>
    implements $FreelancerPublicProfileModelCopyWith<$Res> {
  _$FreelancerPublicProfileModelCopyWithImpl(this._self, this._then);

  final FreelancerPublicProfileModel _self;
  final $Res Function(FreelancerPublicProfileModel) _then;

/// Create a copy of FreelancerPublicProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? freelancerId = null,Object? fullName = null,Object? profilePictureUrl = freezed,Object? profession = freezed,Object? bio = freezed,Object? isVerified = null,Object? memberSince = null,Object? yearsOnPlatform = null,Object? averageRating = null,Object? totalReviewsCount = null,Object? completedJobs = null,Object? hasReports = null,Object? skills = null,Object? totalActiveServicesCount = null,Object? offeredServices = null,Object? recentReviews = null,}) {
  return _then(FreelancerPublicProfileModel(
freelancerId: null == freelancerId ? _self.freelancerId : freelancerId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,profilePictureUrl: freezed == profilePictureUrl ? _self.profilePictureUrl : profilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,profession: freezed == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,memberSince: null == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as DateTime,yearsOnPlatform: null == yearsOnPlatform ? _self.yearsOnPlatform : yearsOnPlatform // ignore: cast_nullable_to_non_nullable
as int,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviewsCount: null == totalReviewsCount ? _self.totalReviewsCount : totalReviewsCount // ignore: cast_nullable_to_non_nullable
as int,completedJobs: null == completedJobs ? _self.completedJobs : completedJobs // ignore: cast_nullable_to_non_nullable
as int,hasReports: null == hasReports ? _self.hasReports : hasReports // ignore: cast_nullable_to_non_nullable
as bool,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,totalActiveServicesCount: null == totalActiveServicesCount ? _self.totalActiveServicesCount : totalActiveServicesCount // ignore: cast_nullable_to_non_nullable
as int,offeredServices: null == offeredServices ? _self.offeredServices : offeredServices // ignore: cast_nullable_to_non_nullable
as List<FreelancerServicePreviewModel>,recentReviews: null == recentReviews ? _self.recentReviews : recentReviews // ignore: cast_nullable_to_non_nullable
as List<FreelancerReviewPreviewModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [FreelancerPublicProfileModel].
extension FreelancerPublicProfileModelPatterns on FreelancerPublicProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FreelancerPublicProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FreelancerPublicProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FreelancerPublicProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _FreelancerPublicProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FreelancerPublicProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _FreelancerPublicProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String freelancerId,  String fullName,  String? profilePictureUrl,  String? profession,  String? bio,  bool isVerified, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime memberSince,  int yearsOnPlatform,  double averageRating,  int totalReviewsCount,  int completedJobs,  bool hasReports,  List<String> skills,  int totalActiveServicesCount,  List<FreelancerServicePreviewModel> offeredServices,  List<FreelancerReviewPreviewModel> recentReviews)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FreelancerPublicProfileModel() when $default != null:
return $default(_that.freelancerId,_that.fullName,_that.profilePictureUrl,_that.profession,_that.bio,_that.isVerified,_that.memberSince,_that.yearsOnPlatform,_that.averageRating,_that.totalReviewsCount,_that.completedJobs,_that.hasReports,_that.skills,_that.totalActiveServicesCount,_that.offeredServices,_that.recentReviews);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String freelancerId,  String fullName,  String? profilePictureUrl,  String? profession,  String? bio,  bool isVerified, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime memberSince,  int yearsOnPlatform,  double averageRating,  int totalReviewsCount,  int completedJobs,  bool hasReports,  List<String> skills,  int totalActiveServicesCount,  List<FreelancerServicePreviewModel> offeredServices,  List<FreelancerReviewPreviewModel> recentReviews)  $default,) {final _that = this;
switch (_that) {
case _FreelancerPublicProfileModel():
return $default(_that.freelancerId,_that.fullName,_that.profilePictureUrl,_that.profession,_that.bio,_that.isVerified,_that.memberSince,_that.yearsOnPlatform,_that.averageRating,_that.totalReviewsCount,_that.completedJobs,_that.hasReports,_that.skills,_that.totalActiveServicesCount,_that.offeredServices,_that.recentReviews);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String freelancerId,  String fullName,  String? profilePictureUrl,  String? profession,  String? bio,  bool isVerified, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime memberSince,  int yearsOnPlatform,  double averageRating,  int totalReviewsCount,  int completedJobs,  bool hasReports,  List<String> skills,  int totalActiveServicesCount,  List<FreelancerServicePreviewModel> offeredServices,  List<FreelancerReviewPreviewModel> recentReviews)?  $default,) {final _that = this;
switch (_that) {
case _FreelancerPublicProfileModel() when $default != null:
return $default(_that.freelancerId,_that.fullName,_that.profilePictureUrl,_that.profession,_that.bio,_that.isVerified,_that.memberSince,_that.yearsOnPlatform,_that.averageRating,_that.totalReviewsCount,_that.completedJobs,_that.hasReports,_that.skills,_that.totalActiveServicesCount,_that.offeredServices,_that.recentReviews);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FreelancerPublicProfileModel extends FreelancerPublicProfileModel {
  const _FreelancerPublicProfileModel({@JsonKey(fromJson: stringFromJson) required this.freelancerId, required this.fullName, this.profilePictureUrl, this.profession, this.bio, this.isVerified = false, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.memberSince, this.yearsOnPlatform = 0, this.averageRating = 0, this.totalReviewsCount = 0, this.completedJobs = 0, this.hasReports = false,  List<String> skills = const [], this.totalActiveServicesCount = 0,  List<FreelancerServicePreviewModel> offeredServices = const [],  List<FreelancerReviewPreviewModel> recentReviews = const []}): _skills = skills,_offeredServices = offeredServices,_recentReviews = recentReviews,super._();
  factory _FreelancerPublicProfileModel.fromJson(Map<String, dynamic> json) => _$FreelancerPublicProfileModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String freelancerId;
@override final  String fullName;
@override final  String? profilePictureUrl;
@override final  String? profession;
@override final  String? bio;
@override@JsonKey() final  bool isVerified;
@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime memberSince;
@override@JsonKey() final  int yearsOnPlatform;
@override@JsonKey() final  double averageRating;
@override@JsonKey() final  int totalReviewsCount;
@override@JsonKey() final  int completedJobs;
@override@JsonKey() final  bool hasReports;
 final  List<String> _skills;
@override@JsonKey() List<String> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}

@override@JsonKey() final  int totalActiveServicesCount;
 final  List<FreelancerServicePreviewModel> _offeredServices;
@override@JsonKey() List<FreelancerServicePreviewModel> get offeredServices {
  if (_offeredServices is EqualUnmodifiableListView) return _offeredServices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offeredServices);
}

 final  List<FreelancerReviewPreviewModel> _recentReviews;
@override@JsonKey() List<FreelancerReviewPreviewModel> get recentReviews {
  if (_recentReviews is EqualUnmodifiableListView) return _recentReviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentReviews);
}


/// Create a copy of FreelancerPublicProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreelancerPublicProfileModelCopyWith<_FreelancerPublicProfileModel> get copyWith => __$FreelancerPublicProfileModelCopyWithImpl<_FreelancerPublicProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FreelancerPublicProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreelancerPublicProfileModel&&(identical(other.freelancerId, freelancerId) || other.freelancerId == freelancerId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.profilePictureUrl, profilePictureUrl) || other.profilePictureUrl == profilePictureUrl)&&(identical(other.profession, profession) || other.profession == profession)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.yearsOnPlatform, yearsOnPlatform) || other.yearsOnPlatform == yearsOnPlatform)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.totalReviewsCount, totalReviewsCount) || other.totalReviewsCount == totalReviewsCount)&&(identical(other.completedJobs, completedJobs) || other.completedJobs == completedJobs)&&(identical(other.hasReports, hasReports) || other.hasReports == hasReports)&&const DeepCollectionEquality().equals(other._skills, _skills)&&(identical(other.totalActiveServicesCount, totalActiveServicesCount) || other.totalActiveServicesCount == totalActiveServicesCount)&&const DeepCollectionEquality().equals(other._offeredServices, _offeredServices)&&const DeepCollectionEquality().equals(other._recentReviews, _recentReviews));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,freelancerId,fullName,profilePictureUrl,profession,bio,isVerified,memberSince,yearsOnPlatform,averageRating,totalReviewsCount,completedJobs,hasReports,const DeepCollectionEquality().hash(_skills),totalActiveServicesCount,const DeepCollectionEquality().hash(_offeredServices),const DeepCollectionEquality().hash(_recentReviews));

@override
String toString() {
  return 'FreelancerPublicProfileModel(freelancerId: $freelancerId, fullName: $fullName, profilePictureUrl: $profilePictureUrl, profession: $profession, bio: $bio, isVerified: $isVerified, memberSince: $memberSince, yearsOnPlatform: $yearsOnPlatform, averageRating: $averageRating, totalReviewsCount: $totalReviewsCount, completedJobs: $completedJobs, hasReports: $hasReports, skills: $skills, totalActiveServicesCount: $totalActiveServicesCount, offeredServices: $offeredServices, recentReviews: $recentReviews)';
}


}

/// @nodoc
abstract mixin class _$FreelancerPublicProfileModelCopyWith<$Res> implements $FreelancerPublicProfileModelCopyWith<$Res> {
  factory _$FreelancerPublicProfileModelCopyWith(_FreelancerPublicProfileModel value, $Res Function(_FreelancerPublicProfileModel) _then) = __$FreelancerPublicProfileModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String freelancerId, String fullName, String? profilePictureUrl, String? profession, String? bio, bool isVerified,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime memberSince, int yearsOnPlatform, double averageRating, int totalReviewsCount, int completedJobs, bool hasReports, List<String> skills, int totalActiveServicesCount, List<FreelancerServicePreviewModel> offeredServices, List<FreelancerReviewPreviewModel> recentReviews
});




}
/// @nodoc
class __$FreelancerPublicProfileModelCopyWithImpl<$Res>
    implements _$FreelancerPublicProfileModelCopyWith<$Res> {
  __$FreelancerPublicProfileModelCopyWithImpl(this._self, this._then);

  final _FreelancerPublicProfileModel _self;
  final $Res Function(_FreelancerPublicProfileModel) _then;

/// Create a copy of FreelancerPublicProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? freelancerId = null,Object? fullName = null,Object? profilePictureUrl = freezed,Object? profession = freezed,Object? bio = freezed,Object? isVerified = null,Object? memberSince = null,Object? yearsOnPlatform = null,Object? averageRating = null,Object? totalReviewsCount = null,Object? completedJobs = null,Object? hasReports = null,Object? skills = null,Object? totalActiveServicesCount = null,Object? offeredServices = null,Object? recentReviews = null,}) {
  return _then(_FreelancerPublicProfileModel(
freelancerId: null == freelancerId ? _self.freelancerId : freelancerId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,profilePictureUrl: freezed == profilePictureUrl ? _self.profilePictureUrl : profilePictureUrl // ignore: cast_nullable_to_non_nullable
as String?,profession: freezed == profession ? _self.profession : profession // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,memberSince: null == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as DateTime,yearsOnPlatform: null == yearsOnPlatform ? _self.yearsOnPlatform : yearsOnPlatform // ignore: cast_nullable_to_non_nullable
as int,averageRating: null == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double,totalReviewsCount: null == totalReviewsCount ? _self.totalReviewsCount : totalReviewsCount // ignore: cast_nullable_to_non_nullable
as int,completedJobs: null == completedJobs ? _self.completedJobs : completedJobs // ignore: cast_nullable_to_non_nullable
as int,hasReports: null == hasReports ? _self.hasReports : hasReports // ignore: cast_nullable_to_non_nullable
as bool,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,totalActiveServicesCount: null == totalActiveServicesCount ? _self.totalActiveServicesCount : totalActiveServicesCount // ignore: cast_nullable_to_non_nullable
as int,offeredServices: null == offeredServices ? _self._offeredServices : offeredServices // ignore: cast_nullable_to_non_nullable
as List<FreelancerServicePreviewModel>,recentReviews: null == recentReviews ? _self._recentReviews : recentReviews // ignore: cast_nullable_to_non_nullable
as List<FreelancerReviewPreviewModel>,
  ));
}


}

// dart format on
