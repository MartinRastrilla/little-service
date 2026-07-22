// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceRequestTimelineStepModel {

 String get key; String get title; String get subtitle; String get status;@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) DateTime? get occurredAt;
/// Create a copy of ServiceRequestTimelineStepModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestTimelineStepModelCopyWith<ServiceRequestTimelineStepModel> get copyWith => _$ServiceRequestTimelineStepModelCopyWithImpl<ServiceRequestTimelineStepModel>(this as ServiceRequestTimelineStepModel, _$identity);

  /// Serializes this ServiceRequestTimelineStepModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestTimelineStepModel&&(identical(other.key, key) || other.key == key)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.status, status) || other.status == status)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,title,subtitle,status,occurredAt);

@override
String toString() {
  return 'ServiceRequestTimelineStepModel(key: $key, title: $title, subtitle: $subtitle, status: $status, occurredAt: $occurredAt)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestTimelineStepModelCopyWith<$Res>  {
  factory $ServiceRequestTimelineStepModelCopyWith(ServiceRequestTimelineStepModel value, $Res Function(ServiceRequestTimelineStepModel) _then) = _$ServiceRequestTimelineStepModelCopyWithImpl;
@useResult
$Res call({
 String key, String title, String subtitle, String status,@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) DateTime? occurredAt
});




}
/// @nodoc
class _$ServiceRequestTimelineStepModelCopyWithImpl<$Res>
    implements $ServiceRequestTimelineStepModelCopyWith<$Res> {
  _$ServiceRequestTimelineStepModelCopyWithImpl(this._self, this._then);

  final ServiceRequestTimelineStepModel _self;
  final $Res Function(ServiceRequestTimelineStepModel) _then;

/// Create a copy of ServiceRequestTimelineStepModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? title = null,Object? subtitle = null,Object? status = null,Object? occurredAt = freezed,}) {
  return _then(ServiceRequestTimelineStepModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,occurredAt: freezed == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestTimelineStepModel].
extension ServiceRequestTimelineStepModelPatterns on ServiceRequestTimelineStepModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestTimelineStepModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestTimelineStepModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestTimelineStepModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestTimelineStepModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestTimelineStepModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestTimelineStepModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String title,  String subtitle,  String status, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)  DateTime? occurredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestTimelineStepModel() when $default != null:
return $default(_that.key,_that.title,_that.subtitle,_that.status,_that.occurredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String title,  String subtitle,  String status, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)  DateTime? occurredAt)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestTimelineStepModel():
return $default(_that.key,_that.title,_that.subtitle,_that.status,_that.occurredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String title,  String subtitle,  String status, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)  DateTime? occurredAt)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestTimelineStepModel() when $default != null:
return $default(_that.key,_that.title,_that.subtitle,_that.status,_that.occurredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestTimelineStepModel implements ServiceRequestTimelineStepModel {
  const _ServiceRequestTimelineStepModel({required this.key, required this.title, required this.subtitle, required this.status, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) this.occurredAt});
  factory _ServiceRequestTimelineStepModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestTimelineStepModelFromJson(json);

@override final  String key;
@override final  String title;
@override final  String subtitle;
@override final  String status;
@override@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) final  DateTime? occurredAt;

/// Create a copy of ServiceRequestTimelineStepModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestTimelineStepModelCopyWith<_ServiceRequestTimelineStepModel> get copyWith => __$ServiceRequestTimelineStepModelCopyWithImpl<_ServiceRequestTimelineStepModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestTimelineStepModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestTimelineStepModel&&(identical(other.key, key) || other.key == key)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.status, status) || other.status == status)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,title,subtitle,status,occurredAt);

