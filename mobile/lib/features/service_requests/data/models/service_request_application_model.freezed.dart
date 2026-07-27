// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceRequestApplicationModel {

@JsonKey(fromJson: stringFromJson) String get id;@JsonKey(fromJson: stringFromJson) String get freelancerId; String get freelancerName; String? get freelancerProfilePicture; double get ratingAverage; int get ratingCount; String? get bio; String get status; String get displayStatus;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get createdAt;
/// Create a copy of ServiceRequestApplicationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestApplicationModelCopyWith<ServiceRequestApplicationModel> get copyWith => _$ServiceRequestApplicationModelCopyWithImpl<ServiceRequestApplicationModel>(this as ServiceRequestApplicationModel, _$identity);

  /// Serializes this ServiceRequestApplicationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.freelancerId, freelancerId) || other.freelancerId == freelancerId)&&(identical(other.freelancerName, freelancerName) || other.freelancerName == freelancerName)&&(identical(other.freelancerProfilePicture, freelancerProfilePicture) || other.freelancerProfilePicture == freelancerProfilePicture)&&(identical(other.ratingAverage, ratingAverage) || other.ratingAverage == ratingAverage)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,freelancerId,freelancerName,freelancerProfilePicture,ratingAverage,ratingCount,bio,status,displayStatus,createdAt);

