// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceRequestPhotoModel {

@JsonKey(fromJson: stringFromJson) String get id; String get filePath;
/// Create a copy of ServiceRequestPhotoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestPhotoModelCopyWith<ServiceRequestPhotoModel> get copyWith => _$ServiceRequestPhotoModelCopyWithImpl<ServiceRequestPhotoModel>(this as ServiceRequestPhotoModel, _$identity);

  /// Serializes this ServiceRequestPhotoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestPhotoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filePath);

@override
String toString() {
  return 'ServiceRequestPhotoModel(id: $id, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestPhotoModelCopyWith<$Res>  {
  factory $ServiceRequestPhotoModelCopyWith(ServiceRequestPhotoModel value, $Res Function(ServiceRequestPhotoModel) _then) = _$ServiceRequestPhotoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String filePath
});




}
/// @nodoc
class _$ServiceRequestPhotoModelCopyWithImpl<$Res>
    implements $ServiceRequestPhotoModelCopyWith<$Res> {
  _$ServiceRequestPhotoModelCopyWithImpl(this._self, this._then);

  final ServiceRequestPhotoModel _self;
  final $Res Function(ServiceRequestPhotoModel) _then;

/// Create a copy of ServiceRequestPhotoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? filePath = null,}) {
  return _then(ServiceRequestPhotoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestPhotoModel].
extension ServiceRequestPhotoModelPatterns on ServiceRequestPhotoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestPhotoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestPhotoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestPhotoModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestPhotoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestPhotoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestPhotoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String filePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestPhotoModel() when $default != null:
return $default(_that.id,_that.filePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String filePath)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestPhotoModel():
return $default(_that.id,_that.filePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String id,  String filePath)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestPhotoModel() when $default != null:
return $default(_that.id,_that.filePath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestPhotoModel implements ServiceRequestPhotoModel {
  const _ServiceRequestPhotoModel({@JsonKey(fromJson: stringFromJson) required this.id, required this.filePath});
  factory _ServiceRequestPhotoModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestPhotoModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override final  String filePath;

/// Create a copy of ServiceRequestPhotoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestPhotoModelCopyWith<_ServiceRequestPhotoModel> get copyWith => __$ServiceRequestPhotoModelCopyWithImpl<_ServiceRequestPhotoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestPhotoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestPhotoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filePath);

@override
String toString() {
  return 'ServiceRequestPhotoModel(id: $id, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestPhotoModelCopyWith<$Res> implements $ServiceRequestPhotoModelCopyWith<$Res> {
  factory _$ServiceRequestPhotoModelCopyWith(_ServiceRequestPhotoModel value, $Res Function(_ServiceRequestPhotoModel) _then) = __$ServiceRequestPhotoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String filePath
});




}
/// @nodoc
class __$ServiceRequestPhotoModelCopyWithImpl<$Res>
    implements _$ServiceRequestPhotoModelCopyWith<$Res> {
  __$ServiceRequestPhotoModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestPhotoModel _self;
  final $Res Function(_ServiceRequestPhotoModel) _then;

/// Create a copy of ServiceRequestPhotoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? filePath = null,}) {
  return _then(_ServiceRequestPhotoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ServiceRequestDetailModel {

@JsonKey(fromJson: stringFromJson) String get id; String get title; String get description; String get location; String get status; double? get price;@JsonKey(fromJson: stringFromJson) String get clientId;@JsonKey(fromJson: stringFromJson) String? get freelancerPickedId; int get applicationsCount; List<ServiceRequestPhotoModel> get photos;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get createdAt;@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) DateTime? get updatedAt;
/// Create a copy of ServiceRequestDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestDetailModelCopyWith<ServiceRequestDetailModel> get copyWith => _$ServiceRequestDetailModelCopyWithImpl<ServiceRequestDetailModel>(this as ServiceRequestDetailModel, _$identity);

  /// Serializes this ServiceRequestDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.freelancerPickedId, freelancerPickedId) || other.freelancerPickedId == freelancerPickedId)&&(identical(other.applicationsCount, applicationsCount) || other.applicationsCount == applicationsCount)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,location,status,price,clientId,freelancerPickedId,applicationsCount,const DeepCollectionEquality().hash(photos),createdAt,updatedAt);

@override
String toString() {
  return 'ServiceRequestDetailModel(id: $id, title: $title, description: $description, location: $location, status: $status, price: $price, clientId: $clientId, freelancerPickedId: $freelancerPickedId, applicationsCount: $applicationsCount, photos: $photos, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestDetailModelCopyWith<$Res>  {
  factory $ServiceRequestDetailModelCopyWith(ServiceRequestDetailModel value, $Res Function(ServiceRequestDetailModel) _then) = _$ServiceRequestDetailModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String title, String description, String location, String status, double? price,@JsonKey(fromJson: stringFromJson) String clientId,@JsonKey(fromJson: stringFromJson) String? freelancerPickedId, int applicationsCount, List<ServiceRequestPhotoModel> photos,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt,@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) DateTime? updatedAt
});




}
/// @nodoc
class _$ServiceRequestDetailModelCopyWithImpl<$Res>
    implements $ServiceRequestDetailModelCopyWith<$Res> {
  _$ServiceRequestDetailModelCopyWithImpl(this._self, this._then);

  final ServiceRequestDetailModel _self;
  final $Res Function(ServiceRequestDetailModel) _then;

/// Create a copy of ServiceRequestDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? location = null,Object? status = null,Object? price = freezed,Object? clientId = null,Object? freelancerPickedId = freezed,Object? applicationsCount = null,Object? photos = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(ServiceRequestDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,freelancerPickedId: freezed == freelancerPickedId ? _self.freelancerPickedId : freelancerPickedId // ignore: cast_nullable_to_non_nullable
as String?,applicationsCount: null == applicationsCount ? _self.applicationsCount : applicationsCount // ignore: cast_nullable_to_non_nullable
as int,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestPhotoModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestDetailModel].
extension ServiceRequestDetailModelPatterns on ServiceRequestDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  String location,  String status,  double? price, @JsonKey(fromJson: stringFromJson)  String clientId, @JsonKey(fromJson: stringFromJson)  String? freelancerPickedId,  int applicationsCount,  List<ServiceRequestPhotoModel> photos, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestDetailModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.location,_that.status,_that.price,_that.clientId,_that.freelancerPickedId,_that.applicationsCount,_that.photos,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  String location,  String status,  double? price, @JsonKey(fromJson: stringFromJson)  String clientId, @JsonKey(fromJson: stringFromJson)  String? freelancerPickedId,  int applicationsCount,  List<ServiceRequestPhotoModel> photos, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestDetailModel():
return $default(_that.id,_that.title,_that.description,_that.location,_that.status,_that.price,_that.clientId,_that.freelancerPickedId,_that.applicationsCount,_that.photos,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  String location,  String status,  double? price, @JsonKey(fromJson: stringFromJson)  String clientId, @JsonKey(fromJson: stringFromJson)  String? freelancerPickedId,  int applicationsCount,  List<ServiceRequestPhotoModel> photos, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson)  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestDetailModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.location,_that.status,_that.price,_that.clientId,_that.freelancerPickedId,_that.applicationsCount,_that.photos,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestDetailModel extends ServiceRequestDetailModel {
  const _ServiceRequestDetailModel({@JsonKey(fromJson: stringFromJson) required this.id, required this.title, required this.description, required this.location, required this.status, this.price, @JsonKey(fromJson: stringFromJson) required this.clientId, @JsonKey(fromJson: stringFromJson) this.freelancerPickedId, this.applicationsCount = 0,  List<ServiceRequestPhotoModel> photos = const <ServiceRequestPhotoModel>[], @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.createdAt, @JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) this.updatedAt}): _photos = photos,super._();
  factory _ServiceRequestDetailModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestDetailModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override final  String title;
