// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_service_request_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditServiceRequestEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditServiceRequestEvent()';
}


}

/// @nodoc
class $EditServiceRequestEventCopyWith<$Res>  {
$EditServiceRequestEventCopyWith(EditServiceRequestEvent _, $Res Function(EditServiceRequestEvent) __);
}


/// Adds pattern-matching-related methods to [EditServiceRequestEvent].
extension EditServiceRequestEventPatterns on EditServiceRequestEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EditServiceRequestStarted value)?  started,TResult Function( EditServiceRequestFieldChanged value)?  fieldChanged,TResult Function( EditServiceRequestBudgetModeChanged value)?  budgetModeChanged,TResult Function( EditServiceRequestPhotosChanged value)?  photosChanged,TResult Function( EditServiceRequestSaveRequested value)?  saveRequested,TResult Function( EditServiceRequestCancelRequested value)?  cancelRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EditServiceRequestStarted() when started != null:
return started(_that);case EditServiceRequestFieldChanged() when fieldChanged != null:
return fieldChanged(_that);case EditServiceRequestBudgetModeChanged() when budgetModeChanged != null:
return budgetModeChanged(_that);case EditServiceRequestPhotosChanged() when photosChanged != null:
return photosChanged(_that);case EditServiceRequestSaveRequested() when saveRequested != null:
return saveRequested(_that);case EditServiceRequestCancelRequested() when cancelRequested != null:
return cancelRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EditServiceRequestStarted value)  started,required TResult Function( EditServiceRequestFieldChanged value)  fieldChanged,required TResult Function( EditServiceRequestBudgetModeChanged value)  budgetModeChanged,required TResult Function( EditServiceRequestPhotosChanged value)  photosChanged,required TResult Function( EditServiceRequestSaveRequested value)  saveRequested,required TResult Function( EditServiceRequestCancelRequested value)  cancelRequested,}){
final _that = this;
switch (_that) {
case EditServiceRequestStarted():
return started(_that);case EditServiceRequestFieldChanged():
return fieldChanged(_that);case EditServiceRequestBudgetModeChanged():
return budgetModeChanged(_that);case EditServiceRequestPhotosChanged():
return photosChanged(_that);case EditServiceRequestSaveRequested():
return saveRequested(_that);case EditServiceRequestCancelRequested():
return cancelRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EditServiceRequestStarted value)?  started,TResult? Function( EditServiceRequestFieldChanged value)?  fieldChanged,TResult? Function( EditServiceRequestBudgetModeChanged value)?  budgetModeChanged,TResult? Function( EditServiceRequestPhotosChanged value)?  photosChanged,TResult? Function( EditServiceRequestSaveRequested value)?  saveRequested,TResult? Function( EditServiceRequestCancelRequested value)?  cancelRequested,}){
final _that = this;
switch (_that) {
case EditServiceRequestStarted() when started != null:
return started(_that);case EditServiceRequestFieldChanged() when fieldChanged != null:
return fieldChanged(_that);case EditServiceRequestBudgetModeChanged() when budgetModeChanged != null:
return budgetModeChanged(_that);case EditServiceRequestPhotosChanged() when photosChanged != null:
return photosChanged(_that);case EditServiceRequestSaveRequested() when saveRequested != null:
return saveRequested(_that);case EditServiceRequestCancelRequested() when cancelRequested != null:
return cancelRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String serviceRequestId)?  started,TResult Function( String? title,  String? description,  String? location)?  fieldChanged,TResult Function( ServiceRequestPriceMode priceMode,  double? price)?  budgetModeChanged,TResult Function( List<String> deletedPhotoIds,  List<ServiceRequestPhotoInput> newPhotos)?  photosChanged,TResult Function( String title,  String description,  String location,  ServiceRequestPriceMode priceMode,  double? price)?  saveRequested,TResult Function()?  cancelRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EditServiceRequestStarted() when started != null:
return started(_that.serviceRequestId);case EditServiceRequestFieldChanged() when fieldChanged != null:
return fieldChanged(_that.title,_that.description,_that.location);case EditServiceRequestBudgetModeChanged() when budgetModeChanged != null:
return budgetModeChanged(_that.priceMode,_that.price);case EditServiceRequestPhotosChanged() when photosChanged != null:
return photosChanged(_that.deletedPhotoIds,_that.newPhotos);case EditServiceRequestSaveRequested() when saveRequested != null:
return saveRequested(_that.title,_that.description,_that.location,_that.priceMode,_that.price);case EditServiceRequestCancelRequested() when cancelRequested != null:
return cancelRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String serviceRequestId)  started,required TResult Function( String? title,  String? description,  String? location)  fieldChanged,required TResult Function( ServiceRequestPriceMode priceMode,  double? price)  budgetModeChanged,required TResult Function( List<String> deletedPhotoIds,  List<ServiceRequestPhotoInput> newPhotos)  photosChanged,required TResult Function( String title,  String description,  String location,  ServiceRequestPriceMode priceMode,  double? price)  saveRequested,required TResult Function()  cancelRequested,}) {final _that = this;
switch (_that) {
case EditServiceRequestStarted():
return started(_that.serviceRequestId);case EditServiceRequestFieldChanged():
return fieldChanged(_that.title,_that.description,_that.location);case EditServiceRequestBudgetModeChanged():
return budgetModeChanged(_that.priceMode,_that.price);case EditServiceRequestPhotosChanged():
return photosChanged(_that.deletedPhotoIds,_that.newPhotos);case EditServiceRequestSaveRequested():
return saveRequested(_that.title,_that.description,_that.location,_that.priceMode,_that.price);case EditServiceRequestCancelRequested():
return cancelRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String serviceRequestId)?  started,TResult? Function( String? title,  String? description,  String? location)?  fieldChanged,TResult? Function( ServiceRequestPriceMode priceMode,  double? price)?  budgetModeChanged,TResult? Function( List<String> deletedPhotoIds,  List<ServiceRequestPhotoInput> newPhotos)?  photosChanged,TResult? Function( String title,  String description,  String location,  ServiceRequestPriceMode priceMode,  double? price)?  saveRequested,TResult? Function()?  cancelRequested,}) {final _that = this;
switch (_that) {
case EditServiceRequestStarted() when started != null:
return started(_that.serviceRequestId);case EditServiceRequestFieldChanged() when fieldChanged != null:
return fieldChanged(_that.title,_that.description,_that.location);case EditServiceRequestBudgetModeChanged() when budgetModeChanged != null:
return budgetModeChanged(_that.priceMode,_that.price);case EditServiceRequestPhotosChanged() when photosChanged != null:
return photosChanged(_that.deletedPhotoIds,_that.newPhotos);case EditServiceRequestSaveRequested() when saveRequested != null:
return saveRequested(_that.title,_that.description,_that.location,_that.priceMode,_that.price);case EditServiceRequestCancelRequested() when cancelRequested != null:
return cancelRequested();case _:
  return null;

}
}

}

