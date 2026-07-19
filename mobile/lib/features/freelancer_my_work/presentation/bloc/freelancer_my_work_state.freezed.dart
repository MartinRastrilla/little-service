// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelancer_my_work_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FreelancerMyWorkState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerMyWorkState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerMyWorkState()';
}


}

/// @nodoc
class $FreelancerMyWorkStateCopyWith<$Res>  {
$FreelancerMyWorkStateCopyWith(FreelancerMyWorkState _, $Res Function(FreelancerMyWorkState) __);
}


/// Adds pattern-matching-related methods to [FreelancerMyWorkState].
extension FreelancerMyWorkStatePatterns on FreelancerMyWorkState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FreelancerMyWorkInitial value)?  initial,TResult Function( FreelancerMyWorkLoading value)?  loading,TResult Function( FreelancerMyWorkLoaded value)?  loaded,TResult Function( FreelancerMyWorkEmpty value)?  empty,TResult Function( FreelancerMyWorkFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FreelancerMyWorkInitial() when initial != null:
return initial(_that);case FreelancerMyWorkLoading() when loading != null:
return loading(_that);case FreelancerMyWorkLoaded() when loaded != null:
return loaded(_that);case FreelancerMyWorkEmpty() when empty != null:
return empty(_that);case FreelancerMyWorkFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FreelancerMyWorkInitial value)  initial,required TResult Function( FreelancerMyWorkLoading value)  loading,required TResult Function( FreelancerMyWorkLoaded value)  loaded,required TResult Function( FreelancerMyWorkEmpty value)  empty,required TResult Function( FreelancerMyWorkFailure value)  failure,}){
final _that = this;
switch (_that) {
case FreelancerMyWorkInitial():
return initial(_that);case FreelancerMyWorkLoading():
return loading(_that);case FreelancerMyWorkLoaded():
return loaded(_that);case FreelancerMyWorkEmpty():
return empty(_that);case FreelancerMyWorkFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FreelancerMyWorkInitial value)?  initial,TResult? Function( FreelancerMyWorkLoading value)?  loading,TResult? Function( FreelancerMyWorkLoaded value)?  loaded,TResult? Function( FreelancerMyWorkEmpty value)?  empty,TResult? Function( FreelancerMyWorkFailure value)?  failure,}){
final _that = this;
switch (_that) {
case FreelancerMyWorkInitial() when initial != null:
return initial(_that);case FreelancerMyWorkLoading() when loading != null:
return loading(_that);case FreelancerMyWorkLoaded() when loaded != null:
return loaded(_that);case FreelancerMyWorkEmpty() when empty != null:
return empty(_that);case FreelancerMyWorkFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( FreelancerMyWorkTab tab,  FreelancerApplicationFilter applicationFilter,  FreelancerJobFilter jobFilter)?  loading,TResult Function( FreelancerMyWorkTab tab,  FreelancerApplicationFilter applicationFilter,  FreelancerJobFilter jobFilter,  List<FreelancerWorkItem> applications,  List<FreelancerWorkItem> jobs)?  loaded,TResult Function( FreelancerMyWorkTab tab,  FreelancerApplicationFilter applicationFilter,  FreelancerJobFilter jobFilter)?  empty,TResult Function( FreelancerMyWorkTab tab,  FreelancerApplicationFilter applicationFilter,  FreelancerJobFilter jobFilter,  String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FreelancerMyWorkInitial() when initial != null:
return initial();case FreelancerMyWorkLoading() when loading != null:
return loading(_that.tab,_that.applicationFilter,_that.jobFilter);case FreelancerMyWorkLoaded() when loaded != null:
return loaded(_that.tab,_that.applicationFilter,_that.jobFilter,_that.applications,_that.jobs);case FreelancerMyWorkEmpty() when empty != null:
return empty(_that.tab,_that.applicationFilter,_that.jobFilter);case FreelancerMyWorkFailure() when failure != null:
return failure(_that.tab,_that.applicationFilter,_that.jobFilter,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( FreelancerMyWorkTab tab,  FreelancerApplicationFilter applicationFilter,  FreelancerJobFilter jobFilter)  loading,required TResult Function( FreelancerMyWorkTab tab,  FreelancerApplicationFilter applicationFilter,  FreelancerJobFilter jobFilter,  List<FreelancerWorkItem> applications,  List<FreelancerWorkItem> jobs)  loaded,required TResult Function( FreelancerMyWorkTab tab,  FreelancerApplicationFilter applicationFilter,  FreelancerJobFilter jobFilter)  empty,required TResult Function( FreelancerMyWorkTab tab,  FreelancerApplicationFilter applicationFilter,  FreelancerJobFilter jobFilter,  String message)  failure,}) {final _that = this;
switch (_that) {
case FreelancerMyWorkInitial():
return initial();case FreelancerMyWorkLoading():
return loading(_that.tab,_that.applicationFilter,_that.jobFilter);case FreelancerMyWorkLoaded():
return loaded(_that.tab,_that.applicationFilter,_that.jobFilter,_that.applications,_that.jobs);case FreelancerMyWorkEmpty():
return empty(_that.tab,_that.applicationFilter,_that.jobFilter);case FreelancerMyWorkFailure():
return failure(_that.tab,_that.applicationFilter,_that.jobFilter,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( FreelancerMyWorkTab tab,  FreelancerApplicationFilter applicationFilter,  FreelancerJobFilter jobFilter)?  loading,TResult? Function( FreelancerMyWorkTab tab,  FreelancerApplicationFilter applicationFilter,  FreelancerJobFilter jobFilter,  List<FreelancerWorkItem> applications,  List<FreelancerWorkItem> jobs)?  loaded,TResult? Function( FreelancerMyWorkTab tab,  FreelancerApplicationFilter applicationFilter,  FreelancerJobFilter jobFilter)?  empty,TResult? Function( FreelancerMyWorkTab tab,  FreelancerApplicationFilter applicationFilter,  FreelancerJobFilter jobFilter,  String message)?  failure,}) {final _that = this;
switch (_that) {
case FreelancerMyWorkInitial() when initial != null:
return initial();case FreelancerMyWorkLoading() when loading != null:
return loading(_that.tab,_that.applicationFilter,_that.jobFilter);case FreelancerMyWorkLoaded() when loaded != null:
return loaded(_that.tab,_that.applicationFilter,_that.jobFilter,_that.applications,_that.jobs);case FreelancerMyWorkEmpty() when empty != null:
return empty(_that.tab,_that.applicationFilter,_that.jobFilter);case FreelancerMyWorkFailure() when failure != null:
return failure(_that.tab,_that.applicationFilter,_that.jobFilter,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class FreelancerMyWorkInitial implements FreelancerMyWorkState {
  const FreelancerMyWorkInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerMyWorkInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FreelancerMyWorkState.initial()';
}


}




/// @nodoc


class FreelancerMyWorkLoading implements FreelancerMyWorkState {
  const FreelancerMyWorkLoading({required this.tab, required this.applicationFilter, required this.jobFilter});
  

 final  FreelancerMyWorkTab tab;
 final  FreelancerApplicationFilter applicationFilter;
 final  FreelancerJobFilter jobFilter;

/// Create a copy of FreelancerMyWorkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerMyWorkLoadingCopyWith<FreelancerMyWorkLoading> get copyWith => _$FreelancerMyWorkLoadingCopyWithImpl<FreelancerMyWorkLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerMyWorkLoading&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.applicationFilter, applicationFilter) || other.applicationFilter == applicationFilter)&&(identical(other.jobFilter, jobFilter) || other.jobFilter == jobFilter));
}


@override
int get hashCode => Object.hash(runtimeType,tab,applicationFilter,jobFilter);

@override
String toString() {
  return 'FreelancerMyWorkState.loading(tab: $tab, applicationFilter: $applicationFilter, jobFilter: $jobFilter)';
}


}

/// @nodoc
abstract mixin class $FreelancerMyWorkLoadingCopyWith<$Res> implements $FreelancerMyWorkStateCopyWith<$Res> {
  factory $FreelancerMyWorkLoadingCopyWith(FreelancerMyWorkLoading value, $Res Function(FreelancerMyWorkLoading) _then) = _$FreelancerMyWorkLoadingCopyWithImpl;
@useResult
$Res call({
 FreelancerMyWorkTab tab, FreelancerApplicationFilter applicationFilter, FreelancerJobFilter jobFilter
});




}
/// @nodoc
class _$FreelancerMyWorkLoadingCopyWithImpl<$Res>
    implements $FreelancerMyWorkLoadingCopyWith<$Res> {
  _$FreelancerMyWorkLoadingCopyWithImpl(this._self, this._then);

  final FreelancerMyWorkLoading _self;
  final $Res Function(FreelancerMyWorkLoading) _then;

/// Create a copy of FreelancerMyWorkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tab = null,Object? applicationFilter = null,Object? jobFilter = null,}) {
  return _then(FreelancerMyWorkLoading(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as FreelancerMyWorkTab,applicationFilter: null == applicationFilter ? _self.applicationFilter : applicationFilter // ignore: cast_nullable_to_non_nullable
as FreelancerApplicationFilter,jobFilter: null == jobFilter ? _self.jobFilter : jobFilter // ignore: cast_nullable_to_non_nullable
as FreelancerJobFilter,
  ));
}


}

/// @nodoc


class FreelancerMyWorkLoaded implements FreelancerMyWorkState {
  const FreelancerMyWorkLoaded({required this.tab, required this.applicationFilter, required this.jobFilter, required  List<FreelancerWorkItem> applications, required  List<FreelancerWorkItem> jobs}): _applications = applications,_jobs = jobs;
  

 final  FreelancerMyWorkTab tab;
 final  FreelancerApplicationFilter applicationFilter;
 final  FreelancerJobFilter jobFilter;
 final  List<FreelancerWorkItem> _applications;
 List<FreelancerWorkItem> get applications {
  if (_applications is EqualUnmodifiableListView) return _applications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applications);
}

 final  List<FreelancerWorkItem> _jobs;
 List<FreelancerWorkItem> get jobs {
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobs);
}


/// Create a copy of FreelancerMyWorkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerMyWorkLoadedCopyWith<FreelancerMyWorkLoaded> get copyWith => _$FreelancerMyWorkLoadedCopyWithImpl<FreelancerMyWorkLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerMyWorkLoaded&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.applicationFilter, applicationFilter) || other.applicationFilter == applicationFilter)&&(identical(other.jobFilter, jobFilter) || other.jobFilter == jobFilter)&&const DeepCollectionEquality().equals(other._applications, _applications)&&const DeepCollectionEquality().equals(other._jobs, _jobs));
}


@override
int get hashCode => Object.hash(runtimeType,tab,applicationFilter,jobFilter,const DeepCollectionEquality().hash(_applications),const DeepCollectionEquality().hash(_jobs));

@override
String toString() {
  return 'FreelancerMyWorkState.loaded(tab: $tab, applicationFilter: $applicationFilter, jobFilter: $jobFilter, applications: $applications, jobs: $jobs)';
}


}

