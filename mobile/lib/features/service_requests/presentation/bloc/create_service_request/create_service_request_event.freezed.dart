// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_service_request_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateServiceRequestEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateServiceRequestEvent()';
}


}

/// @nodoc
class $CreateServiceRequestEventCopyWith<$Res>  {
$CreateServiceRequestEventCopyWith(CreateServiceRequestEvent _, $Res Function(CreateServiceRequestEvent) __);
}


/// Adds pattern-matching-related methods to [CreateServiceRequestEvent].
extension CreateServiceRequestEventPatterns on CreateServiceRequestEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateServiceRequestStarted value)?  started,TResult Function( CreateServiceRequestStepOneSubmitted value)?  stepOneSubmitted,TResult Function( CreateServiceRequestStepTwoSubmitted value)?  stepTwoSubmitted,TResult Function( CreateServiceRequestStepThreeSubmitted value)?  stepThreeSubmitted,TResult Function( CreateServiceRequestBackRequested value)?  backRequested,TResult Function( CreateServiceRequestResetRequested value)?  resetRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateServiceRequestStarted() when started != null:
return started(_that);case CreateServiceRequestStepOneSubmitted() when stepOneSubmitted != null:
return stepOneSubmitted(_that);case CreateServiceRequestStepTwoSubmitted() when stepTwoSubmitted != null:
return stepTwoSubmitted(_that);case CreateServiceRequestStepThreeSubmitted() when stepThreeSubmitted != null:
return stepThreeSubmitted(_that);case CreateServiceRequestBackRequested() when backRequested != null:
return backRequested(_that);case CreateServiceRequestResetRequested() when resetRequested != null:
return resetRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateServiceRequestStarted value)  started,required TResult Function( CreateServiceRequestStepOneSubmitted value)  stepOneSubmitted,required TResult Function( CreateServiceRequestStepTwoSubmitted value)  stepTwoSubmitted,required TResult Function( CreateServiceRequestStepThreeSubmitted value)  stepThreeSubmitted,required TResult Function( CreateServiceRequestBackRequested value)  backRequested,required TResult Function( CreateServiceRequestResetRequested value)  resetRequested,}){
final _that = this;
switch (_that) {
case CreateServiceRequestStarted():
return started(_that);case CreateServiceRequestStepOneSubmitted():
return stepOneSubmitted(_that);case CreateServiceRequestStepTwoSubmitted():
return stepTwoSubmitted(_that);case CreateServiceRequestStepThreeSubmitted():
return stepThreeSubmitted(_that);case CreateServiceRequestBackRequested():
return backRequested(_that);case CreateServiceRequestResetRequested():
return resetRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateServiceRequestStarted value)?  started,TResult? Function( CreateServiceRequestStepOneSubmitted value)?  stepOneSubmitted,TResult? Function( CreateServiceRequestStepTwoSubmitted value)?  stepTwoSubmitted,TResult? Function( CreateServiceRequestStepThreeSubmitted value)?  stepThreeSubmitted,TResult? Function( CreateServiceRequestBackRequested value)?  backRequested,TResult? Function( CreateServiceRequestResetRequested value)?  resetRequested,}){
final _that = this;
switch (_that) {
case CreateServiceRequestStarted() when started != null:
return started(_that);case CreateServiceRequestStepOneSubmitted() when stepOneSubmitted != null:
return stepOneSubmitted(_that);case CreateServiceRequestStepTwoSubmitted() when stepTwoSubmitted != null:
return stepTwoSubmitted(_that);case CreateServiceRequestStepThreeSubmitted() when stepThreeSubmitted != null:
return stepThreeSubmitted(_that);case CreateServiceRequestBackRequested() when backRequested != null:
return backRequested(_that);case CreateServiceRequestResetRequested() when resetRequested != null:
return resetRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String title,  String description)?  stepOneSubmitted,TResult Function( String location,  double? price)?  stepTwoSubmitted,TResult Function( List<ServiceRequestPhotoInput> photos)?  stepThreeSubmitted,TResult Function()?  backRequested,TResult Function()?  resetRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateServiceRequestStarted() when started != null:
return started();case CreateServiceRequestStepOneSubmitted() when stepOneSubmitted != null:
return stepOneSubmitted(_that.title,_that.description);case CreateServiceRequestStepTwoSubmitted() when stepTwoSubmitted != null:
return stepTwoSubmitted(_that.location,_that.price);case CreateServiceRequestStepThreeSubmitted() when stepThreeSubmitted != null:
return stepThreeSubmitted(_that.photos);case CreateServiceRequestBackRequested() when backRequested != null:
return backRequested();case CreateServiceRequestResetRequested() when resetRequested != null:
return resetRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String title,  String description)  stepOneSubmitted,required TResult Function( String location,  double? price)  stepTwoSubmitted,required TResult Function( List<ServiceRequestPhotoInput> photos)  stepThreeSubmitted,required TResult Function()  backRequested,required TResult Function()  resetRequested,}) {final _that = this;
switch (_that) {
case CreateServiceRequestStarted():
return started();case CreateServiceRequestStepOneSubmitted():
return stepOneSubmitted(_that.title,_that.description);case CreateServiceRequestStepTwoSubmitted():
return stepTwoSubmitted(_that.location,_that.price);case CreateServiceRequestStepThreeSubmitted():
return stepThreeSubmitted(_that.photos);case CreateServiceRequestBackRequested():
return backRequested();case CreateServiceRequestResetRequested():
return resetRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String title,  String description)?  stepOneSubmitted,TResult? Function( String location,  double? price)?  stepTwoSubmitted,TResult? Function( List<ServiceRequestPhotoInput> photos)?  stepThreeSubmitted,TResult? Function()?  backRequested,TResult? Function()?  resetRequested,}) {final _that = this;
switch (_that) {
case CreateServiceRequestStarted() when started != null:
return started();case CreateServiceRequestStepOneSubmitted() when stepOneSubmitted != null:
return stepOneSubmitted(_that.title,_that.description);case CreateServiceRequestStepTwoSubmitted() when stepTwoSubmitted != null:
return stepTwoSubmitted(_that.location,_that.price);case CreateServiceRequestStepThreeSubmitted() when stepThreeSubmitted != null:
return stepThreeSubmitted(_that.photos);case CreateServiceRequestBackRequested() when backRequested != null:
return backRequested();case CreateServiceRequestResetRequested() when resetRequested != null:
return resetRequested();case _:
  return null;

}
}

}