@override
String toString() {
  return 'ServiceRequestApplicationModel(id: $id, freelancerId: $freelancerId, freelancerName: $freelancerName, freelancerProfilePicture: $freelancerProfilePicture, ratingAverage: $ratingAverage, ratingCount: $ratingCount, bio: $bio, status: $status, displayStatus: $displayStatus, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestApplicationModelCopyWith<$Res>  {
  factory $ServiceRequestApplicationModelCopyWith(ServiceRequestApplicationModel value, $Res Function(ServiceRequestApplicationModel) _then) = _$ServiceRequestApplicationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id,@JsonKey(fromJson: stringFromJson) String freelancerId, String freelancerName, String? freelancerProfilePicture, double ratingAverage, int ratingCount, String? bio, String status, String displayStatus,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt
});




}
/// @nodoc
class _$ServiceRequestApplicationModelCopyWithImpl<$Res>
    implements $ServiceRequestApplicationModelCopyWith<$Res> {
  _$ServiceRequestApplicationModelCopyWithImpl(this._self, this._then);

  final ServiceRequestApplicationModel _self;
  final $Res Function(ServiceRequestApplicationModel) _then;

/// Create a copy of ServiceRequestApplicationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? freelancerId = null,Object? freelancerName = null,Object? freelancerProfilePicture = freezed,Object? ratingAverage = null,Object? ratingCount = null,Object? bio = freezed,Object? status = null,Object? displayStatus = null,Object? createdAt = null,}) {
  return _then(ServiceRequestApplicationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,freelancerId: null == freelancerId ? _self.freelancerId : freelancerId // ignore: cast_nullable_to_non_nullable
as String,freelancerName: null == freelancerName ? _self.freelancerName : freelancerName // ignore: cast_nullable_to_non_nullable
as String,freelancerProfilePicture: freezed == freelancerProfilePicture ? _self.freelancerProfilePicture : freelancerProfilePicture // ignore: cast_nullable_to_non_nullable
as String?,ratingAverage: null == ratingAverage ? _self.ratingAverage : ratingAverage // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayStatus: null == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestApplicationModel].
extension ServiceRequestApplicationModelPatterns on ServiceRequestApplicationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestApplicationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestApplicationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestApplicationModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestApplicationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestApplicationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestApplicationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id, @JsonKey(fromJson: stringFromJson)  String freelancerId,  String freelancerName,  String? freelancerProfilePicture,  double ratingAverage,  int ratingCount,  String? bio,  String status,  String displayStatus, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestApplicationModel() when $default != null:
return $default(_that.id,_that.freelancerId,_that.freelancerName,_that.freelancerProfilePicture,_that.ratingAverage,_that.ratingCount,_that.bio,_that.status,_that.displayStatus,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id, @JsonKey(fromJson: stringFromJson)  String freelancerId,  String freelancerName,  String? freelancerProfilePicture,  double ratingAverage,  int ratingCount,  String? bio,  String status,  String displayStatus, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestApplicationModel():
return $default(_that.id,_that.freelancerId,_that.freelancerName,_that.freelancerProfilePicture,_that.ratingAverage,_that.ratingCount,_that.bio,_that.status,_that.displayStatus,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String id, @JsonKey(fromJson: stringFromJson)  String freelancerId,  String freelancerName,  String? freelancerProfilePicture,  double ratingAverage,  int ratingCount,  String? bio,  String status,  String displayStatus, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestApplicationModel() when $default != null:
return $default(_that.id,_that.freelancerId,_that.freelancerName,_that.freelancerProfilePicture,_that.ratingAverage,_that.ratingCount,_that.bio,_that.status,_that.displayStatus,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestApplicationModel extends ServiceRequestApplicationModel {
  const _ServiceRequestApplicationModel({@JsonKey(fromJson: stringFromJson) required this.id, @JsonKey(fromJson: stringFromJson) required this.freelancerId, required this.freelancerName, this.freelancerProfilePicture, required this.ratingAverage, this.ratingCount = 0, this.bio, required this.status, this.displayStatus = '', @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.createdAt}): super._();
  factory _ServiceRequestApplicationModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestApplicationModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override@JsonKey(fromJson: stringFromJson) final  String freelancerId;
@override final  String freelancerName;
@override final  String? freelancerProfilePicture;
@override final  double ratingAverage;
@override@JsonKey() final  int ratingCount;
@override final  String? bio;
@override final  String status;
@override@JsonKey() final  String displayStatus;
@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime createdAt;

/// Create a copy of ServiceRequestApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestApplicationModelCopyWith<_ServiceRequestApplicationModel> get copyWith => __$ServiceRequestApplicationModelCopyWithImpl<_ServiceRequestApplicationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestApplicationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestApplicationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.freelancerId, freelancerId) || other.freelancerId == freelancerId)&&(identical(other.freelancerName, freelancerName) || other.freelancerName == freelancerName)&&(identical(other.freelancerProfilePicture, freelancerProfilePicture) || other.freelancerProfilePicture == freelancerProfilePicture)&&(identical(other.ratingAverage, ratingAverage) || other.ratingAverage == ratingAverage)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,freelancerId,freelancerName,freelancerProfilePicture,ratingAverage,ratingCount,bio,status,displayStatus,createdAt);

@override
String toString() {
  return 'ServiceRequestApplicationModel(id: $id, freelancerId: $freelancerId, freelancerName: $freelancerName, freelancerProfilePicture: $freelancerProfilePicture, ratingAverage: $ratingAverage, ratingCount: $ratingCount, bio: $bio, status: $status, displayStatus: $displayStatus, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestApplicationModelCopyWith<$Res> implements $ServiceRequestApplicationModelCopyWith<$Res> {
  factory _$ServiceRequestApplicationModelCopyWith(_ServiceRequestApplicationModel value, $Res Function(_ServiceRequestApplicationModel) _then) = __$ServiceRequestApplicationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id,@JsonKey(fromJson: stringFromJson) String freelancerId, String freelancerName, String? freelancerProfilePicture, double ratingAverage, int ratingCount, String? bio, String status, String displayStatus,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt
});




}
/// @nodoc
class __$ServiceRequestApplicationModelCopyWithImpl<$Res>
    implements _$ServiceRequestApplicationModelCopyWith<$Res> {
  __$ServiceRequestApplicationModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestApplicationModel _self;
  final $Res Function(_ServiceRequestApplicationModel) _then;

/// Create a copy of ServiceRequestApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? freelancerId = null,Object? freelancerName = null,Object? freelancerProfilePicture = freezed,Object? ratingAverage = null,Object? ratingCount = null,Object? bio = freezed,Object? status = null,Object? displayStatus = null,Object? createdAt = null,}) {
  return _then(_ServiceRequestApplicationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,freelancerId: null == freelancerId ? _self.freelancerId : freelancerId // ignore: cast_nullable_to_non_nullable
as String,freelancerName: null == freelancerName ? _self.freelancerName : freelancerName // ignore: cast_nullable_to_non_nullable
as String,freelancerProfilePicture: freezed == freelancerProfilePicture ? _self.freelancerProfilePicture : freelancerProfilePicture // ignore: cast_nullable_to_non_nullable
as String?,ratingAverage: null == ratingAverage ? _self.ratingAverage : ratingAverage // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayStatus: null == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ServiceRequestApplicationsResultModel {

 List<ServiceRequestApplicationModel> get applications; bool get canManageApplications; String get serviceRequestTitle; String get serviceRequestDisplayStatus;
/// Create a copy of ServiceRequestApplicationsResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestApplicationsResultModelCopyWith<ServiceRequestApplicationsResultModel> get copyWith => _$ServiceRequestApplicationsResultModelCopyWithImpl<ServiceRequestApplicationsResultModel>(this as ServiceRequestApplicationsResultModel, _$identity);

  /// Serializes this ServiceRequestApplicationsResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestApplicationsResultModel&&const DeepCollectionEquality().equals(other.applications, applications)&&(identical(other.canManageApplications, canManageApplications) || other.canManageApplications == canManageApplications)&&(identical(other.serviceRequestTitle, serviceRequestTitle) || other.serviceRequestTitle == serviceRequestTitle)&&(identical(other.serviceRequestDisplayStatus, serviceRequestDisplayStatus) || other.serviceRequestDisplayStatus == serviceRequestDisplayStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(applications),canManageApplications,serviceRequestTitle,serviceRequestDisplayStatus);

@override
String toString() {
  return 'ServiceRequestApplicationsResultModel(applications: $applications, canManageApplications: $canManageApplications, serviceRequestTitle: $serviceRequestTitle, serviceRequestDisplayStatus: $serviceRequestDisplayStatus)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestApplicationsResultModelCopyWith<$Res>  {
  factory $ServiceRequestApplicationsResultModelCopyWith(ServiceRequestApplicationsResultModel value, $Res Function(ServiceRequestApplicationsResultModel) _then) = _$ServiceRequestApplicationsResultModelCopyWithImpl;
@useResult
$Res call({
 List<ServiceRequestApplicationModel> applications, bool canManageApplications, String serviceRequestTitle, String serviceRequestDisplayStatus
});




}
/// @nodoc
class _$ServiceRequestApplicationsResultModelCopyWithImpl<$Res>
    implements $ServiceRequestApplicationsResultModelCopyWith<$Res> {
  _$ServiceRequestApplicationsResultModelCopyWithImpl(this._self, this._then);

  final ServiceRequestApplicationsResultModel _self;
  final $Res Function(ServiceRequestApplicationsResultModel) _then;

/// Create a copy of ServiceRequestApplicationsResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? applications = null,Object? canManageApplications = null,Object? serviceRequestTitle = null,Object? serviceRequestDisplayStatus = null,}) {
  return _then(ServiceRequestApplicationsResultModel(
applications: null == applications ? _self.applications : applications // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestApplicationModel>,canManageApplications: null == canManageApplications ? _self.canManageApplications : canManageApplications // ignore: cast_nullable_to_non_nullable
as bool,serviceRequestTitle: null == serviceRequestTitle ? _self.serviceRequestTitle : serviceRequestTitle // ignore: cast_nullable_to_non_nullable
as String,serviceRequestDisplayStatus: null == serviceRequestDisplayStatus ? _self.serviceRequestDisplayStatus : serviceRequestDisplayStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestApplicationsResultModel].
extension ServiceRequestApplicationsResultModelPatterns on ServiceRequestApplicationsResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestApplicationsResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestApplicationsResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestApplicationsResultModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestApplicationsResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestApplicationsResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestApplicationsResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ServiceRequestApplicationModel> applications,  bool canManageApplications,  String serviceRequestTitle,  String serviceRequestDisplayStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestApplicationsResultModel() when $default != null:
return $default(_that.applications,_that.canManageApplications,_that.serviceRequestTitle,_that.serviceRequestDisplayStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ServiceRequestApplicationModel> applications,  bool canManageApplications,  String serviceRequestTitle,  String serviceRequestDisplayStatus)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestApplicationsResultModel():
return $default(_that.applications,_that.canManageApplications,_that.serviceRequestTitle,_that.serviceRequestDisplayStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ServiceRequestApplicationModel> applications,  bool canManageApplications,  String serviceRequestTitle,  String serviceRequestDisplayStatus)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestApplicationsResultModel() when $default != null:
return $default(_that.applications,_that.canManageApplications,_that.serviceRequestTitle,_that.serviceRequestDisplayStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestApplicationsResultModel extends ServiceRequestApplicationsResultModel {
  const _ServiceRequestApplicationsResultModel({ List<ServiceRequestApplicationModel> applications = const <ServiceRequestApplicationModel>[], this.canManageApplications = false, this.serviceRequestTitle = '', this.serviceRequestDisplayStatus = ''}): _applications = applications,super._();
  factory _ServiceRequestApplicationsResultModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestApplicationsResultModelFromJson(json);

 final  List<ServiceRequestApplicationModel> _applications;
@override@JsonKey() List<ServiceRequestApplicationModel> get applications {
  if (_applications is EqualUnmodifiableListView) return _applications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applications);
}

@override@JsonKey() final  bool canManageApplications;
@override@JsonKey() final  String serviceRequestTitle;
@override@JsonKey() final  String serviceRequestDisplayStatus;

/// Create a copy of ServiceRequestApplicationsResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestApplicationsResultModelCopyWith<_ServiceRequestApplicationsResultModel> get copyWith => __$ServiceRequestApplicationsResultModelCopyWithImpl<_ServiceRequestApplicationsResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestApplicationsResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestApplicationsResultModel&&const DeepCollectionEquality().equals(other._applications, _applications)&&(identical(other.canManageApplications, canManageApplications) || other.canManageApplications == canManageApplications)&&(identical(other.serviceRequestTitle, serviceRequestTitle) || other.serviceRequestTitle == serviceRequestTitle)&&(identical(other.serviceRequestDisplayStatus, serviceRequestDisplayStatus) || other.serviceRequestDisplayStatus == serviceRequestDisplayStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_applications),canManageApplications,serviceRequestTitle,serviceRequestDisplayStatus);

@override
String toString() {
  return 'ServiceRequestApplicationsResultModel(applications: $applications, canManageApplications: $canManageApplications, serviceRequestTitle: $serviceRequestTitle, serviceRequestDisplayStatus: $serviceRequestDisplayStatus)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestApplicationsResultModelCopyWith<$Res> implements $ServiceRequestApplicationsResultModelCopyWith<$Res> {
  factory _$ServiceRequestApplicationsResultModelCopyWith(_ServiceRequestApplicationsResultModel value, $Res Function(_ServiceRequestApplicationsResultModel) _then) = __$ServiceRequestApplicationsResultModelCopyWithImpl;
@override @useResult
$Res call({
 List<ServiceRequestApplicationModel> applications, bool canManageApplications, String serviceRequestTitle, String serviceRequestDisplayStatus
});




}
/// @nodoc
class __$ServiceRequestApplicationsResultModelCopyWithImpl<$Res>
    implements _$ServiceRequestApplicationsResultModelCopyWith<$Res> {
  __$ServiceRequestApplicationsResultModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestApplicationsResultModel _self;
  final $Res Function(_ServiceRequestApplicationsResultModel) _then;

/// Create a copy of ServiceRequestApplicationsResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? applications = null,Object? canManageApplications = null,Object? serviceRequestTitle = null,Object? serviceRequestDisplayStatus = null,}) {
  return _then(_ServiceRequestApplicationsResultModel(
applications: null == applications ? _self._applications : applications // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestApplicationModel>,canManageApplications: null == canManageApplications ? _self.canManageApplications : canManageApplications // ignore: cast_nullable_to_non_nullable
as bool,serviceRequestTitle: null == serviceRequestTitle ? _self.serviceRequestTitle : serviceRequestTitle // ignore: cast_nullable_to_non_nullable
as String,serviceRequestDisplayStatus: null == serviceRequestDisplayStatus ? _self.serviceRequestDisplayStatus : serviceRequestDisplayStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