/// @nodoc
abstract mixin class $FreelancerMyWorkLoadedCopyWith<$Res> implements $FreelancerMyWorkStateCopyWith<$Res> {
  factory $FreelancerMyWorkLoadedCopyWith(FreelancerMyWorkLoaded value, $Res Function(FreelancerMyWorkLoaded) _then) = _$FreelancerMyWorkLoadedCopyWithImpl;
@useResult
$Res call({
 FreelancerMyWorkTab tab, FreelancerApplicationFilter applicationFilter, FreelancerJobFilter jobFilter, List<FreelancerWorkItem> applications, List<FreelancerWorkItem> jobs
});




}
/// @nodoc
class _$FreelancerMyWorkLoadedCopyWithImpl<$Res>
    implements $FreelancerMyWorkLoadedCopyWith<$Res> {
  _$FreelancerMyWorkLoadedCopyWithImpl(this._self, this._then);

  final FreelancerMyWorkLoaded _self;
  final $Res Function(FreelancerMyWorkLoaded) _then;

/// Create a copy of FreelancerMyWorkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tab = null,Object? applicationFilter = null,Object? jobFilter = null,Object? applications = null,Object? jobs = null,}) {
  return _then(FreelancerMyWorkLoaded(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as FreelancerMyWorkTab,applicationFilter: null == applicationFilter ? _self.applicationFilter : applicationFilter // ignore: cast_nullable_to_non_nullable
as FreelancerApplicationFilter,jobFilter: null == jobFilter ? _self.jobFilter : jobFilter // ignore: cast_nullable_to_non_nullable
as FreelancerJobFilter,applications: null == applications ? _self._applications : applications // ignore: cast_nullable_to_non_nullable
as List<FreelancerWorkItem>,jobs: null == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<FreelancerWorkItem>,
  ));
}


}