/// @nodoc


class CreateServiceRequestStarted implements CreateServiceRequestEvent {
  const CreateServiceRequestStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateServiceRequestEvent.started()';
}


}




/// @nodoc


class CreateServiceRequestStepOneSubmitted implements CreateServiceRequestEvent {
  const CreateServiceRequestStepOneSubmitted({required this.title, required this.description});
  

 final  String title;
 final  String description;

/// Create a copy of CreateServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateServiceRequestStepOneSubmittedCopyWith<CreateServiceRequestStepOneSubmitted> get copyWith => _$CreateServiceRequestStepOneSubmittedCopyWithImpl<CreateServiceRequestStepOneSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestStepOneSubmitted&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'CreateServiceRequestEvent.stepOneSubmitted(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $CreateServiceRequestStepOneSubmittedCopyWith<$Res> implements $CreateServiceRequestEventCopyWith<$Res> {
  factory $CreateServiceRequestStepOneSubmittedCopyWith(CreateServiceRequestStepOneSubmitted value, $Res Function(CreateServiceRequestStepOneSubmitted) _then) = _$CreateServiceRequestStepOneSubmittedCopyWithImpl;
@useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class _$CreateServiceRequestStepOneSubmittedCopyWithImpl<$Res>
    implements $CreateServiceRequestStepOneSubmittedCopyWith<$Res> {
  _$CreateServiceRequestStepOneSubmittedCopyWithImpl(this._self, this._then);

  final CreateServiceRequestStepOneSubmitted _self;
  final $Res Function(CreateServiceRequestStepOneSubmitted) _then;

/// Create a copy of CreateServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,}) {
  return _then(CreateServiceRequestStepOneSubmitted(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreateServiceRequestStepTwoSubmitted implements CreateServiceRequestEvent {
  const CreateServiceRequestStepTwoSubmitted({required this.location, this.price});
  

 final  String location;
 final  double? price;

/// Create a copy of CreateServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateServiceRequestStepTwoSubmittedCopyWith<CreateServiceRequestStepTwoSubmitted> get copyWith => _$CreateServiceRequestStepTwoSubmittedCopyWithImpl<CreateServiceRequestStepTwoSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestStepTwoSubmitted&&(identical(other.location, location) || other.location == location)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,location,price);

@override
String toString() {
  return 'CreateServiceRequestEvent.stepTwoSubmitted(location: $location, price: $price)';
}


}

/// @nodoc
abstract mixin class $CreateServiceRequestStepTwoSubmittedCopyWith<$Res> implements $CreateServiceRequestEventCopyWith<$Res> {
  factory $CreateServiceRequestStepTwoSubmittedCopyWith(CreateServiceRequestStepTwoSubmitted value, $Res Function(CreateServiceRequestStepTwoSubmitted) _then) = _$CreateServiceRequestStepTwoSubmittedCopyWithImpl;
@useResult
$Res call({
 String location, double? price
});




}
/// @nodoc
class _$CreateServiceRequestStepTwoSubmittedCopyWithImpl<$Res>
    implements $CreateServiceRequestStepTwoSubmittedCopyWith<$Res> {
  _$CreateServiceRequestStepTwoSubmittedCopyWithImpl(this._self, this._then);

  final CreateServiceRequestStepTwoSubmitted _self;
  final $Res Function(CreateServiceRequestStepTwoSubmitted) _then;

/// Create a copy of CreateServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? location = null,Object? price = freezed,}) {
  return _then(CreateServiceRequestStepTwoSubmitted(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc


class CreateServiceRequestStepThreeSubmitted implements CreateServiceRequestEvent {
  const CreateServiceRequestStepThreeSubmitted({required  List<ServiceRequestPhotoInput> photos}): _photos = photos;
  

 final  List<ServiceRequestPhotoInput> _photos;
 List<ServiceRequestPhotoInput> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}


/// Create a copy of CreateServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateServiceRequestStepThreeSubmittedCopyWith<CreateServiceRequestStepThreeSubmitted> get copyWith => _$CreateServiceRequestStepThreeSubmittedCopyWithImpl<CreateServiceRequestStepThreeSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestStepThreeSubmitted&&const DeepCollectionEquality().equals(other._photos, _photos));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_photos));

@override
String toString() {
  return 'CreateServiceRequestEvent.stepThreeSubmitted(photos: $photos)';
}


}

/// @nodoc
abstract mixin class $CreateServiceRequestStepThreeSubmittedCopyWith<$Res> implements $CreateServiceRequestEventCopyWith<$Res> {
  factory $CreateServiceRequestStepThreeSubmittedCopyWith(CreateServiceRequestStepThreeSubmitted value, $Res Function(CreateServiceRequestStepThreeSubmitted) _then) = _$CreateServiceRequestStepThreeSubmittedCopyWithImpl;
@useResult
$Res call({
 List<ServiceRequestPhotoInput> photos
});




}
/// @nodoc
class _$CreateServiceRequestStepThreeSubmittedCopyWithImpl<$Res>
    implements $CreateServiceRequestStepThreeSubmittedCopyWith<$Res> {
  _$CreateServiceRequestStepThreeSubmittedCopyWithImpl(this._self, this._then);

  final CreateServiceRequestStepThreeSubmitted _self;
  final $Res Function(CreateServiceRequestStepThreeSubmitted) _then;

/// Create a copy of CreateServiceRequestEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? photos = null,}) {
  return _then(CreateServiceRequestStepThreeSubmitted(
photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestPhotoInput>,
  ));
}


}

/// @nodoc


class CreateServiceRequestBackRequested implements CreateServiceRequestEvent {
  const CreateServiceRequestBackRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestBackRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateServiceRequestEvent.backRequested()';
}


}




/// @nodoc


class CreateServiceRequestResetRequested implements CreateServiceRequestEvent {
  const CreateServiceRequestResetRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateServiceRequestResetRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateServiceRequestEvent.resetRequested()';
}


}




// dart format on
