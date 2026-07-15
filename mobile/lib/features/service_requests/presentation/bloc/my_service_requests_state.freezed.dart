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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MyServiceRequestsInitial value)?  initial,TResult Function( MyServiceRequestsLoading value)?  loading,TResult Function( MyServiceRequestsLoadingMore value)?  loadingMore,TResult Function( MyServiceRequestsLoaded value)?  loaded,TResult Function( MyServiceRequestsEmpty value)?  empty,TResult Function( MyServiceRequestsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MyServiceRequestsInitial() when initial != null:
return initial(_that);case MyServiceRequestsLoading() when loading != null:
return loading(_that);case MyServiceRequestsLoadingMore() when loadingMore != null:
return loadingMore(_that);case MyServiceRequestsLoaded() when loaded != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MyServiceRequestsInitial value)  initial,required TResult Function( MyServiceRequestsLoading value)  loading,required TResult Function( MyServiceRequestsLoadingMore value)  loadingMore,required TResult Function( MyServiceRequestsLoaded value)  loaded,required TResult Function( MyServiceRequestsEmpty value)  empty,required TResult Function( MyServiceRequestsFailure value)  failure,}){
final _that = this;
switch (_that) {
case MyServiceRequestsInitial():
return initial(_that);case MyServiceRequestsLoading():
return loading(_that);case MyServiceRequestsLoadingMore():
return loadingMore(_that);case MyServiceRequestsLoaded():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MyServiceRequestsInitial value)?  initial,TResult? Function( MyServiceRequestsLoading value)?  loading,TResult? Function( MyServiceRequestsLoadingMore value)?  loadingMore,TResult? Function( MyServiceRequestsLoaded value)?  loaded,TResult? Function( MyServiceRequestsEmpty value)?  empty,TResult? Function( MyServiceRequestsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case MyServiceRequestsInitial() when initial != null:
return initial(_that);case MyServiceRequestsLoading() when loading != null:
return loading(_that);case MyServiceRequestsLoadingMore() when loadingMore != null:
return loadingMore(_that);case MyServiceRequestsLoaded() when loaded != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ServiceRequestSummary> requests,  ServiceRequestFilterOption currentFilter,  String? currentSearch,  int totalCount,  bool hasMore,  int currentPage)?  loadingMore,TResult Function( List<ServiceRequestSummary> requests,  ServiceRequestFilterOption currentFilter,  String? currentSearch,  int totalCount,  bool hasMore,  int currentPage,  bool isFilteredOrSearched)?  loaded,TResult Function( ServiceRequestFilterOption currentFilter,  String? currentSearch,  bool isFilteredOrSearched)?  empty,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MyServiceRequestsInitial() when initial != null:
return initial();case MyServiceRequestsLoading() when loading != null:
return loading();case MyServiceRequestsLoadingMore() when loadingMore != null:
return loadingMore(_that.requests,_that.currentFilter,_that.currentSearch,_that.totalCount,_that.hasMore,_that.currentPage);case MyServiceRequestsLoaded() when loaded != null:
return loaded(_that.requests,_that.currentFilter,_that.currentSearch,_that.totalCount,_that.hasMore,_that.currentPage,_that.isFilteredOrSearched);case MyServiceRequestsEmpty() when empty != null:
return empty(_that.currentFilter,_that.currentSearch,_that.isFilteredOrSearched);case MyServiceRequestsFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ServiceRequestSummary> requests,  ServiceRequestFilterOption currentFilter,  String? currentSearch,  int totalCount,  bool hasMore,  int currentPage)  loadingMore,required TResult Function( List<ServiceRequestSummary> requests,  ServiceRequestFilterOption currentFilter,  String? currentSearch,  int totalCount,  bool hasMore,  int currentPage,  bool isFilteredOrSearched)  loaded,required TResult Function( ServiceRequestFilterOption currentFilter,  String? currentSearch,  bool isFilteredOrSearched)  empty,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case MyServiceRequestsInitial():
return initial();case MyServiceRequestsLoading():
return loading();case MyServiceRequestsLoadingMore():
return loadingMore(_that.requests,_that.currentFilter,_that.currentSearch,_that.totalCount,_that.hasMore,_that.currentPage);case MyServiceRequestsLoaded():
return loaded(_that.requests,_that.currentFilter,_that.currentSearch,_that.totalCount,_that.hasMore,_that.currentPage,_that.isFilteredOrSearched);case MyServiceRequestsEmpty():
return empty(_that.currentFilter,_that.currentSearch,_that.isFilteredOrSearched);case MyServiceRequestsFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ServiceRequestSummary> requests,  ServiceRequestFilterOption currentFilter,  String? currentSearch,  int totalCount,  bool hasMore,  int currentPage)?  loadingMore,TResult? Function( List<ServiceRequestSummary> requests,  ServiceRequestFilterOption currentFilter,  String? currentSearch,  int totalCount,  bool hasMore,  int currentPage,  bool isFilteredOrSearched)?  loaded,TResult? Function( ServiceRequestFilterOption currentFilter,  String? currentSearch,  bool isFilteredOrSearched)?  empty,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case MyServiceRequestsInitial() when initial != null:
return initial();case MyServiceRequestsLoading() when loading != null:
return loading();case MyServiceRequestsLoadingMore() when loadingMore != null:
return loadingMore(_that.requests,_that.currentFilter,_that.currentSearch,_that.totalCount,_that.hasMore,_that.currentPage);case MyServiceRequestsLoaded() when loaded != null:
return loaded(_that.requests,_that.currentFilter,_that.currentSearch,_that.totalCount,_that.hasMore,_that.currentPage,_that.isFilteredOrSearched);case MyServiceRequestsEmpty() when empty != null:
return empty(_that.currentFilter,_that.currentSearch,_that.isFilteredOrSearched);case MyServiceRequestsFailure() when failure != null:
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


