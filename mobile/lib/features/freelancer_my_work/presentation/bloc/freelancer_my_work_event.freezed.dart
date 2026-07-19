// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelancer_my_work_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FreelancerMyWorkEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerMyWorkEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerMyWorkEvent()';
}


}

/// @nodoc
class $FreelancerMyWorkEventCopyWith<$Res>  {
$FreelancerMyWorkEventCopyWith(FreelancerMyWorkEvent _, $Res Function(FreelancerMyWorkEvent) __);
}


/// Adds pattern-matching-related methods to [FreelancerMyWorkEvent].
extension FreelancerMyWorkEventPatterns on FreelancerMyWorkEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FreelancerMyWorkStarted value)?  started,TResult Function( FreelancerMyWorkTabChanged value)?  tabChanged,TResult Function( FreelancerMyWorkApplicationFilterChanged value)?  applicationFilterChanged,TResult Function( FreelancerMyWorkJobFilterChanged value)?  jobFilterChanged,TResult Function( FreelancerMyWorkRetry value)?  retry,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FreelancerMyWorkStarted() when started != null:
return started(_that);case FreelancerMyWorkTabChanged() when tabChanged != null:
return tabChanged(_that);case FreelancerMyWorkApplicationFilterChanged() when applicationFilterChanged != null:
return applicationFilterChanged(_that);case FreelancerMyWorkJobFilterChanged() when jobFilterChanged != null:
return jobFilterChanged(_that);case FreelancerMyWorkRetry() when retry != null:
return retry(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FreelancerMyWorkStarted value)  started,required TResult Function( FreelancerMyWorkTabChanged value)  tabChanged,required TResult Function( FreelancerMyWorkApplicationFilterChanged value)  applicationFilterChanged,required TResult Function( FreelancerMyWorkJobFilterChanged value)  jobFilterChanged,required TResult Function( FreelancerMyWorkRetry value)  retry,}){
final _that = this;
switch (_that) {
case FreelancerMyWorkStarted():
return started(_that);case FreelancerMyWorkTabChanged():
return tabChanged(_that);case FreelancerMyWorkApplicationFilterChanged():
return applicationFilterChanged(_that);case FreelancerMyWorkJobFilterChanged():
return jobFilterChanged(_that);case FreelancerMyWorkRetry():
return retry(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FreelancerMyWorkStarted value)?  started,TResult? Function( FreelancerMyWorkTabChanged value)?  tabChanged,TResult? Function( FreelancerMyWorkApplicationFilterChanged value)?  applicationFilterChanged,TResult? Function( FreelancerMyWorkJobFilterChanged value)?  jobFilterChanged,TResult? Function( FreelancerMyWorkRetry value)?  retry,}){
final _that = this;
switch (_that) {
case FreelancerMyWorkStarted() when started != null:
return started(_that);case FreelancerMyWorkTabChanged() when tabChanged != null:
return tabChanged(_that);case FreelancerMyWorkApplicationFilterChanged() when applicationFilterChanged != null:
return applicationFilterChanged(_that);case FreelancerMyWorkJobFilterChanged() when jobFilterChanged != null:
return jobFilterChanged(_that);case FreelancerMyWorkRetry() when retry != null:
return retry(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( FreelancerMyWorkTab? initialTab)?  started,TResult Function( FreelancerMyWorkTab tab)?  tabChanged,TResult Function( FreelancerApplicationFilter filter)?  applicationFilterChanged,TResult Function( FreelancerJobFilter filter)?  jobFilterChanged,TResult Function()?  retry,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FreelancerMyWorkStarted() when started != null:
return started(_that.initialTab);case FreelancerMyWorkTabChanged() when tabChanged != null:
return tabChanged(_that.tab);case FreelancerMyWorkApplicationFilterChanged() when applicationFilterChanged != null:
return applicationFilterChanged(_that.filter);case FreelancerMyWorkJobFilterChanged() when jobFilterChanged != null:
return jobFilterChanged(_that.filter);case FreelancerMyWorkRetry() when retry != null:
return retry();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( FreelancerMyWorkTab? initialTab)  started,required TResult Function( FreelancerMyWorkTab tab)  tabChanged,required TResult Function( FreelancerApplicationFilter filter)  applicationFilterChanged,required TResult Function( FreelancerJobFilter filter)  jobFilterChanged,required TResult Function()  retry,}) {final _that = this;
switch (_that) {
case FreelancerMyWorkStarted():
return started(_that.initialTab);case FreelancerMyWorkTabChanged():
return tabChanged(_that.tab);case FreelancerMyWorkApplicationFilterChanged():
return applicationFilterChanged(_that.filter);case FreelancerMyWorkJobFilterChanged():
return jobFilterChanged(_that.filter);case FreelancerMyWorkRetry():
return retry();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( FreelancerMyWorkTab? initialTab)?  started,TResult? Function( FreelancerMyWorkTab tab)?  tabChanged,TResult? Function( FreelancerApplicationFilter filter)?  applicationFilterChanged,TResult? Function( FreelancerJobFilter filter)?  jobFilterChanged,TResult? Function()?  retry,}) {final _that = this;
switch (_that) {
case FreelancerMyWorkStarted() when started != null:
return started(_that.initialTab);case FreelancerMyWorkTabChanged() when tabChanged != null:
return tabChanged(_that.tab);case FreelancerMyWorkApplicationFilterChanged() when applicationFilterChanged != null:
return applicationFilterChanged(_that.filter);case FreelancerMyWorkJobFilterChanged() when jobFilterChanged != null:
return jobFilterChanged(_that.filter);case FreelancerMyWorkRetry() when retry != null:
return retry();case _:
  return null;

}
}

}