@override
String toString() {
  return 'ServiceRequestTimelineStepModel(key: $key, title: $title, subtitle: $subtitle, status: $status, occurredAt: $occurredAt)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestTimelineStepModelCopyWith<$Res> implements $ServiceRequestTimelineStepModelCopyWith<$Res> {
  factory _$ServiceRequestTimelineStepModelCopyWith(_ServiceRequestTimelineStepModel value, $Res Function(_ServiceRequestTimelineStepModel) _then) = __$ServiceRequestTimelineStepModelCopyWithImpl;
@override @useResult
$Res call({
 String key, String title, String subtitle, String status,@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) DateTime? occurredAt
});




}
/// @nodoc
class __$ServiceRequestTimelineStepModelCopyWithImpl<$Res>
    implements _$ServiceRequestTimelineStepModelCopyWith<$Res> {
  __$ServiceRequestTimelineStepModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestTimelineStepModel _self;
  final $Res Function(_ServiceRequestTimelineStepModel) _then;

/// Create a copy of ServiceRequestTimelineStepModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? title = null,Object? subtitle = null,Object? status = null,Object? occurredAt = freezed,}) {
  return _then(_ServiceRequestTimelineStepModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,occurredAt: freezed == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ServiceRequestRecentApplicationModel {

@JsonKey(fromJson: stringFromJson) String get id;@JsonKey(fromJson: stringFromJson) String get freelancerId; String get freelancerName; String? get freelancerProfilePicture; double get ratingAverage; int get ratingCount;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get createdAt;
/// Create a copy of ServiceRequestRecentApplicationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestRecentApplicationModelCopyWith<ServiceRequestRecentApplicationModel> get copyWith => _$ServiceRequestRecentApplicationModelCopyWithImpl<ServiceRequestRecentApplicationModel>(this as ServiceRequestRecentApplicationModel, _$identity);

  /// Serializes this ServiceRequestRecentApplicationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestRecentApplicationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.freelancerId, freelancerId) || other.freelancerId == freelancerId)&&(identical(other.freelancerName, freelancerName) || other.freelancerName == freelancerName)&&(identical(other.freelancerProfilePicture, freelancerProfilePicture) || other.freelancerProfilePicture == freelancerProfilePicture)&&(identical(other.ratingAverage, ratingAverage) || other.ratingAverage == ratingAverage)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,freelancerId,freelancerName,freelancerProfilePicture,ratingAverage,ratingCount,createdAt);

@override
String toString() {
  return 'ServiceRequestRecentApplicationModel(id: $id, freelancerId: $freelancerId, freelancerName: $freelancerName, freelancerProfilePicture: $freelancerProfilePicture, ratingAverage: $ratingAverage, ratingCount: $ratingCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestRecentApplicationModelCopyWith<$Res>  {
  factory $ServiceRequestRecentApplicationModelCopyWith(ServiceRequestRecentApplicationModel value, $Res Function(ServiceRequestRecentApplicationModel) _then) = _$ServiceRequestRecentApplicationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id,@JsonKey(fromJson: stringFromJson) String freelancerId, String freelancerName, String? freelancerProfilePicture, double ratingAverage, int ratingCount,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt
});




}
/// @nodoc
class _$ServiceRequestRecentApplicationModelCopyWithImpl<$Res>
    implements $ServiceRequestRecentApplicationModelCopyWith<$Res> {
  _$ServiceRequestRecentApplicationModelCopyWithImpl(this._self, this._then);

  final ServiceRequestRecentApplicationModel _self;
  final $Res Function(ServiceRequestRecentApplicationModel) _then;

/// Create a copy of ServiceRequestRecentApplicationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? freelancerId = null,Object? freelancerName = null,Object? freelancerProfilePicture = freezed,Object? ratingAverage = null,Object? ratingCount = null,Object? createdAt = null,}) {
  return _then(ServiceRequestRecentApplicationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,freelancerId: null == freelancerId ? _self.freelancerId : freelancerId // ignore: cast_nullable_to_non_nullable
as String,freelancerName: null == freelancerName ? _self.freelancerName : freelancerName // ignore: cast_nullable_to_non_nullable
as String,freelancerProfilePicture: freezed == freelancerProfilePicture ? _self.freelancerProfilePicture : freelancerProfilePicture // ignore: cast_nullable_to_non_nullable
as String?,ratingAverage: null == ratingAverage ? _self.ratingAverage : ratingAverage // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestRecentApplicationModel].
extension ServiceRequestRecentApplicationModelPatterns on ServiceRequestRecentApplicationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestRecentApplicationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestRecentApplicationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestRecentApplicationModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestRecentApplicationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestRecentApplicationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestRecentApplicationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id, @JsonKey(fromJson: stringFromJson)  String freelancerId,  String freelancerName,  String? freelancerProfilePicture,  double ratingAverage,  int ratingCount, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestRecentApplicationModel() when $default != null:
return $default(_that.id,_that.freelancerId,_that.freelancerName,_that.freelancerProfilePicture,_that.ratingAverage,_that.ratingCount,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id, @JsonKey(fromJson: stringFromJson)  String freelancerId,  String freelancerName,  String? freelancerProfilePicture,  double ratingAverage,  int ratingCount, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestRecentApplicationModel():
return $default(_that.id,_that.freelancerId,_that.freelancerName,_that.freelancerProfilePicture,_that.ratingAverage,_that.ratingCount,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String id, @JsonKey(fromJson: stringFromJson)  String freelancerId,  String freelancerName,  String? freelancerProfilePicture,  double ratingAverage,  int ratingCount, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestRecentApplicationModel() when $default != null:
return $default(_that.id,_that.freelancerId,_that.freelancerName,_that.freelancerProfilePicture,_that.ratingAverage,_that.ratingCount,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestRecentApplicationModel implements ServiceRequestRecentApplicationModel {
  const _ServiceRequestRecentApplicationModel({@JsonKey(fromJson: stringFromJson) required this.id, @JsonKey(fromJson: stringFromJson) required this.freelancerId, required this.freelancerName, this.freelancerProfilePicture, required this.ratingAverage, this.ratingCount = 0, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.createdAt});
  factory _ServiceRequestRecentApplicationModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestRecentApplicationModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override@JsonKey(fromJson: stringFromJson) final  String freelancerId;
@override final  String freelancerName;
@override final  String? freelancerProfilePicture;
@override final  double ratingAverage;
@override@JsonKey() final  int ratingCount;
@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime createdAt;

/// Create a copy of ServiceRequestRecentApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestRecentApplicationModelCopyWith<_ServiceRequestRecentApplicationModel> get copyWith => __$ServiceRequestRecentApplicationModelCopyWithImpl<_ServiceRequestRecentApplicationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestRecentApplicationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestRecentApplicationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.freelancerId, freelancerId) || other.freelancerId == freelancerId)&&(identical(other.freelancerName, freelancerName) || other.freelancerName == freelancerName)&&(identical(other.freelancerProfilePicture, freelancerProfilePicture) || other.freelancerProfilePicture == freelancerProfilePicture)&&(identical(other.ratingAverage, ratingAverage) || other.ratingAverage == ratingAverage)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,freelancerId,freelancerName,freelancerProfilePicture,ratingAverage,ratingCount,createdAt);

@override
String toString() {
  return 'ServiceRequestRecentApplicationModel(id: $id, freelancerId: $freelancerId, freelancerName: $freelancerName, freelancerProfilePicture: $freelancerProfilePicture, ratingAverage: $ratingAverage, ratingCount: $ratingCount, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestRecentApplicationModelCopyWith<$Res> implements $ServiceRequestRecentApplicationModelCopyWith<$Res> {
  factory _$ServiceRequestRecentApplicationModelCopyWith(_ServiceRequestRecentApplicationModel value, $Res Function(_ServiceRequestRecentApplicationModel) _then) = __$ServiceRequestRecentApplicationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id,@JsonKey(fromJson: stringFromJson) String freelancerId, String freelancerName, String? freelancerProfilePicture, double ratingAverage, int ratingCount,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt
});




}
/// @nodoc
class __$ServiceRequestRecentApplicationModelCopyWithImpl<$Res>
    implements _$ServiceRequestRecentApplicationModelCopyWith<$Res> {
  __$ServiceRequestRecentApplicationModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestRecentApplicationModel _self;
  final $Res Function(_ServiceRequestRecentApplicationModel) _then;

/// Create a copy of ServiceRequestRecentApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? freelancerId = null,Object? freelancerName = null,Object? freelancerProfilePicture = freezed,Object? ratingAverage = null,Object? ratingCount = null,Object? createdAt = null,}) {
  return _then(_ServiceRequestRecentApplicationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,freelancerId: null == freelancerId ? _self.freelancerId : freelancerId // ignore: cast_nullable_to_non_nullable
as String,freelancerName: null == freelancerName ? _self.freelancerName : freelancerName // ignore: cast_nullable_to_non_nullable
as String,freelancerProfilePicture: freezed == freelancerProfilePicture ? _self.freelancerProfilePicture : freelancerProfilePicture // ignore: cast_nullable_to_non_nullable
as String?,ratingAverage: null == ratingAverage ? _self.ratingAverage : ratingAverage // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ServiceRequestActivityModel {

 int get messagesCount; int get applicationsCount; bool get showRecentApplications; List<ServiceRequestTimelineStepModel> get timeline; List<ServiceRequestRecentApplicationModel> get recentApplications;
/// Create a copy of ServiceRequestActivityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestActivityModelCopyWith<ServiceRequestActivityModel> get copyWith => _$ServiceRequestActivityModelCopyWithImpl<ServiceRequestActivityModel>(this as ServiceRequestActivityModel, _$identity);

  /// Serializes this ServiceRequestActivityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestActivityModel&&(identical(other.messagesCount, messagesCount) || other.messagesCount == messagesCount)&&(identical(other.applicationsCount, applicationsCount) || other.applicationsCount == applicationsCount)&&(identical(other.showRecentApplications, showRecentApplications) || other.showRecentApplications == showRecentApplications)&&const DeepCollectionEquality().equals(other.timeline, timeline)&&const DeepCollectionEquality().equals(other.recentApplications, recentApplications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messagesCount,applicationsCount,showRecentApplications,const DeepCollectionEquality().hash(timeline),const DeepCollectionEquality().hash(recentApplications));

@override
String toString() {
  return 'ServiceRequestActivityModel(messagesCount: $messagesCount, applicationsCount: $applicationsCount, showRecentApplications: $showRecentApplications, timeline: $timeline, recentApplications: $recentApplications)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestActivityModelCopyWith<$Res>  {
  factory $ServiceRequestActivityModelCopyWith(ServiceRequestActivityModel value, $Res Function(ServiceRequestActivityModel) _then) = _$ServiceRequestActivityModelCopyWithImpl;
@useResult
$Res call({
 int messagesCount, int applicationsCount, bool showRecentApplications, List<ServiceRequestTimelineStepModel> timeline, List<ServiceRequestRecentApplicationModel> recentApplications
});




}
/// @nodoc
class _$ServiceRequestActivityModelCopyWithImpl<$Res>
    implements $ServiceRequestActivityModelCopyWith<$Res> {
  _$ServiceRequestActivityModelCopyWithImpl(this._self, this._then);

  final ServiceRequestActivityModel _self;
  final $Res Function(ServiceRequestActivityModel) _then;

/// Create a copy of ServiceRequestActivityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messagesCount = null,Object? applicationsCount = null,Object? showRecentApplications = null,Object? timeline = null,Object? recentApplications = null,}) {
  return _then(ServiceRequestActivityModel(
messagesCount: null == messagesCount ? _self.messagesCount : messagesCount // ignore: cast_nullable_to_non_nullable
as int,applicationsCount: null == applicationsCount ? _self.applicationsCount : applicationsCount // ignore: cast_nullable_to_non_nullable
as int,showRecentApplications: null == showRecentApplications ? _self.showRecentApplications : showRecentApplications // ignore: cast_nullable_to_non_nullable
as bool,timeline: null == timeline ? _self.timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestTimelineStepModel>,recentApplications: null == recentApplications ? _self.recentApplications : recentApplications // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestRecentApplicationModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestActivityModel].
extension ServiceRequestActivityModelPatterns on ServiceRequestActivityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestActivityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestActivityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestActivityModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestActivityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestActivityModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestActivityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int messagesCount,  int applicationsCount,  bool showRecentApplications,  List<ServiceRequestTimelineStepModel> timeline,  List<ServiceRequestRecentApplicationModel> recentApplications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestActivityModel() when $default != null:
return $default(_that.messagesCount,_that.applicationsCount,_that.showRecentApplications,_that.timeline,_that.recentApplications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int messagesCount,  int applicationsCount,  bool showRecentApplications,  List<ServiceRequestTimelineStepModel> timeline,  List<ServiceRequestRecentApplicationModel> recentApplications)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestActivityModel():
return $default(_that.messagesCount,_that.applicationsCount,_that.showRecentApplications,_that.timeline,_that.recentApplications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int messagesCount,  int applicationsCount,  bool showRecentApplications,  List<ServiceRequestTimelineStepModel> timeline,  List<ServiceRequestRecentApplicationModel> recentApplications)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestActivityModel() when $default != null:
return $default(_that.messagesCount,_that.applicationsCount,_that.showRecentApplications,_that.timeline,_that.recentApplications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestActivityModel extends ServiceRequestActivityModel {
  const _ServiceRequestActivityModel({this.messagesCount = 0, this.applicationsCount = 0, this.showRecentApplications = false,  List<ServiceRequestTimelineStepModel> timeline = const <ServiceRequestTimelineStepModel>[],  List<ServiceRequestRecentApplicationModel> recentApplications = const <ServiceRequestRecentApplicationModel>[]}): _timeline = timeline,_recentApplications = recentApplications,super._();
  factory _ServiceRequestActivityModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestActivityModelFromJson(json);

@override@JsonKey() final  int messagesCount;
@override@JsonKey() final  int applicationsCount;
@override@JsonKey() final  bool showRecentApplications;
 final  List<ServiceRequestTimelineStepModel> _timeline;
@override@JsonKey() List<ServiceRequestTimelineStepModel> get timeline {
  if (_timeline is EqualUnmodifiableListView) return _timeline;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timeline);
}

 final  List<ServiceRequestRecentApplicationModel> _recentApplications;
@override@JsonKey() List<ServiceRequestRecentApplicationModel> get recentApplications {
  if (_recentApplications is EqualUnmodifiableListView) return _recentApplications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentApplications);
}


/// Create a copy of ServiceRequestActivityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestActivityModelCopyWith<_ServiceRequestActivityModel> get copyWith => __$ServiceRequestActivityModelCopyWithImpl<_ServiceRequestActivityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestActivityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestActivityModel&&(identical(other.messagesCount, messagesCount) || other.messagesCount == messagesCount)&&(identical(other.applicationsCount, applicationsCount) || other.applicationsCount == applicationsCount)&&(identical(other.showRecentApplications, showRecentApplications) || other.showRecentApplications == showRecentApplications)&&const DeepCollectionEquality().equals(other._timeline, _timeline)&&const DeepCollectionEquality().equals(other._recentApplications, _recentApplications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messagesCount,applicationsCount,showRecentApplications,const DeepCollectionEquality().hash(_timeline),const DeepCollectionEquality().hash(_recentApplications));

@override
String toString() {
  return 'ServiceRequestActivityModel(messagesCount: $messagesCount, applicationsCount: $applicationsCount, showRecentApplications: $showRecentApplications, timeline: $timeline, recentApplications: $recentApplications)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestActivityModelCopyWith<$Res> implements $ServiceRequestActivityModelCopyWith<$Res> {
  factory _$ServiceRequestActivityModelCopyWith(_ServiceRequestActivityModel value, $Res Function(_ServiceRequestActivityModel) _then) = __$ServiceRequestActivityModelCopyWithImpl;
@override @useResult
$Res call({
 int messagesCount, int applicationsCount, bool showRecentApplications, List<ServiceRequestTimelineStepModel> timeline, List<ServiceRequestRecentApplicationModel> recentApplications
});




}
/// @nodoc
class __$ServiceRequestActivityModelCopyWithImpl<$Res>
    implements _$ServiceRequestActivityModelCopyWith<$Res> {
  __$ServiceRequestActivityModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestActivityModel _self;
  final $Res Function(_ServiceRequestActivityModel) _then;

/// Create a copy of ServiceRequestActivityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messagesCount = null,Object? applicationsCount = null,Object? showRecentApplications = null,Object? timeline = null,Object? recentApplications = null,}) {
  return _then(_ServiceRequestActivityModel(
messagesCount: null == messagesCount ? _self.messagesCount : messagesCount // ignore: cast_nullable_to_non_nullable
as int,applicationsCount: null == applicationsCount ? _self.applicationsCount : applicationsCount // ignore: cast_nullable_to_non_nullable
as int,showRecentApplications: null == showRecentApplications ? _self.showRecentApplications : showRecentApplications // ignore: cast_nullable_to_non_nullable
as bool,timeline: null == timeline ? _self._timeline : timeline // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestTimelineStepModel>,recentApplications: null == recentApplications ? _self._recentApplications : recentApplications // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestRecentApplicationModel>,
  ));
}


}

// dart format on
