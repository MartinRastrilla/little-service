// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_service_requests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyServiceRequestsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyServiceRequestsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyServiceRequestsState()';
}


}

/// @nodoc
class $MyServiceRequestsStateCopyWith<$Res>  {
$MyServiceRequestsStateCopyWith(MyServiceRequestsState _, $Res Function(MyServiceRequestsState) __);
}


/// Adds pattern-matching-related methods to [MyServiceRequestsState].
extension MyServiceRequestsStatePatterns on MyServiceRequestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MyServiceRequestsInitial value)?  initial,TResult Function( MyServiceRequestsLoading value)?  loading,TResult Function( MyServiceRequestsLoaded value)?  loaded,TResult Function( MyServiceRequestsEmpty value)?  empty,TResult Function( MyServiceRequestsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MyServiceRequestsInitial() when initial != null:
return initial(_that);case MyServiceRequestsLoading() when loading != null:
return loading(_that);case MyServiceRequestsLoaded() when loaded != null:
return loaded(_that);case MyServiceRequestsEmpty() when empty != null:
return empty(_that);case MyServiceRequestsFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MyServiceRequestsInitial value)  initial,required TResult Function( MyServiceRequestsLoading value)  loading,required TResult Function( MyServiceRequestsLoaded value)  loaded,required TResult Function( MyServiceRequestsEmpty value)  empty,required TResult Function( MyServiceRequestsFailure value)  failure,}){
final _that = this;
switch (_that) {
case MyServiceRequestsInitial():
return initial(_that);case MyServiceRequestsLoading():
return loading(_that);case MyServiceRequestsLoaded():
return loaded(_that);case MyServiceRequestsEmpty():
return empty(_that);case MyServiceRequestsFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MyServiceRequestsInitial value)?  initial,TResult? Function( MyServiceRequestsLoading value)?  loading,TResult? Function( MyServiceRequestsLoaded value)?  loaded,TResult? Function( MyServiceRequestsEmpty value)?  empty,TResult? Function( MyServiceRequestsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case MyServiceRequestsInitial() when initial != null:
return initial(_that);case MyServiceRequestsLoading() when loading != null:
return loading(_that);case MyServiceRequestsLoaded() when loaded != null:
return loaded(_that);case MyServiceRequestsEmpty() when empty != null:
return empty(_that);case MyServiceRequestsFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ServiceRequestSummary> requests)?  loaded,TResult Function()?  empty,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MyServiceRequestsInitial() when initial != null:
return initial();case MyServiceRequestsLoading() when loading != null:
return loading();case MyServiceRequestsLoaded() when loaded != null:
return loaded(_that.requests);case MyServiceRequestsEmpty() when empty != null:
return empty();case MyServiceRequestsFailure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ServiceRequestSummary> requests)  loaded,required TResult Function()  empty,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case MyServiceRequestsInitial():
return initial();case MyServiceRequestsLoading():
return loading();case MyServiceRequestsLoaded():
return loaded(_that.requests);case MyServiceRequestsEmpty():
return empty();case MyServiceRequestsFailure():
return failure(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ServiceRequestSummary> requests)?  loaded,TResult? Function()?  empty,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case MyServiceRequestsInitial() when initial != null:
return initial();case MyServiceRequestsLoading() when loading != null:
return loading();case MyServiceRequestsLoaded() when loaded != null:
return loaded(_that.requests);case MyServiceRequestsEmpty() when empty != null:
return empty();case MyServiceRequestsFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class MyServiceRequestsInitial implements MyServiceRequestsState {
  const MyServiceRequestsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyServiceRequestsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyServiceRequestsState.initial()';
}


}




/// @nodoc


class MyServiceRequestsLoading implements MyServiceRequestsState {
  const MyServiceRequestsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyServiceRequestsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyServiceRequestsState.loading()';
}


}




/// @nodoc


class MyServiceRequestsLoaded implements MyServiceRequestsState {
  const MyServiceRequestsLoaded({required  List<ServiceRequestSummary> requests}): _requests = requests;
  

 final  List<ServiceRequestSummary> _requests;
 List<ServiceRequestSummary> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}


/// Create a copy of MyServiceRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyServiceRequestsLoadedCopyWith<MyServiceRequestsLoaded> get copyWith => _$MyServiceRequestsLoadedCopyWithImpl<MyServiceRequestsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyServiceRequestsLoaded&&const DeepCollectionEquality().equals(other._requests, _requests));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_requests));

@override
String toString() {
  return 'MyServiceRequestsState.loaded(requests: $requests)';
}


}

/// @nodoc
abstract mixin class $MyServiceRequestsLoadedCopyWith<$Res> implements $MyServiceRequestsStateCopyWith<$Res> {
  factory $MyServiceRequestsLoadedCopyWith(MyServiceRequestsLoaded value, $Res Function(MyServiceRequestsLoaded) _then) = _$MyServiceRequestsLoadedCopyWithImpl;
@useResult
$Res call({
 List<ServiceRequestSummary> requests
});




}
/// @nodoc
class _$MyServiceRequestsLoadedCopyWithImpl<$Res>
    implements $MyServiceRequestsLoadedCopyWith<$Res> {
  _$MyServiceRequestsLoadedCopyWithImpl(this._self, this._then);

  final MyServiceRequestsLoaded _self;
  final $Res Function(MyServiceRequestsLoaded) _then;

/// Create a copy of MyServiceRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requests = null,}) {
  return _then(MyServiceRequestsLoaded(
requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestSummary>,
  ));
}


}

/// @nodoc


class MyServiceRequestsEmpty implements MyServiceRequestsState {
  const MyServiceRequestsEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyServiceRequestsEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyServiceRequestsState.empty()';
}


}




/// @nodoc


class MyServiceRequestsFailure implements MyServiceRequestsState {
  const MyServiceRequestsFailure({required this.message});
  

 final  String message;

/// Create a copy of MyServiceRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyServiceRequestsFailureCopyWith<MyServiceRequestsFailure> get copyWith => _$MyServiceRequestsFailureCopyWithImpl<MyServiceRequestsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyServiceRequestsFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MyServiceRequestsState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $MyServiceRequestsFailureCopyWith<$Res> implements $MyServiceRequestsStateCopyWith<$Res> {
  factory $MyServiceRequestsFailureCopyWith(MyServiceRequestsFailure value, $Res Function(MyServiceRequestsFailure) _then) = _$MyServiceRequestsFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MyServiceRequestsFailureCopyWithImpl<$Res>
    implements $MyServiceRequestsFailureCopyWith<$Res> {
  _$MyServiceRequestsFailureCopyWithImpl(this._self, this._then);

  final MyServiceRequestsFailure _self;
  final $Res Function(MyServiceRequestsFailure) _then;

/// Create a copy of MyServiceRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MyServiceRequestsFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