/// @nodoc


class FreelancerMyWorkStarted implements FreelancerMyWorkEvent {
  const FreelancerMyWorkStarted({this.initialTab});
  

 final  FreelancerMyWorkTab? initialTab;

/// Create a copy of FreelancerMyWorkEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerMyWorkStartedCopyWith<FreelancerMyWorkStarted> get copyWith => _$FreelancerMyWorkStartedCopyWithImpl<FreelancerMyWorkStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerMyWorkStarted&&(identical(other.initialTab, initialTab) || other.initialTab == initialTab));
}


@override
int get hashCode => Object.hash(runtimeType,initialTab);

@override
String toString() {
  return 'FreelancerMyWorkEvent.started(initialTab: $initialTab)';
}


}

/// @nodoc
abstract mixin class $FreelancerMyWorkStartedCopyWith<$Res> implements $FreelancerMyWorkEventCopyWith<$Res> {
  factory $FreelancerMyWorkStartedCopyWith(FreelancerMyWorkStarted value, $Res Function(FreelancerMyWorkStarted) _then) = _$FreelancerMyWorkStartedCopyWithImpl;
@useResult
$Res call({
 FreelancerMyWorkTab? initialTab
});




}
/// @nodoc
class _$FreelancerMyWorkStartedCopyWithImpl<$Res>
    implements $FreelancerMyWorkStartedCopyWith<$Res> {
  _$FreelancerMyWorkStartedCopyWithImpl(this._self, this._then);

  final FreelancerMyWorkStarted _self;
  final $Res Function(FreelancerMyWorkStarted) _then;

/// Create a copy of FreelancerMyWorkEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? initialTab = freezed,}) {
  return _then(FreelancerMyWorkStarted(
initialTab: freezed == initialTab ? _self.initialTab : initialTab // ignore: cast_nullable_to_non_nullable
as FreelancerMyWorkTab?,
  ));
}


}

/// @nodoc


class FreelancerMyWorkTabChanged implements FreelancerMyWorkEvent {
  const FreelancerMyWorkTabChanged({required this.tab});
  

 final  FreelancerMyWorkTab tab;

/// Create a copy of FreelancerMyWorkEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerMyWorkTabChangedCopyWith<FreelancerMyWorkTabChanged> get copyWith => _$FreelancerMyWorkTabChangedCopyWithImpl<FreelancerMyWorkTabChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerMyWorkTabChanged&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,tab);

@override
String toString() {
  return 'FreelancerMyWorkEvent.tabChanged(tab: $tab)';
}


}

