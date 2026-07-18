// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelancer_home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FreelancerHomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerHomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerHomeState()';
}


}

/// @nodoc
class $FreelancerHomeStateCopyWith<$Res>  {
$FreelancerHomeStateCopyWith(FreelancerHomeState _, $Res Function(FreelancerHomeState) __);
}


/// Adds pattern-matching-related methods to [FreelancerHomeState].
extension FreelancerHomeStatePatterns on FreelancerHomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FreelancerHomeInitial value)?  initial,TResult Function( FreelancerHomeLoading value)?  loading,TResult Function( FreelancerHomeLoaded value)?  loaded,TResult Function( FreelancerHomeEmpty value)?  empty,TResult Function( FreelancerHomeFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FreelancerHomeInitial() when initial != null:
return initial(_that);case FreelancerHomeLoading() when loading != null:
return loading(_that);case FreelancerHomeLoaded() when loaded != null:
return loaded(_that);case FreelancerHomeEmpty() when empty != null:
return empty(_that);case FreelancerHomeFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FreelancerHomeInitial value)  initial,required TResult Function( FreelancerHomeLoading value)  loading,required TResult Function( FreelancerHomeLoaded value)  loaded,required TResult Function( FreelancerHomeEmpty value)  empty,required TResult Function( FreelancerHomeFailure value)  failure,}){
final _that = this;
switch (_that) {
case FreelancerHomeInitial():
return initial(_that);case FreelancerHomeLoading():
return loading(_that);case FreelancerHomeLoaded():
return loaded(_that);case FreelancerHomeEmpty():
return empty(_that);case FreelancerHomeFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FreelancerHomeInitial value)?  initial,TResult? Function( FreelancerHomeLoading value)?  loading,TResult? Function( FreelancerHomeLoaded value)?  loaded,TResult? Function( FreelancerHomeEmpty value)?  empty,TResult? Function( FreelancerHomeFailure value)?  failure,}){
final _that = this;
switch (_that) {
case FreelancerHomeInitial() when initial != null:
return initial(_that);case FreelancerHomeLoading() when loading != null:
return loading(_that);case FreelancerHomeLoaded() when loaded != null:
return loaded(_that);case FreelancerHomeEmpty() when empty != null:
return empty(_that);case FreelancerHomeFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<OpenServiceRequestSummary> requests,  OpenServiceRequestDateFilter currentFilter,  String? currentSearch,  bool isFilteredOrSearched)?  loaded,TResult Function( OpenServiceRequestDateFilter currentFilter,  String? currentSearch,  bool isFilteredOrSearched)?  empty,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FreelancerHomeInitial() when initial != null:
return initial();case FreelancerHomeLoading() when loading != null:
return loading();case FreelancerHomeLoaded() when loaded != null:
return loaded(_that.requests,_that.currentFilter,_that.currentSearch,_that.isFilteredOrSearched);case FreelancerHomeEmpty() when empty != null:
return empty(_that.currentFilter,_that.currentSearch,_that.isFilteredOrSearched);case FreelancerHomeFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<OpenServiceRequestSummary> requests,  OpenServiceRequestDateFilter currentFilter,  String? currentSearch,  bool isFilteredOrSearched)  loaded,required TResult Function( OpenServiceRequestDateFilter currentFilter,  String? currentSearch,  bool isFilteredOrSearched)  empty,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case FreelancerHomeInitial():
return initial();case FreelancerHomeLoading():
return loading();case FreelancerHomeLoaded():
return loaded(_that.requests,_that.currentFilter,_that.currentSearch,_that.isFilteredOrSearched);case FreelancerHomeEmpty():
return empty(_that.currentFilter,_that.currentSearch,_that.isFilteredOrSearched);case FreelancerHomeFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<OpenServiceRequestSummary> requests,  OpenServiceRequestDateFilter currentFilter,  String? currentSearch,  bool isFilteredOrSearched)?  loaded,TResult? Function( OpenServiceRequestDateFilter currentFilter,  String? currentSearch,  bool isFilteredOrSearched)?  empty,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case FreelancerHomeInitial() when initial != null:
return initial();case FreelancerHomeLoading() when loading != null:
return loading();case FreelancerHomeLoaded() when loaded != null:
return loaded(_that.requests,_that.currentFilter,_that.currentSearch,_that.isFilteredOrSearched);case FreelancerHomeEmpty() when empty != null:
return empty(_that.currentFilter,_that.currentSearch,_that.isFilteredOrSearched);case FreelancerHomeFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class FreelancerHomeInitial implements FreelancerHomeState {
  const FreelancerHomeInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerHomeInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerHomeState.initial()';
}


}




/// @nodoc


class FreelancerHomeLoading implements FreelancerHomeState {
  const FreelancerHomeLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerHomeLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerHomeState.loading()';
}


}




/// @nodoc


class FreelancerHomeLoaded implements FreelancerHomeState {
  const FreelancerHomeLoaded({required  List<OpenServiceRequestSummary> requests, required this.currentFilter, this.currentSearch, this.isFilteredOrSearched = false}): _requests = requests;
  

 final  List<OpenServiceRequestSummary> _requests;
 List<OpenServiceRequestSummary> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