@override final  String description;
@override final  String location;
@override final  String status;
@override final  double? price;
@override@JsonKey(fromJson: stringFromJson) final  String clientId;
@override@JsonKey(fromJson: stringFromJson) final  String? freelancerPickedId;
@override@JsonKey() final  int applicationsCount;
 final  List<ServiceRequestPhotoModel> _photos;
@override@JsonKey() List<ServiceRequestPhotoModel> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime createdAt;
@override@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) final  DateTime? updatedAt;

/// Create a copy of ServiceRequestDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestDetailModelCopyWith<_ServiceRequestDetailModel> get copyWith => __$ServiceRequestDetailModelCopyWithImpl<_ServiceRequestDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestDetailModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.price, price) || other.price == price)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.freelancerPickedId, freelancerPickedId) || other.freelancerPickedId == freelancerPickedId)&&(identical(other.applicationsCount, applicationsCount) || other.applicationsCount == applicationsCount)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,location,status,price,clientId,freelancerPickedId,applicationsCount,const DeepCollectionEquality().hash(_photos),createdAt,updatedAt);

@override
String toString() {
  return 'ServiceRequestDetailModel(id: $id, title: $title, description: $description, location: $location, status: $status, price: $price, clientId: $clientId, freelancerPickedId: $freelancerPickedId, applicationsCount: $applicationsCount, photos: $photos, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestDetailModelCopyWith<$Res> implements $ServiceRequestDetailModelCopyWith<$Res> {
  factory _$ServiceRequestDetailModelCopyWith(_ServiceRequestDetailModel value, $Res Function(_ServiceRequestDetailModel) _then) = __$ServiceRequestDetailModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String title, String description, String location, String status, double? price,@JsonKey(fromJson: stringFromJson) String clientId,@JsonKey(fromJson: stringFromJson) String? freelancerPickedId, int applicationsCount, List<ServiceRequestPhotoModel> photos,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt,@JsonKey(fromJson: _nullableDateTimeFromJson, toJson: _nullableDateTimeToJson) DateTime? updatedAt
});




}
/// @nodoc
class __$ServiceRequestDetailModelCopyWithImpl<$Res>
    implements _$ServiceRequestDetailModelCopyWith<$Res> {
  __$ServiceRequestDetailModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestDetailModel _self;
  final $Res Function(_ServiceRequestDetailModel) _then;

/// Create a copy of ServiceRequestDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? location = null,Object? status = null,Object? price = freezed,Object? clientId = null,Object? freelancerPickedId = freezed,Object? applicationsCount = null,Object? photos = null,Object? createdAt = null,Object? updatedAt = freezed,}) {
  return _then(_ServiceRequestDetailModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,freelancerPickedId: freezed == freelancerPickedId ? _self.freelancerPickedId : freelancerPickedId // ignore: cast_nullable_to_non_nullable
as String?,applicationsCount: null == applicationsCount ? _self.applicationsCount : applicationsCount // ignore: cast_nullable_to_non_nullable
as int,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestPhotoModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