/// @nodoc
abstract mixin class $FreelancerMyWorkTabChangedCopyWith<$Res> implements $FreelancerMyWorkEventCopyWith<$Res> {
  factory $FreelancerMyWorkTabChangedCopyWith(FreelancerMyWorkTabChanged value, $Res Function(FreelancerMyWorkTabChanged) _then) = _$FreelancerMyWorkTabChangedCopyWithImpl;
@useResult
$Res call({
 FreelancerMyWorkTab tab
});




}
/// @nodoc
class _$FreelancerMyWorkTabChangedCopyWithImpl<$Res>
    implements $FreelancerMyWorkTabChangedCopyWith<$Res> {
  _$FreelancerMyWorkTabChangedCopyWithImpl(this._self, this._then);

  final FreelancerMyWorkTabChanged _self;
  final $Res Function(FreelancerMyWorkTabChanged) _then;

/// Create a copy of FreelancerMyWorkEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tab = null,}) {
  return _then(FreelancerMyWorkTabChanged(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as FreelancerMyWorkTab,
  ));
}


}

/// @nodoc


class FreelancerMyWorkApplicationFilterChanged implements FreelancerMyWorkEvent {
  const FreelancerMyWorkApplicationFilterChanged({required this.filter});
  

 final  FreelancerApplicationFilter filter;

/// Create a copy of FreelancerMyWorkEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerMyWorkApplicationFilterChangedCopyWith<FreelancerMyWorkApplicationFilterChanged> get copyWith => _$FreelancerMyWorkApplicationFilterChangedCopyWithImpl<FreelancerMyWorkApplicationFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerMyWorkApplicationFilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'FreelancerMyWorkEvent.applicationFilterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $FreelancerMyWorkApplicationFilterChangedCopyWith<$Res> implements $FreelancerMyWorkEventCopyWith<$Res> {
  factory $FreelancerMyWorkApplicationFilterChangedCopyWith(FreelancerMyWorkApplicationFilterChanged value, $Res Function(FreelancerMyWorkApplicationFilterChanged) _then) = _$FreelancerMyWorkApplicationFilterChangedCopyWithImpl;
@useResult
$Res call({
 FreelancerApplicationFilter filter
});




}
/// @nodoc
class _$FreelancerMyWorkApplicationFilterChangedCopyWithImpl<$Res>
    implements $FreelancerMyWorkApplicationFilterChangedCopyWith<$Res> {
  _$FreelancerMyWorkApplicationFilterChangedCopyWithImpl(this._self, this._then);

  final FreelancerMyWorkApplicationFilterChanged _self;
  final $Res Function(FreelancerMyWorkApplicationFilterChanged) _then;

/// Create a copy of FreelancerMyWorkEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(FreelancerMyWorkApplicationFilterChanged(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as FreelancerApplicationFilter,
  ));
}


}

/// @nodoc


class FreelancerMyWorkJobFilterChanged implements FreelancerMyWorkEvent {
  const FreelancerMyWorkJobFilterChanged({required this.filter});
  

 final  FreelancerJobFilter filter;

/// Create a copy of FreelancerMyWorkEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerMyWorkJobFilterChangedCopyWith<FreelancerMyWorkJobFilterChanged> get copyWith => _$FreelancerMyWorkJobFilterChangedCopyWithImpl<FreelancerMyWorkJobFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerMyWorkJobFilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'FreelancerMyWorkEvent.jobFilterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $FreelancerMyWorkJobFilterChangedCopyWith<$Res> implements $FreelancerMyWorkEventCopyWith<$Res> {
  factory $FreelancerMyWorkJobFilterChangedCopyWith(FreelancerMyWorkJobFilterChanged value, $Res Function(FreelancerMyWorkJobFilterChanged) _then) = _$FreelancerMyWorkJobFilterChangedCopyWithImpl;
@useResult
$Res call({
 FreelancerJobFilter filter
});




}
/// @nodoc
class _$FreelancerMyWorkJobFilterChangedCopyWithImpl<$Res>
    implements $FreelancerMyWorkJobFilterChangedCopyWith<$Res> {
  _$FreelancerMyWorkJobFilterChangedCopyWithImpl(this._self, this._then);

  final FreelancerMyWorkJobFilterChanged _self;
  final $Res Function(FreelancerMyWorkJobFilterChanged) _then;

/// Create a copy of FreelancerMyWorkEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(FreelancerMyWorkJobFilterChanged(
filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as FreelancerJobFilter,
  ));
}


}

/// @nodoc


class FreelancerMyWorkRetry implements FreelancerMyWorkEvent {
  const FreelancerMyWorkRetry();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerMyWorkRetry);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerMyWorkEvent.retry()';
}


}




// dart format on
