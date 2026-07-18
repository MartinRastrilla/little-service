// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelancer_home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FreelancerHomeEvent {

 OpenServiceRequestDateFilter get filter; String? get search;
/// Create a copy of FreelancerHomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerHomeEventCopyWith<FreelancerHomeEvent> get copyWith => _$FreelancerHomeEventCopyWithImpl<FreelancerHomeEvent>(this as FreelancerHomeEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerHomeEvent&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,filter,search);

@override
String toString() {
  return 'FreelancerHomeEvent(filter: $filter, search: $search)';
}


}

/// @nodoc
abstract mixin class $FreelancerHomeEventCopyWith<$Res>  {
  factory $FreelancerHomeEventCopyWith(FreelancerHomeEvent value, $Res Function(FreelancerHomeEvent) _then) = _$FreelancerHomeEventCopyWithImpl;
@useResult
$Res call({
 OpenServiceRequestDateFilter filter, String? search
});




}
/// @nodoc
class _$FreelancerHomeEventCopyWithImpl<$Res>
    implements $FreelancerHomeEventCopyWith<$Res> {
  _$FreelancerHomeEventCopyWithImpl(this._self, this._then);

  final FreelancerHomeEvent _self;
  final $Res Function(FreelancerHomeEvent) _then;

/// Create a copy of FreelancerHomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filter = null,Object? search = freezed,}) {
  return _then(FreelancerHomeEvent.requested(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as OpenServiceRequestDateFilter,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FreelancerHomeEvent].
extension FreelancerHomeEventPatterns on FreelancerHomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FreelancerHomeRequested value)?  requested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FreelancerHomeRequested() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FreelancerHomeRequested value)  requested,}){
final _that = this;
switch (_that) {
case FreelancerHomeRequested():
return requested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FreelancerHomeRequested value)?  requested,}){
final _that = this;
switch (_that) {
case FreelancerHomeRequested() when requested != null:
return requested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( OpenServiceRequestDateFilter filter,  String? search)?  requested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FreelancerHomeRequested() when requested != null:
return requested(_that.filter,_that.search);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( OpenServiceRequestDateFilter filter,  String? search)  requested,}) {final _that = this;
switch (_that) {
case FreelancerHomeRequested():
return requested(_that.filter,_that.search);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( OpenServiceRequestDateFilter filter,  String? search)?  requested,}) {final _that = this;
switch (_that) {
case FreelancerHomeRequested() when requested != null:
return requested(_that.filter,_that.search);case _:
  return null;

}
}

}

/// @nodoc


class FreelancerHomeRequested implements FreelancerHomeEvent {
  const FreelancerHomeRequested({this.filter = OpenServiceRequestDateFilter.all, this.search});
  

@override@JsonKey() final  OpenServiceRequestDateFilter filter;
@override final  String? search;

/// Create a copy of FreelancerHomeEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerHomeRequestedCopyWith<FreelancerHomeRequested> get copyWith => _$FreelancerHomeRequestedCopyWithImpl<FreelancerHomeRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerHomeRequested&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.search, search) || other.search == search));
}


@override
int get hashCode => Object.hash(runtimeType,filter,search);

@override
String toString() {
  return 'FreelancerHomeEvent.requested(filter: $filter, search: $search)';
}


}

/// @nodoc
abstract mixin class $FreelancerHomeRequestedCopyWith<$Res> implements $FreelancerHomeEventCopyWith<$Res> {
  factory $FreelancerHomeRequestedCopyWith(FreelancerHomeRequested value, $Res Function(FreelancerHomeRequested) _then) = _$FreelancerHomeRequestedCopyWithImpl;
@override @useResult
$Res call({
 OpenServiceRequestDateFilter filter, String? search
});




}
/// @nodoc
class _$FreelancerHomeRequestedCopyWithImpl<$Res>
    implements $FreelancerHomeRequestedCopyWith<$Res> {
  _$FreelancerHomeRequestedCopyWithImpl(this._self, this._then);

  final FreelancerHomeRequested _self;
  final $Res Function(FreelancerHomeRequested) _then;

/// Create a copy of FreelancerHomeEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filter = null,Object? search = freezed,}) {
  return _then(FreelancerHomeRequested(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as OpenServiceRequestDateFilter,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