class MyServiceRequestsLoadingMore implements MyServiceRequestsState {
  const MyServiceRequestsLoadingMore({required  List<ServiceRequestSummary> requests, required this.currentFilter, this.currentSearch, required this.totalCount, required this.hasMore, required this.currentPage}): _requests = requests;
  

 final  List<ServiceRequestSummary> _requests;
 List<ServiceRequestSummary> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

 final  ServiceRequestFilterOption currentFilter;
 final  String? currentSearch;
 final  int totalCount;
 final  bool hasMore;
 final  int currentPage;

/// Create a copy of MyServiceRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyServiceRequestsLoadingMoreCopyWith<MyServiceRequestsLoadingMore> get copyWith => _$MyServiceRequestsLoadingMoreCopyWithImpl<MyServiceRequestsLoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyServiceRequestsLoadingMore&&const DeepCollectionEquality().equals(other._requests, _requests)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.currentSearch, currentSearch) || other.currentSearch == currentSearch)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_requests),currentFilter,currentSearch,totalCount,hasMore,currentPage);

@override
String toString() {
  return 'MyServiceRequestsState.loadingMore(requests: $requests, currentFilter: $currentFilter, currentSearch: $currentSearch, totalCount: $totalCount, hasMore: $hasMore, currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class $MyServiceRequestsLoadingMoreCopyWith<$Res> implements $MyServiceRequestsStateCopyWith<$Res> {
  factory $MyServiceRequestsLoadingMoreCopyWith(MyServiceRequestsLoadingMore value, $Res Function(MyServiceRequestsLoadingMore) _then) = _$MyServiceRequestsLoadingMoreCopyWithImpl;
@useResult
$Res call({
 List<ServiceRequestSummary> requests, ServiceRequestFilterOption currentFilter, String? currentSearch, int totalCount, bool hasMore, int currentPage
});




}
/// @nodoc
class _$MyServiceRequestsLoadingMoreCopyWithImpl<$Res>
    implements $MyServiceRequestsLoadingMoreCopyWith<$Res> {
  _$MyServiceRequestsLoadingMoreCopyWithImpl(this._self, this._then);

  final MyServiceRequestsLoadingMore _self;
  final $Res Function(MyServiceRequestsLoadingMore) _then;

/// Create a copy of MyServiceRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? requests = null,Object? currentFilter = null,Object? currentSearch = freezed,Object? totalCount = null,Object? hasMore = null,Object? currentPage = null,}) {
  return _then(MyServiceRequestsLoadingMore(
requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestSummary>,currentFilter: null == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as ServiceRequestFilterOption,currentSearch: freezed == currentSearch ? _self.currentSearch : currentSearch // ignore: cast_nullable_to_non_nullable
as String?,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MyServiceRequestsLoaded implements MyServiceRequestsState {
  const MyServiceRequestsLoaded({required  List<ServiceRequestSummary> requests, required this.currentFilter, this.currentSearch, required this.totalCount, required this.hasMore, required this.currentPage, this.isFilteredOrSearched = false}): _requests = requests;
  

 final  List<ServiceRequestSummary> _requests;
 List<ServiceRequestSummary> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

 final  ServiceRequestFilterOption currentFilter;
 final  String? currentSearch;
 final  int totalCount;
 final  bool hasMore;
 final  int currentPage;
@JsonKey() final  bool isFilteredOrSearched;

/// Create a copy of MyServiceRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyServiceRequestsLoadedCopyWith<MyServiceRequestsLoaded> get copyWith => _$MyServiceRequestsLoadedCopyWithImpl<MyServiceRequestsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyServiceRequestsLoaded&&const DeepCollectionEquality().equals(other._requests, _requests)&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.currentSearch, currentSearch) || other.currentSearch == currentSearch)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.isFilteredOrSearched, isFilteredOrSearched) || other.isFilteredOrSearched == isFilteredOrSearched));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_requests),currentFilter,currentSearch,totalCount,hasMore,currentPage,isFilteredOrSearched);

@override
String toString() {
  return 'MyServiceRequestsState.loaded(requests: $requests, currentFilter: $currentFilter, currentSearch: $currentSearch, totalCount: $totalCount, hasMore: $hasMore, currentPage: $currentPage, isFilteredOrSearched: $isFilteredOrSearched)';
}


}

/// @nodoc
abstract mixin class $MyServiceRequestsLoadedCopyWith<$Res> implements $MyServiceRequestsStateCopyWith<$Res> {
  factory $MyServiceRequestsLoadedCopyWith(MyServiceRequestsLoaded value, $Res Function(MyServiceRequestsLoaded) _then) = _$MyServiceRequestsLoadedCopyWithImpl;
@useResult
$Res call({
 List<ServiceRequestSummary> requests, ServiceRequestFilterOption currentFilter, String? currentSearch, int totalCount, bool hasMore, int currentPage, bool isFilteredOrSearched
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
@pragma('vm:prefer-inline') $Res call({Object? requests = null,Object? currentFilter = null,Object? currentSearch = freezed,Object? totalCount = null,Object? hasMore = null,Object? currentPage = null,Object? isFilteredOrSearched = null,}) {
  return _then(MyServiceRequestsLoaded(
requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestSummary>,currentFilter: null == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as ServiceRequestFilterOption,currentSearch: freezed == currentSearch ? _self.currentSearch : currentSearch // ignore: cast_nullable_to_non_nullable
as String?,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,isFilteredOrSearched: null == isFilteredOrSearched ? _self.isFilteredOrSearched : isFilteredOrSearched // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class MyServiceRequestsEmpty implements MyServiceRequestsState {
  const MyServiceRequestsEmpty({required this.currentFilter, this.currentSearch, this.isFilteredOrSearched = false});
  

 final  ServiceRequestFilterOption currentFilter;
 final  String? currentSearch;
@JsonKey() final  bool isFilteredOrSearched;

/// Create a copy of MyServiceRequestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyServiceRequestsEmptyCopyWith<MyServiceRequestsEmpty> get copyWith => _$MyServiceRequestsEmptyCopyWithImpl<MyServiceRequestsEmpty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyServiceRequestsEmpty&&(identical(other.currentFilter, currentFilter) || other.currentFilter == currentFilter)&&(identical(other.currentSearch, currentSearch) || other.currentSearch == currentSearch)&&(identical(other.isFilteredOrSearched, isFilteredOrSearched) || other.isFilteredOrSearched == isFilteredOrSearched));
}


@override
int get hashCode => Object.hash(runtimeType,currentFilter,currentSearch,isFilteredOrSearched);

@override
String toString() {
  return 'MyServiceRequestsState.empty(currentFilter: $currentFilter, currentSearch: $currentSearch, isFilteredOrSearched: $isFilteredOrSearched)';
}


}

/// @nodoc
abstract mixin class $MyServiceRequestsEmptyCopyWith<$Res> implements $MyServiceRequestsStateCopyWith<$Res> {
  factory $MyServiceRequestsEmptyCopyWith(MyServiceRequestsEmpty value, $Res Function(MyServiceRequestsEmpty) _then) = _$MyServiceRequestsEmptyCopyWithImpl;
@useResult
$Res call({
 ServiceRequestFilterOption currentFilter, String? currentSearch, bool isFilteredOrSearched
});




}
/// @nodoc
class _$MyServiceRequestsEmptyCopyWithImpl<$Res>
    implements $MyServiceRequestsEmptyCopyWith<$Res> {
  _$MyServiceRequestsEmptyCopyWithImpl(this._self, this._then);

  final MyServiceRequestsEmpty _self;
  final $Res Function(MyServiceRequestsEmpty) _then;

/// Create a copy of MyServiceRequestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentFilter = null,Object? currentSearch = freezed,Object? isFilteredOrSearched = null,}) {
  return _then(MyServiceRequestsEmpty(
currentFilter: null == currentFilter ? _self.currentFilter : currentFilter // ignore: cast_nullable_to_non_nullable
as ServiceRequestFilterOption,currentSearch: freezed == currentSearch ? _self.currentSearch : currentSearch // ignore: cast_nullable_to_non_nullable
as String?,isFilteredOrSearched: null == isFilteredOrSearched ? _self.isFilteredOrSearched : isFilteredOrSearched // ignore: cast_nullable_to_non_nullable
as bool,
  ));
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