/// @nodoc


class FreelancerMyWorkEmpty implements FreelancerMyWorkState {
  const FreelancerMyWorkEmpty({required this.tab, required this.applicationFilter, required this.jobFilter});
  

 final  FreelancerMyWorkTab tab;
 final  FreelancerApplicationFilter applicationFilter;
 final  FreelancerJobFilter jobFilter;

/// Create a copy of FreelancerMyWorkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerMyWorkEmptyCopyWith<FreelancerMyWorkEmpty> get copyWith => _$FreelancerMyWorkEmptyCopyWithImpl<FreelancerMyWorkEmpty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerMyWorkEmpty&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.applicationFilter, applicationFilter) || other.applicationFilter == applicationFilter)&&(identical(other.jobFilter, jobFilter) || other.jobFilter == jobFilter));
}


@override
int get hashCode => Object.hash(runtimeType,tab,applicationFilter,jobFilter);

@override
String toString() {
  return 'FreelancerMyWorkState.empty(tab: $tab, applicationFilter: $applicationFilter, jobFilter: $jobFilter)';
}


}

/// @nodoc
abstract mixin class $FreelancerMyWorkEmptyCopyWith<$Res> implements $FreelancerMyWorkStateCopyWith<$Res> {
  factory $FreelancerMyWorkEmptyCopyWith(FreelancerMyWorkEmpty value, $Res Function(FreelancerMyWorkEmpty) _then) = _$FreelancerMyWorkEmptyCopyWithImpl;
@useResult
$Res call({
 FreelancerMyWorkTab tab, FreelancerApplicationFilter applicationFilter, FreelancerJobFilter jobFilter
});




}
/// @nodoc
class _$FreelancerMyWorkEmptyCopyWithImpl<$Res>
    implements $FreelancerMyWorkEmptyCopyWith<$Res> {
  _$FreelancerMyWorkEmptyCopyWithImpl(this._self, this._then);

  final FreelancerMyWorkEmpty _self;
  final $Res Function(FreelancerMyWorkEmpty) _then;

/// Create a copy of FreelancerMyWorkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tab = null,Object? applicationFilter = null,Object? jobFilter = null,}) {
  return _then(FreelancerMyWorkEmpty(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as FreelancerMyWorkTab,applicationFilter: null == applicationFilter ? _self.applicationFilter : applicationFilter // ignore: cast_nullable_to_non_nullable
as FreelancerApplicationFilter,jobFilter: null == jobFilter ? _self.jobFilter : jobFilter // ignore: cast_nullable_to_non_nullable
as FreelancerJobFilter,
  ));
}


}

