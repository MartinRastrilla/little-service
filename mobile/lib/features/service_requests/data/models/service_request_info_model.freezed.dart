// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceRequestInfoPhotoModel {

@JsonKey(fromJson: stringFromJson) String get id; String get filePath;
/// Create a copy of ServiceRequestInfoPhotoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestInfoPhotoModelCopyWith<ServiceRequestInfoPhotoModel> get copyWith => _$ServiceRequestInfoPhotoModelCopyWithImpl<ServiceRequestInfoPhotoModel>(this as ServiceRequestInfoPhotoModel, _$identity);

  /// Serializes this ServiceRequestInfoPhotoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestInfoPhotoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filePath);

@override
String toString() {
  return 'ServiceRequestInfoPhotoModel(id: $id, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestInfoPhotoModelCopyWith<$Res>  {
  factory $ServiceRequestInfoPhotoModelCopyWith(ServiceRequestInfoPhotoModel value, $Res Function(ServiceRequestInfoPhotoModel) _then) = _$ServiceRequestInfoPhotoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String filePath
});




}
/// @nodoc
class _$ServiceRequestInfoPhotoModelCopyWithImpl<$Res>
    implements $ServiceRequestInfoPhotoModelCopyWith<$Res> {
  _$ServiceRequestInfoPhotoModelCopyWithImpl(this._self, this._then);

  final ServiceRequestInfoPhotoModel _self;
  final $Res Function(ServiceRequestInfoPhotoModel) _then;

/// Create a copy of ServiceRequestInfoPhotoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? filePath = null,}) {
  return _then(ServiceRequestInfoPhotoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestInfoPhotoModel].
extension ServiceRequestInfoPhotoModelPatterns on ServiceRequestInfoPhotoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestInfoPhotoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestInfoPhotoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestInfoPhotoModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestInfoPhotoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestInfoPhotoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestInfoPhotoModel() when $default != null:
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
case _ServiceRequestInfoPhotoModel() when $default != null:
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
case _ServiceRequestInfoPhotoModel():
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
case _ServiceRequestInfoPhotoModel() when $default != null:
return $default(_that.id,_that.filePath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestInfoPhotoModel implements ServiceRequestInfoPhotoModel {
  const _ServiceRequestInfoPhotoModel({@JsonKey(fromJson: stringFromJson) required this.id, required this.filePath});
  factory _ServiceRequestInfoPhotoModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestInfoPhotoModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override final  String filePath;

/// Create a copy of ServiceRequestInfoPhotoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestInfoPhotoModelCopyWith<_ServiceRequestInfoPhotoModel> get copyWith => __$ServiceRequestInfoPhotoModelCopyWithImpl<_ServiceRequestInfoPhotoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestInfoPhotoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestInfoPhotoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.filePath, filePath) || other.filePath == filePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,filePath);

@override
String toString() {
  return 'ServiceRequestInfoPhotoModel(id: $id, filePath: $filePath)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestInfoPhotoModelCopyWith<$Res> implements $ServiceRequestInfoPhotoModelCopyWith<$Res> {
  factory _$ServiceRequestInfoPhotoModelCopyWith(_ServiceRequestInfoPhotoModel value, $Res Function(_ServiceRequestInfoPhotoModel) _then) = __$ServiceRequestInfoPhotoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String filePath
});




}
/// @nodoc
class __$ServiceRequestInfoPhotoModelCopyWithImpl<$Res>
    implements _$ServiceRequestInfoPhotoModelCopyWith<$Res> {
  __$ServiceRequestInfoPhotoModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestInfoPhotoModel _self;
  final $Res Function(_ServiceRequestInfoPhotoModel) _then;

/// Create a copy of ServiceRequestInfoPhotoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? filePath = null,}) {
  return _then(_ServiceRequestInfoPhotoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ServiceRequestInfoModel {

@JsonKey(fromJson: stringFromJson) String get id; String get title; String get description; String get location; String get status; String get displayStatus; String? get contractStatus; double? get price; String get priceMode; bool get isEditable; bool get canCancel; String? get cancelBlockedReason; String? get editBlockedReason; int get messagesCount; int get applicationsCount; List<ServiceRequestInfoPhotoModel> get photos;@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime get createdAt;
/// Create a copy of ServiceRequestInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceRequestInfoModelCopyWith<ServiceRequestInfoModel> get copyWith => _$ServiceRequestInfoModelCopyWithImpl<ServiceRequestInfoModel>(this as ServiceRequestInfoModel, _$identity);

  /// Serializes this ServiceRequestInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceRequestInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus)&&(identical(other.contractStatus, contractStatus) || other.contractStatus == contractStatus)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.isEditable, isEditable) || other.isEditable == isEditable)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.cancelBlockedReason, cancelBlockedReason) || other.cancelBlockedReason == cancelBlockedReason)&&(identical(other.editBlockedReason, editBlockedReason) || other.editBlockedReason == editBlockedReason)&&(identical(other.messagesCount, messagesCount) || other.messagesCount == messagesCount)&&(identical(other.applicationsCount, applicationsCount) || other.applicationsCount == applicationsCount)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,location,status,displayStatus,contractStatus,price,priceMode,isEditable,canCancel,cancelBlockedReason,editBlockedReason,messagesCount,applicationsCount,const DeepCollectionEquality().hash(photos),createdAt);

@override
String toString() {
  return 'ServiceRequestInfoModel(id: $id, title: $title, description: $description, location: $location, status: $status, displayStatus: $displayStatus, contractStatus: $contractStatus, price: $price, priceMode: $priceMode, isEditable: $isEditable, canCancel: $canCancel, cancelBlockedReason: $cancelBlockedReason, editBlockedReason: $editBlockedReason, messagesCount: $messagesCount, applicationsCount: $applicationsCount, photos: $photos, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ServiceRequestInfoModelCopyWith<$Res>  {
  factory $ServiceRequestInfoModelCopyWith(ServiceRequestInfoModel value, $Res Function(ServiceRequestInfoModel) _then) = _$ServiceRequestInfoModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String title, String description, String location, String status, String displayStatus, String? contractStatus, double? price, String priceMode, bool isEditable, bool canCancel, String? cancelBlockedReason, String? editBlockedReason, int messagesCount, int applicationsCount, List<ServiceRequestInfoPhotoModel> photos,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt
});




}
/// @nodoc
class _$ServiceRequestInfoModelCopyWithImpl<$Res>
    implements $ServiceRequestInfoModelCopyWith<$Res> {
  _$ServiceRequestInfoModelCopyWithImpl(this._self, this._then);

  final ServiceRequestInfoModel _self;
  final $Res Function(ServiceRequestInfoModel) _then;

/// Create a copy of ServiceRequestInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? location = null,Object? status = null,Object? displayStatus = null,Object? contractStatus = freezed,Object? price = freezed,Object? priceMode = null,Object? isEditable = null,Object? canCancel = null,Object? cancelBlockedReason = freezed,Object? editBlockedReason = freezed,Object? messagesCount = null,Object? applicationsCount = null,Object? photos = null,Object? createdAt = null,}) {
  return _then(ServiceRequestInfoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayStatus: null == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String,contractStatus: freezed == contractStatus ? _self.contractStatus : contractStatus // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceMode: null == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String,isEditable: null == isEditable ? _self.isEditable : isEditable // ignore: cast_nullable_to_non_nullable
as bool,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,cancelBlockedReason: freezed == cancelBlockedReason ? _self.cancelBlockedReason : cancelBlockedReason // ignore: cast_nullable_to_non_nullable
as String?,editBlockedReason: freezed == editBlockedReason ? _self.editBlockedReason : editBlockedReason // ignore: cast_nullable_to_non_nullable
as String?,messagesCount: null == messagesCount ? _self.messagesCount : messagesCount // ignore: cast_nullable_to_non_nullable
as int,applicationsCount: null == applicationsCount ? _self.applicationsCount : applicationsCount // ignore: cast_nullable_to_non_nullable
as int,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestInfoPhotoModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceRequestInfoModel].
extension ServiceRequestInfoModelPatterns on ServiceRequestInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceRequestInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceRequestInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceRequestInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceRequestInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceRequestInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  String location,  String status,  String displayStatus,  String? contractStatus,  double? price,  String priceMode,  bool isEditable,  bool canCancel,  String? cancelBlockedReason,  String? editBlockedReason,  int messagesCount,  int applicationsCount,  List<ServiceRequestInfoPhotoModel> photos, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceRequestInfoModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.location,_that.status,_that.displayStatus,_that.contractStatus,_that.price,_that.priceMode,_that.isEditable,_that.canCancel,_that.cancelBlockedReason,_that.editBlockedReason,_that.messagesCount,_that.applicationsCount,_that.photos,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  String location,  String status,  String displayStatus,  String? contractStatus,  double? price,  String priceMode,  bool isEditable,  bool canCancel,  String? cancelBlockedReason,  String? editBlockedReason,  int messagesCount,  int applicationsCount,  List<ServiceRequestInfoPhotoModel> photos, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestInfoModel():
return $default(_that.id,_that.title,_that.description,_that.location,_that.status,_that.displayStatus,_that.contractStatus,_that.price,_that.priceMode,_that.isEditable,_that.canCancel,_that.cancelBlockedReason,_that.editBlockedReason,_that.messagesCount,_that.applicationsCount,_that.photos,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: stringFromJson)  String id,  String title,  String description,  String location,  String status,  String displayStatus,  String? contractStatus,  double? price,  String priceMode,  bool isEditable,  bool canCancel,  String? cancelBlockedReason,  String? editBlockedReason,  int messagesCount,  int applicationsCount,  List<ServiceRequestInfoPhotoModel> photos, @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ServiceRequestInfoModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.location,_that.status,_that.displayStatus,_that.contractStatus,_that.price,_that.priceMode,_that.isEditable,_that.canCancel,_that.cancelBlockedReason,_that.editBlockedReason,_that.messagesCount,_that.applicationsCount,_that.photos,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceRequestInfoModel extends ServiceRequestInfoModel {
  const _ServiceRequestInfoModel({@JsonKey(fromJson: stringFromJson) required this.id, required this.title, required this.description, required this.location, required this.status, required this.displayStatus, this.contractStatus, this.price, required this.priceMode, this.isEditable = false, this.canCancel = false, this.cancelBlockedReason, this.editBlockedReason, this.messagesCount = 0, this.applicationsCount = 0,  List<ServiceRequestInfoPhotoModel> photos = const <ServiceRequestInfoPhotoModel>[], @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) required this.createdAt}): _photos = photos,super._();
  factory _ServiceRequestInfoModel.fromJson(Map<String, dynamic> json) => _$ServiceRequestInfoModelFromJson(json);

@override@JsonKey(fromJson: stringFromJson) final  String id;
@override final  String title;
@override final  String description;
@override final  String location;
@override final  String status;
@override final  String displayStatus;
@override final  String? contractStatus;
@override final  double? price;
@override final  String priceMode;
@override@JsonKey() final  bool isEditable;
@override@JsonKey() final  bool canCancel;
@override final  String? cancelBlockedReason;
@override final  String? editBlockedReason;
@override@JsonKey() final  int messagesCount;
@override@JsonKey() final  int applicationsCount;
 final  List<ServiceRequestInfoPhotoModel> _photos;
@override@JsonKey() List<ServiceRequestInfoPhotoModel> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) final  DateTime createdAt;

/// Create a copy of ServiceRequestInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceRequestInfoModelCopyWith<_ServiceRequestInfoModel> get copyWith => __$ServiceRequestInfoModelCopyWithImpl<_ServiceRequestInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceRequestInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceRequestInfoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.status, status) || other.status == status)&&(identical(other.displayStatus, displayStatus) || other.displayStatus == displayStatus)&&(identical(other.contractStatus, contractStatus) || other.contractStatus == contractStatus)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.isEditable, isEditable) || other.isEditable == isEditable)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.cancelBlockedReason, cancelBlockedReason) || other.cancelBlockedReason == cancelBlockedReason)&&(identical(other.editBlockedReason, editBlockedReason) || other.editBlockedReason == editBlockedReason)&&(identical(other.messagesCount, messagesCount) || other.messagesCount == messagesCount)&&(identical(other.applicationsCount, applicationsCount) || other.applicationsCount == applicationsCount)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,location,status,displayStatus,contractStatus,price,priceMode,isEditable,canCancel,cancelBlockedReason,editBlockedReason,messagesCount,applicationsCount,const DeepCollectionEquality().hash(_photos),createdAt);

@override
String toString() {
  return 'ServiceRequestInfoModel(id: $id, title: $title, description: $description, location: $location, status: $status, displayStatus: $displayStatus, contractStatus: $contractStatus, price: $price, priceMode: $priceMode, isEditable: $isEditable, canCancel: $canCancel, cancelBlockedReason: $cancelBlockedReason, editBlockedReason: $editBlockedReason, messagesCount: $messagesCount, applicationsCount: $applicationsCount, photos: $photos, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ServiceRequestInfoModelCopyWith<$Res> implements $ServiceRequestInfoModelCopyWith<$Res> {
  factory _$ServiceRequestInfoModelCopyWith(_ServiceRequestInfoModel value, $Res Function(_ServiceRequestInfoModel) _then) = __$ServiceRequestInfoModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: stringFromJson) String id, String title, String description, String location, String status, String displayStatus, String? contractStatus, double? price, String priceMode, bool isEditable, bool canCancel, String? cancelBlockedReason, String? editBlockedReason, int messagesCount, int applicationsCount, List<ServiceRequestInfoPhotoModel> photos,@JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson) DateTime createdAt
});




}
/// @nodoc
class __$ServiceRequestInfoModelCopyWithImpl<$Res>
    implements _$ServiceRequestInfoModelCopyWith<$Res> {
  __$ServiceRequestInfoModelCopyWithImpl(this._self, this._then);

  final _ServiceRequestInfoModel _self;
  final $Res Function(_ServiceRequestInfoModel) _then;

/// Create a copy of ServiceRequestInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? location = null,Object? status = null,Object? displayStatus = null,Object? contractStatus = freezed,Object? price = freezed,Object? priceMode = null,Object? isEditable = null,Object? canCancel = null,Object? cancelBlockedReason = freezed,Object? editBlockedReason = freezed,Object? messagesCount = null,Object? applicationsCount = null,Object? photos = null,Object? createdAt = null,}) {
  return _then(_ServiceRequestInfoModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,displayStatus: null == displayStatus ? _self.displayStatus : displayStatus // ignore: cast_nullable_to_non_nullable
as String,contractStatus: freezed == contractStatus ? _self.contractStatus : contractStatus // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceMode: null == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String,isEditable: null == isEditable ? _self.isEditable : isEditable // ignore: cast_nullable_to_non_nullable
as bool,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,cancelBlockedReason: freezed == cancelBlockedReason ? _self.cancelBlockedReason : cancelBlockedReason // ignore: cast_nullable_to_non_nullable
as String?,editBlockedReason: freezed == editBlockedReason ? _self.editBlockedReason : editBlockedReason // ignore: cast_nullable_to_non_nullable
as String?,messagesCount: null == messagesCount ? _self.messagesCount : messagesCount // ignore: cast_nullable_to_non_nullable
as int,applicationsCount: null == applicationsCount ? _self.applicationsCount : applicationsCount // ignore: cast_nullable_to_non_nullable
as int,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestInfoPhotoModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