 final  OpenServiceRequestDateFilter currentFilter;
 final  String? currentSearch;
@JsonKey() final  bool isFilteredOrSearched;

/// Create a copy of FreelancerHomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerHomeLoadedCopyWith<FreelancerHomeLoaded> get copyWith => _$FreelancerHomeLoadedCopyWithImpl<FreelancerHomeLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerHomeLoaded&&const DeepCollectionEquality().equals(other._requests, _requests)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.currentSearch, currentSearch) || other.currentSearch == currentSearch)&&(identical(other.isFilteredOrSearched, isFilteredOrSearched) || other.isFilteredOrSearched == isFilteredOrSearched));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_requests),currentFilter,currentSearch,isFilteredOrSearched);

@override
String toString() {
  return 'FreelancerHomeState.loaded(requests: $requests, currentFilter: $currentFilter, currentSearch: $currentSearch, isFilteredOrSearched: $isFilteredOrSearched)';
}


}

/// @nodoc
abstract mixin class $FreelancerHomeLoadedCopyWith<$Res> implements $FreelancerHomeStateCopyWith<$Res> {
  factory $FreelancerHomeLoadedCopyWith(FreelancerHomeLoaded value, $Res Function(FreelancerHomeLoaded) _then) = _$FreelancerHomeLoadedCopyWithImpl;
@useResult
$Res call({
 List<OpenServiceRequestSummary> requests, OpenServiceRequestDateFilter currentFilter, String? currentSearch, bool isFilteredOrSearched
});




}
/// @nodoc
class _$FreelancerHomeLoadedCopyWithImpl<$Res>
    implements $FreelancerHomeLoadedCopyWith<$Res> {
  _$FreelancerHomeLoadedCopyWithImpl(this._self, this._then);

  final FreelancerHomeLoaded _self;
  final $Res Function(FreelancerHomeLoaded) _then;

/// Create a copy of FreelancerHomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requests = null,Object? currentFilter = null,Object? currentSearch = freezed,Object? isFilteredOrSearched = null,}) {
  return _then(FreelancerHomeLoaded(
requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<OpenServiceRequestSummary>,currentFilter: null == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as OpenServiceRequestDateFilter,currentSearch: freezed == currentSearch ? _self.currentSearch : currentSearch // ignore: cast_nullable_to_non_nullable
as String?,isFilteredOrSearched: null == isFilteredOrSearched ? _self.isFilteredOrSearched : isFilteredOrSearched // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class FreelancerHomeEmpty implements FreelancerHomeState {
  const FreelancerHomeEmpty({required this.currentFilter, this.currentSearch, this.isFilteredOrSearched = false});
  

 final  OpenServiceRequestDateFilter currentFilter;
 final  String? currentSearch;
@JsonKey() final  bool isFilteredOrSearched;

/// Create a copy of FreelancerHomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerHomeEmptyCopyWith<FreelancerHomeEmpty> get copyWith => _$FreelancerHomeEmptyCopyWithImpl<FreelancerHomeEmpty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerHomeEmpty&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.currentSearch, currentSearch) || other.currentSearch == currentSearch)&&(identical(other.isFilteredOrSearched, isFilteredOrSearched) || other.isFilteredOrSearched == isFilteredOrSearched));
}


@override
int get hashCode => Object.hash(runtimeType,currentFilter,currentSearch,isFilteredOrSearched);

@override
String toString() {
  return 'FreelancerHomeState.empty(currentFilter: $currentFilter, currentSearch: $currentSearch, isFilteredOrSearched: $isFilteredOrSearched)';
}


}

/// @nodoc
abstract mixin class $FreelancerHomeEmptyCopyWith<$Res> implements $FreelancerHomeStateCopyWith<$Res> {
  factory $FreelancerHomeEmptyCopyWith(FreelancerHomeEmpty value, $Res Function(FreelancerHomeEmpty) _then) = _$FreelancerHomeEmptyCopyWithImpl;
@useResult
$Res call({
 OpenServiceRequestDateFilter currentFilter, String? currentSearch, bool isFilteredOrSearched
});




}
/// @nodoc
class _$FreelancerHomeEmptyCopyWithImpl<$Res>
    implements $FreelancerHomeEmptyCopyWith<$Res> {
  _$FreelancerHomeEmptyCopyWithImpl(this._self, this._then);

  final FreelancerHomeEmpty _self;
  final $Res Function(FreelancerHomeEmpty) _then;

/// Create a copy of FreelancerHomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentFilter = null,Object? currentSearch = freezed,Object? isFilteredOrSearched = null,}) {
  return _then(FreelancerHomeEmpty(
currentFilter: null == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as OpenServiceRequestDateFilter,currentSearch: freezed == currentSearch ? _self.currentSearch : currentSearch // ignore: cast_nullable_to_non_nullable
as String?,isFilteredOrSearched: null == isFilteredOrSearched ? _self.isFilteredOrSearched : isFilteredOrSearched // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class FreelancerHomeFailure implements FreelancerHomeState {
  const FreelancerHomeFailure({required this.message});
  

 final  String message;

/// Create a copy of FreelancerHomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerHomeFailureCopyWith<FreelancerHomeFailure> get copyWith => _$FreelancerHomeFailureCopyWithImpl<FreelancerHomeFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerHomeFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FreelancerHomeState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FreelancerHomeFailureCopyWith<$Res> implements $FreelancerHomeStateCopyWith<$Res> {
  factory $FreelancerHomeFailureCopyWith(FreelancerHomeFailure value, $Res Function(FreelancerHomeFailure) _then) = _$FreelancerHomeFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FreelancerHomeFailureCopyWithImpl<$Res>
    implements $FreelancerHomeFailureCopyWith<$Res> {
  _$FreelancerHomeFailureCopyWithImpl(this._self, this._then);

  final FreelancerHomeFailure _self;
  final $Res Function(FreelancerHomeFailure) _then;

/// Create a copy of FreelancerHomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FreelancerHomeFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