/// @nodoc


class FreelancerMyWorkFailure implements FreelancerMyWorkState {
  const FreelancerMyWorkFailure({required this.tab, required this.applicationFilter, required this.jobFilter, required this.message});
  

 final  FreelancerMyWorkTab tab;
 final  FreelancerApplicationFilter applicationFilter;
 final  FreelancerJobFilter jobFilter;
 final  String message;

/// Create a copy of FreelancerMyWorkState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelancerMyWorkFailureCopyWith<FreelancerMyWorkFailure> get copyWith => _$FreelancerMyWorkFailureCopyWithImpl<FreelancerMyWorkFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelancerMyWorkFailure&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.applicationFilter, applicationFilter) || other.applicationFilter == applicationFilter)&&(identical(other.jobFilter, jobFilter) || other.jobFilter == jobFilter)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,tab,applicationFilter,jobFilter,message);

@override
String toString() {
  return 'FreelancerMyWorkState.failure(tab: $tab, applicationFilter: $applicationFilter, jobFilter: $jobFilter, message: $message)';
}


}

/// @nodoc
abstract mixin class $FreelancerMyWorkFailureCopyWith<$Res> implements $FreelancerMyWorkStateCopyWith<$Res> {
  factory $FreelancerMyWorkFailureCopyWith(FreelancerMyWorkFailure value, $Res Function(FreelancerMyWorkFailure) _then) = _$FreelancerMyWorkFailureCopyWithImpl;
@useResult
$Res call({
 FreelancerMyWorkTab tab, FreelancerApplicationFilter applicationFilter, FreelancerJobFilter jobFilter, String message
});




}
/// @nodoc
class _$FreelancerMyWorkFailureCopyWithImpl<$Res>
    implements $FreelancerMyWorkFailureCopyWith<$Res> {
  _$FreelancerMyWorkFailureCopyWithImpl(this._self, this._then);

  final FreelancerMyWorkFailure _self;
  final $Res Function(FreelancerMyWorkFailure) _then;

/// Create a copy of FreelancerMyWorkState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tab = null,Object? applicationFilter = null,Object? jobFilter = null,Object? message = null,}) {
  return _then(FreelancerMyWorkFailure(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as FreelancerMyWorkTab,applicationFilter: null == applicationFilter ? _self.applicationFilter : applicationFilter // ignore: cast_nullable_to_non_nullable
as FreelancerApplicationFilter,jobFilter: null == jobFilter ? _self.jobFilter : jobFilter // ignore: cast_nullable_to_non_nullable
as FreelancerJobFilter,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
