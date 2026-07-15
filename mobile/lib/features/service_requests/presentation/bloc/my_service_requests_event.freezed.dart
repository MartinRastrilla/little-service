// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_service_requests_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyServiceRequestsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyServiceRequestsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyServiceRequestsEvent()';
}


}

/// @nodoc
class $MyServiceRequestsEventCopyWith<$Res>  {
$MyServiceRequestsEventCopyWith(MyServiceRequestsEvent _, $Res Function(MyServiceRequestsEvent) __);
}


/// Adds pattern-matching-related methods to [MyServiceRequestsEvent].
extension MyServiceRequestsEventPatterns on MyServiceRequestsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MyServiceRequestsRequested value)?  requested,TResult Function( MyServiceRequestsLoadMore value)?  loadMore,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MyServiceRequestsRequested() when requested != null:
return requested(_that);case MyServiceRequestsLoadMore() when loadMore != null:
return loadMore(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MyServiceRequestsRequested value)  requested,required TResult Function( MyServiceRequestsLoadMore value)  loadMore,}){
final _that = this;
switch (_that) {
case MyServiceRequestsRequested():
return requested(_that);case MyServiceRequestsLoadMore():
return loadMore(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MyServiceRequestsRequested value)?  requested,TResult? Function( MyServiceRequestsLoadMore value)?  loadMore,}){
final _that = this;
switch (_that) {
case MyServiceRequestsRequested() when requested != null:
return requested(_that);case MyServiceRequestsLoadMore() when loadMore != null:
return loadMore(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ServiceRequestFilterOption filter,  String? search,  int page)?  requested,TResult Function()?  loadMore,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MyServiceRequestsRequested() when requested != null:
return requested(_that.filter,_that.search,_that.page);case MyServiceRequestsLoadMore() when loadMore != null:
return loadMore();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ServiceRequestFilterOption filter,  String? search,  int page)  requested,required TResult Function()  loadMore,}) {final _that = this;
switch (_that) {
case MyServiceRequestsRequested():
return requested(_that.filter,_that.search,_that.page);case MyServiceRequestsLoadMore():
return loadMore();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ServiceRequestFilterOption filter,  String? search,  int page)?  requested,TResult? Function()?  loadMore,}) {final _that = this;
switch (_that) {
case MyServiceRequestsRequested() when requested != null:
return requested(_that.filter,_that.search,_that.page);case MyServiceRequestsLoadMore() when loadMore != null:
return loadMore();case _:
  return null;

}
}

}

/// @nodoc


class MyServiceRequestsRequested implements MyServiceRequestsEvent {
  const MyServiceRequestsRequested({this.filter = ServiceRequestFilterOption.all, this.search, this.page = 1});
  

@JsonKey() final  ServiceRequestFilterOption filter;
 final  String? search;
@JsonKey() final  int page;

/// Create a copy of MyServiceRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyServiceRequestsRequestedCopyWith<MyServiceRequestsRequested> get copyWith => _$MyServiceRequestsRequestedCopyWithImpl<MyServiceRequestsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyServiceRequestsRequested&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.search, search) || other.search == search)&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,filter,search,page);

@override
String toString() {
  return 'MyServiceRequestsEvent.requested(filter: $filter, search: $search, page: $page)';
}


}

/// @nodoc
abstract mixin class $MyServiceRequestsRequestedCopyWith<$Res> implements $MyServiceRequestsEventCopyWith<$Res> {
  factory $MyServiceRequestsRequestedCopyWith(MyServiceRequestsRequested value, $Res Function(MyServiceRequestsRequested) _then) = _$MyServiceRequestsRequestedCopyWithImpl;
@useResult
$Res call({
 ServiceRequestFilterOption filter, String? search, int page
});




}
/// @nodoc
class _$MyServiceRequestsRequestedCopyWithImpl<$Res>
    implements $MyServiceRequestsRequestedCopyWith<$Res> {
  _$MyServiceRequestsRequestedCopyWithImpl(this._self, this._then);

  final MyServiceRequestsRequested _self;
  final $Res Function(MyServiceRequestsRequested) _then;

/// Create a copy of MyServiceRequestsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? search = freezed,Object? page = null,}) {
  return _then(MyServiceRequestsRequested(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ServiceRequestFilterOption,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MyServiceRequestsLoadMore implements MyServiceRequestsEvent {
  const MyServiceRequestsLoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyServiceRequestsLoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MyServiceRequestsEvent.loadMore()';
}


}




// dart format on
