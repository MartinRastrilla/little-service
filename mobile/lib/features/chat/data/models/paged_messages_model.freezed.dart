// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_messages_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PagedMessagesModel {

 List<ChatMessageModel> get items;@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? get nextCursor; bool get hasMore;
/// Create a copy of PagedMessagesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagedMessagesModelCopyWith<PagedMessagesModel> get copyWith => _$PagedMessagesModelCopyWithImpl<PagedMessagesModel>(this as PagedMessagesModel, _$identity);

  /// Serializes this PagedMessagesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagedMessagesModel&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),nextCursor,hasMore);

@override
String toString() {
  return 'PagedMessagesModel(items: $items, nextCursor: $nextCursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $PagedMessagesModelCopyWith<$Res>  {
  factory $PagedMessagesModelCopyWith(PagedMessagesModel value, $Res Function(PagedMessagesModel) _then) = _$PagedMessagesModelCopyWithImpl;
@useResult
$Res call({
 List<ChatMessageModel> items,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? nextCursor, bool hasMore
});




}
/// @nodoc
class _$PagedMessagesModelCopyWithImpl<$Res>
    implements $PagedMessagesModelCopyWith<$Res> {
  _$PagedMessagesModelCopyWithImpl(this._self, this._then);

  final PagedMessagesModel _self;
  final $Res Function(PagedMessagesModel) _then;

/// Create a copy of PagedMessagesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? nextCursor = freezed,Object? hasMore = null,}) {
  return _then(PagedMessagesModel(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ChatMessageModel>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as DateTime?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PagedMessagesModel].
extension PagedMessagesModelPatterns on PagedMessagesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PagedMessagesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PagedMessagesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PagedMessagesModel value)  $default,){
final _that = this;
switch (_that) {
case _PagedMessagesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PagedMessagesModel value)?  $default,){
final _that = this;
switch (_that) {
case _PagedMessagesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatMessageModel> items, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? nextCursor,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PagedMessagesModel() when $default != null:
return $default(_that.items,_that.nextCursor,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatMessageModel> items, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? nextCursor,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _PagedMessagesModel():
return $default(_that.items,_that.nextCursor,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatMessageModel> items, @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)  DateTime? nextCursor,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _PagedMessagesModel() when $default != null:
return $default(_that.items,_that.nextCursor,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PagedMessagesModel extends PagedMessagesModel {
  const _PagedMessagesModel({ List<ChatMessageModel> items = const [], @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) this.nextCursor, this.hasMore = false}): _items = items,super._();
  factory _PagedMessagesModel.fromJson(Map<String, dynamic> json) => _$PagedMessagesModelFromJson(json);

 final  List<ChatMessageModel> _items;
@override@JsonKey() List<ChatMessageModel> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) final  DateTime? nextCursor;
@override@JsonKey() final  bool hasMore;

/// Create a copy of PagedMessagesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagedMessagesModelCopyWith<_PagedMessagesModel> get copyWith => __$PagedMessagesModelCopyWithImpl<_PagedMessagesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PagedMessagesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PagedMessagesModel&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),nextCursor,hasMore);

@override
String toString() {
  return 'PagedMessagesModel(items: $items, nextCursor: $nextCursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$PagedMessagesModelCopyWith<$Res> implements $PagedMessagesModelCopyWith<$Res> {
  factory _$PagedMessagesModelCopyWith(_PagedMessagesModel value, $Res Function(_PagedMessagesModel) _then) = __$PagedMessagesModelCopyWithImpl;
@override @useResult
$Res call({
 List<ChatMessageModel> items,@JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson) DateTime? nextCursor, bool hasMore
});




}
/// @nodoc
class __$PagedMessagesModelCopyWithImpl<$Res>
    implements _$PagedMessagesModelCopyWith<$Res> {
  __$PagedMessagesModelCopyWithImpl(this._self, this._then);

  final _PagedMessagesModel _self;
  final $Res Function(_PagedMessagesModel) _then;

/// Create a copy of PagedMessagesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nextCursor = freezed,Object? hasMore = null,}) {
  return _then(_PagedMessagesModel(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ChatMessageModel>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as DateTime?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