/// @nodoc


class EditServiceRequestStarted implements EditServiceRequestEvent {
  const EditServiceRequestStarted({required this.serviceRequestId});
  

 final  String serviceRequestId;

/// Create a copy of EditServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditServiceRequestStartedCopyWith<EditServiceRequestStarted> get copyWith => _$EditServiceRequestStartedCopyWithImpl<EditServiceRequestStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestStarted&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId));
}


@override
int get hashCode => Object.hash(runtimeType,serviceRequestId);

@override
String toString() {
  return 'EditServiceRequestEvent.started(serviceRequestId: $serviceRequestId)';
}


}

/// @nodoc
abstract mixin class $EditServiceRequestStartedCopyWith<$Res> implements $EditServiceRequestEventCopyWith<$Res> {
  factory $EditServiceRequestStartedCopyWith(EditServiceRequestStarted value, $Res Function(EditServiceRequestStarted) _then) = _$EditServiceRequestStartedCopyWithImpl;
@useResult
$Res call({
 String serviceRequestId
});




}
/// @nodoc
class _$EditServiceRequestStartedCopyWithImpl<$Res>
    implements $EditServiceRequestStartedCopyWith<$Res> {
  _$EditServiceRequestStartedCopyWithImpl(this._self, this._then);

  final EditServiceRequestStarted _self;
  final $Res Function(EditServiceRequestStarted) _then;

/// Create a copy of EditServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceRequestId = null,}) {
  return _then(EditServiceRequestStarted(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class EditServiceRequestFieldChanged implements EditServiceRequestEvent {
  const EditServiceRequestFieldChanged({this.title, this.description, this.location});
  

 final  String? title;
 final  String? description;
 final  String? location;

/// Create a copy of EditServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditServiceRequestFieldChangedCopyWith<EditServiceRequestFieldChanged> get copyWith => _$EditServiceRequestFieldChangedCopyWithImpl<EditServiceRequestFieldChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestFieldChanged&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,location);

@override
String toString() {
  return 'EditServiceRequestEvent.fieldChanged(title: $title, description: $description, location: $location)';
}


}

/// @nodoc
abstract mixin class $EditServiceRequestFieldChangedCopyWith<$Res> implements $EditServiceRequestEventCopyWith<$Res> {
  factory $EditServiceRequestFieldChangedCopyWith(EditServiceRequestFieldChanged value, $Res Function(EditServiceRequestFieldChanged) _then) = _$EditServiceRequestFieldChangedCopyWithImpl;
@useResult
$Res call({
 String? title, String? description, String? location
});




}
/// @nodoc
class _$EditServiceRequestFieldChangedCopyWithImpl<$Res>
    implements $EditServiceRequestFieldChangedCopyWith<$Res> {
  _$EditServiceRequestFieldChangedCopyWithImpl(this._self, this._then);

  final EditServiceRequestFieldChanged _self;
  final $Res Function(EditServiceRequestFieldChanged) _then;

/// Create a copy of EditServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? description = freezed,Object? location = freezed,}) {
  return _then(EditServiceRequestFieldChanged(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class EditServiceRequestBudgetModeChanged implements EditServiceRequestEvent {
  const EditServiceRequestBudgetModeChanged({required this.priceMode, this.price});
  

 final  ServiceRequestPriceMode priceMode;
 final  double? price;

/// Create a copy of EditServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditServiceRequestBudgetModeChangedCopyWith<EditServiceRequestBudgetModeChanged> get copyWith => _$EditServiceRequestBudgetModeChangedCopyWithImpl<EditServiceRequestBudgetModeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestBudgetModeChanged&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,priceMode,price);

@override
String toString() {
  return 'EditServiceRequestEvent.budgetModeChanged(priceMode: $priceMode, price: $price)';
}


}

/// @nodoc
abstract mixin class $EditServiceRequestBudgetModeChangedCopyWith<$Res> implements $EditServiceRequestEventCopyWith<$Res> {
  factory $EditServiceRequestBudgetModeChangedCopyWith(EditServiceRequestBudgetModeChanged value, $Res Function(EditServiceRequestBudgetModeChanged) _then) = _$EditServiceRequestBudgetModeChangedCopyWithImpl;
@useResult
$Res call({
 ServiceRequestPriceMode priceMode, double? price
});




}
/// @nodoc
class _$EditServiceRequestBudgetModeChangedCopyWithImpl<$Res>
    implements $EditServiceRequestBudgetModeChangedCopyWith<$Res> {
  _$EditServiceRequestBudgetModeChangedCopyWithImpl(this._self, this._then);

  final EditServiceRequestBudgetModeChanged _self;
  final $Res Function(EditServiceRequestBudgetModeChanged) _then;

/// Create a copy of EditServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? priceMode = null,Object? price = freezed,}) {
  return _then(EditServiceRequestBudgetModeChanged(
priceMode: null == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as ServiceRequestPriceMode,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc


class EditServiceRequestPhotosChanged implements EditServiceRequestEvent {
  const EditServiceRequestPhotosChanged({required  List<String> deletedPhotoIds, required  List<ServiceRequestPhotoInput> newPhotos}): _deletedPhotoIds = deletedPhotoIds,_newPhotos = newPhotos;
  

 final  List<String> _deletedPhotoIds;
 List<String> get deletedPhotoIds {
  if (_deletedPhotoIds is EqualUnmodifiableListView) return _deletedPhotoIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deletedPhotoIds);
}

 final  List<ServiceRequestPhotoInput> _newPhotos;
 List<ServiceRequestPhotoInput> get newPhotos {
  if (_newPhotos is EqualUnmodifiableListView) return _newPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newPhotos);
}


/// Create a copy of EditServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditServiceRequestPhotosChangedCopyWith<EditServiceRequestPhotosChanged> get copyWith => _$EditServiceRequestPhotosChangedCopyWithImpl<EditServiceRequestPhotosChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestPhotosChanged&&const DeepCollectionEquality().equals(other._deletedPhotoIds, _deletedPhotoIds)&&const DeepCollectionEquality().equals(other._newPhotos, _newPhotos));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_deletedPhotoIds),const DeepCollectionEquality().hash(_newPhotos));

@override
String toString() {
  return 'EditServiceRequestEvent.photosChanged(deletedPhotoIds: $deletedPhotoIds, newPhotos: $newPhotos)';
}


}

/// @nodoc
abstract mixin class $EditServiceRequestPhotosChangedCopyWith<$Res> implements $EditServiceRequestEventCopyWith<$Res> {
  factory $EditServiceRequestPhotosChangedCopyWith(EditServiceRequestPhotosChanged value, $Res Function(EditServiceRequestPhotosChanged) _then) = _$EditServiceRequestPhotosChangedCopyWithImpl;
@useResult
$Res call({
 List<String> deletedPhotoIds, List<ServiceRequestPhotoInput> newPhotos
});




}
/// @nodoc
class _$EditServiceRequestPhotosChangedCopyWithImpl<$Res>
    implements $EditServiceRequestPhotosChangedCopyWith<$Res> {
  _$EditServiceRequestPhotosChangedCopyWithImpl(this._self, this._then);

  final EditServiceRequestPhotosChanged _self;
  final $Res Function(EditServiceRequestPhotosChanged) _then;

/// Create a copy of EditServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? deletedPhotoIds = null,Object? newPhotos = null,}) {
  return _then(EditServiceRequestPhotosChanged(
deletedPhotoIds: null == deletedPhotoIds ? _self._deletedPhotoIds : deletedPhotoIds // ignore: cast_nullable_to_non_nullable
as List<String>,newPhotos: null == newPhotos ? _self._newPhotos : newPhotos // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestPhotoInput>,
  ));
}


}

/// @nodoc


class EditServiceRequestSaveRequested implements EditServiceRequestEvent {
  const EditServiceRequestSaveRequested({required this.title, required this.description, required this.location, required this.priceMode, this.price});
  

 final  String title;
 final  String description;
 final  String location;
 final  ServiceRequestPriceMode priceMode;
 final  double? price;

/// Create a copy of EditServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditServiceRequestSaveRequestedCopyWith<EditServiceRequestSaveRequested> get copyWith => _$EditServiceRequestSaveRequestedCopyWithImpl<EditServiceRequestSaveRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestSaveRequested&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,location,priceMode,price);

@override
String toString() {
  return 'EditServiceRequestEvent.saveRequested(title: $title, description: $description, location: $location, priceMode: $priceMode, price: $price)';
}


}

/// @nodoc
abstract mixin class $EditServiceRequestSaveRequestedCopyWith<$Res> implements $EditServiceRequestEventCopyWith<$Res> {
  factory $EditServiceRequestSaveRequestedCopyWith(EditServiceRequestSaveRequested value, $Res Function(EditServiceRequestSaveRequested) _then) = _$EditServiceRequestSaveRequestedCopyWithImpl;
@useResult
$Res call({
 String title, String description, String location, ServiceRequestPriceMode priceMode, double? price
});




}
/// @nodoc
class _$EditServiceRequestSaveRequestedCopyWithImpl<$Res>
    implements $EditServiceRequestSaveRequestedCopyWith<$Res> {
  _$EditServiceRequestSaveRequestedCopyWithImpl(this._self, this._then);

  final EditServiceRequestSaveRequested _self;
  final $Res Function(EditServiceRequestSaveRequested) _then;

/// Create a copy of EditServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? location = null,Object? priceMode = null,Object? price = freezed,}) {
  return _then(EditServiceRequestSaveRequested(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,priceMode: null == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as ServiceRequestPriceMode,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc


class EditServiceRequestCancelRequested implements EditServiceRequestEvent {
  const EditServiceRequestCancelRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditServiceRequestCancelRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EditServiceRequestEvent.cancelRequested()';
}


}




// dart format on
