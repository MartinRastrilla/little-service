// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_service_requests_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PagedServiceRequestsResultModel {

 List<ServiceRequestSummaryModel> get items; int get totalCount; int get page; int get pageSize; bool get hasMore;
/// Create a copy of PagedServiceRequestsResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagedServiceRequestsResultModelCopyWith<PagedServiceRequestsResultModel> get copyWith => _$PagedServiceRequestsResultModelCopyWithImpl<PagedServiceRequestsResultModel>(this as PagedServiceRequestsResultModel, _$identity);

  /// Serializes this PagedServiceRequestsResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagedServiceRequestsResultModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalCount,page,pageSize,hasMore);

@override
String toString() {
  return 'PagedServiceRequestsResultModel(items: $items, totalCount: $totalCount, page: $page, pageSize: $pageSize, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $PagedServiceRequestsResultModelCopyWith<$Res>  {
  factory $PagedServiceRequestsResultModelCopyWith(PagedServiceRequestsResultModel value, $Res Function(PagedServiceRequestsResultModel) _then) = _$PagedServiceRequestsResultModelCopyWithImpl;
@useResult
$Res call({
 List<ServiceRequestSummaryModel> items, int totalCount, int page, int pageSize, bool hasMore
});




}
/// @nodoc
class _$PagedServiceRequestsResultModelCopyWithImpl<$Res>
    implements $PagedServiceRequestsResultModelCopyWith<$Res> {
  _$PagedServiceRequestsResultModelCopyWithImpl(this._self, this._then);

  final PagedServiceRequestsResultModel _self;
  final $Res Function(PagedServiceRequestsResultModel) _then;

/// Create a copy of PagedServiceRequestsResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalCount = null,Object? page = null,Object? pageSize = null,Object? hasMore = null,}) {
  return _then(PagedServiceRequestsResultModel(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestSummaryModel>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PagedServiceRequestsResultModel].
extension PagedServiceRequestsResultModelPatterns on PagedServiceRequestsResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PagedServiceRequestsResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PagedServiceRequestsResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PagedServiceRequestsResultModel value)  $default,){
final _that = this;
switch (_that) {
case _PagedServiceRequestsResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PagedServiceRequestsResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _PagedServiceRequestsResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ServiceRequestSummaryModel> items,  int totalCount,  int page,  int pageSize,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PagedServiceRequestsResultModel() when $default != null:
return $default(_that.items,_that.totalCount,_that.page,_that.pageSize,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ServiceRequestSummaryModel> items,  int totalCount,  int page,  int pageSize,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _PagedServiceRequestsResultModel():
return $default(_that.items,_that.totalCount,_that.page,_that.pageSize,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ServiceRequestSummaryModel> items,  int totalCount,  int page,  int pageSize,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _PagedServiceRequestsResultModel() when $default != null:
return $default(_that.items,_that.totalCount,_that.page,_that.pageSize,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PagedServiceRequestsResultModel extends PagedServiceRequestsResultModel {
  const _PagedServiceRequestsResultModel({ List<ServiceRequestSummaryModel> items = const <ServiceRequestSummaryModel>[], this.totalCount = 0, this.page = 1, this.pageSize = 20, this.hasMore = false}): _items = items,super._();
  factory _PagedServiceRequestsResultModel.fromJson(Map<String, dynamic> json) => _$PagedServiceRequestsResultModelFromJson(json);

 final  List<ServiceRequestSummaryModel> _items;
@override@JsonKey() List<ServiceRequestSummaryModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int totalCount;
@override@JsonKey() final  int page;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  bool hasMore;

/// Create a copy of PagedServiceRequestsResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagedServiceRequestsResultModelCopyWith<_PagedServiceRequestsResultModel> get copyWith => __$PagedServiceRequestsResultModelCopyWithImpl<_PagedServiceRequestsResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PagedServiceRequestsResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PagedServiceRequestsResultModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalCount,page,pageSize,hasMore);

@override
String toString() {
  return 'PagedServiceRequestsResultModel(items: $items, totalCount: $totalCount, page: $page, pageSize: $pageSize, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$PagedServiceRequestsResultModelCopyWith<$Res> implements $PagedServiceRequestsResultModelCopyWith<$Res> {
  factory _$PagedServiceRequestsResultModelCopyWith(_PagedServiceRequestsResultModel value, $Res Function(_PagedServiceRequestsResultModel) _then) = __$PagedServiceRequestsResultModelCopyWithImpl;
@override @useResult
$Res call({
 List<ServiceRequestSummaryModel> items, int totalCount, int page, int pageSize, bool hasMore
});




}
/// @nodoc
class __$PagedServiceRequestsResultModelCopyWithImpl<$Res>
    implements _$PagedServiceRequestsResultModelCopyWith<$Res> {
  __$PagedServiceRequestsResultModelCopyWithImpl(this._self, this._then);

  final _PagedServiceRequestsResultModel _self;
  final $Res Function(_PagedServiceRequestsResultModel) _then;

/// Create a copy of PagedServiceRequestsResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalCount = null,Object? page = null,Object? pageSize = null,Object? hasMore = null,}) {
  return _then(_PagedServiceRequestsResultModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ServiceRequestSummaryModel>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
