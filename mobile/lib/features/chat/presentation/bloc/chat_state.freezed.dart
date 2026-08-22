// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatState()';
}


}

/// @nodoc
class $ChatStateCopyWith<$Res>  {
$ChatStateCopyWith(ChatState _, $Res Function(ChatState) __);
}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatLoading value)?  loading,TResult Function( ChatLoaded value)?  loaded,TResult Function( ChatFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatLoading() when loading != null:
return loading(_that);case ChatLoaded() when loaded != null:
return loaded(_that);case ChatFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatLoading value)  loading,required TResult Function( ChatLoaded value)  loaded,required TResult Function( ChatFailure value)  failure,}){
final _that = this;
switch (_that) {
case ChatLoading():
return loading(_that);case ChatLoaded():
return loaded(_that);case ChatFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatLoading value)?  loading,TResult? Function( ChatLoaded value)?  loaded,TResult? Function( ChatFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ChatLoading() when loading != null:
return loading(_that);case ChatLoaded() when loaded != null:
return loaded(_that);case ChatFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String serviceRequestId,  String withUserId,  String currentUserId,  List<ChatMessage> messages,  ChatAccess access,  bool hasMore,  DateTime? nextCursor,  String? interlocutorName,  bool isLoadingOlder,  bool isSending,  String? sendError)?  loaded,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatLoading() when loading != null:
return loading();case ChatLoaded() when loaded != null:
return loaded(_that.serviceRequestId,_that.withUserId,_that.currentUserId,_that.messages,_that.access,_that.hasMore,_that.nextCursor,_that.interlocutorName,_that.isLoadingOlder,_that.isSending,_that.sendError);case ChatFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String serviceRequestId,  String withUserId,  String currentUserId,  List<ChatMessage> messages,  ChatAccess access,  bool hasMore,  DateTime? nextCursor,  String? interlocutorName,  bool isLoadingOlder,  bool isSending,  String? sendError)  loaded,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case ChatLoading():
return loading();case ChatLoaded():
return loaded(_that.serviceRequestId,_that.withUserId,_that.currentUserId,_that.messages,_that.access,_that.hasMore,_that.nextCursor,_that.interlocutorName,_that.isLoadingOlder,_that.isSending,_that.sendError);case ChatFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String serviceRequestId,  String withUserId,  String currentUserId,  List<ChatMessage> messages,  ChatAccess access,  bool hasMore,  DateTime? nextCursor,  String? interlocutorName,  bool isLoadingOlder,  bool isSending,  String? sendError)?  loaded,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case ChatLoading() when loading != null:
return loading();case ChatLoaded() when loaded != null:
return loaded(_that.serviceRequestId,_that.withUserId,_that.currentUserId,_that.messages,_that.access,_that.hasMore,_that.nextCursor,_that.interlocutorName,_that.isLoadingOlder,_that.isSending,_that.sendError);case ChatFailure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ChatLoading implements ChatState {
  const ChatLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatState.loading()';
}


}




/// @nodoc


class ChatLoaded implements ChatState {
  const ChatLoaded({required this.serviceRequestId, required this.withUserId, required this.currentUserId, required  List<ChatMessage> messages, required this.access, required this.hasMore, this.nextCursor, this.interlocutorName, this.isLoadingOlder = false, this.isSending = false, this.sendError}): _messages = messages;
  

 final  String serviceRequestId;
 final  String withUserId;
 final  String currentUserId;
 final  List<ChatMessage> _messages;
 List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

 final  ChatAccess access;
 final  bool hasMore;
 final  DateTime? nextCursor;
 final  String? interlocutorName;
@JsonKey() final  bool isLoadingOlder;
@JsonKey() final  bool isSending;
 final  String? sendError;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatLoadedCopyWith<ChatLoaded> get copyWith => _$ChatLoadedCopyWithImpl<ChatLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatLoaded&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId)&&(identical(other.withUserId, withUserId) || other.withUserId == withUserId)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.access, access) || other.access == access)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.interlocutorName, interlocutorName) || other.interlocutorName == interlocutorName)&&(identical(other.isLoadingOlder, isLoadingOlder) || other.isLoadingOlder == isLoadingOlder)&&(identical(other.isSending, isSending) || other.isSending == isSending)&&(identical(other.sendError, sendError) || other.sendError == sendError));
}


@override
int get hashCode => Object.hash(runtimeType,serviceRequestId,withUserId,currentUserId,const DeepCollectionEquality().hash(_messages),access,hasMore,nextCursor,interlocutorName,isLoadingOlder,isSending,sendError);

@override
String toString() {
  return 'ChatState.loaded(serviceRequestId: $serviceRequestId, withUserId: $withUserId, currentUserId: $currentUserId, messages: $messages, access: $access, hasMore: $hasMore, nextCursor: $nextCursor, interlocutorName: $interlocutorName, isLoadingOlder: $isLoadingOlder, isSending: $isSending, sendError: $sendError)';
}


}

/// @nodoc
abstract mixin class $ChatLoadedCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory $ChatLoadedCopyWith(ChatLoaded value, $Res Function(ChatLoaded) _then) = _$ChatLoadedCopyWithImpl;
@useResult
$Res call({
 String serviceRequestId, String withUserId, String currentUserId, List<ChatMessage> messages, ChatAccess access, bool hasMore, DateTime? nextCursor, String? interlocutorName, bool isLoadingOlder, bool isSending, String? sendError
});




}
/// @nodoc
class _$ChatLoadedCopyWithImpl<$Res>
    implements $ChatLoadedCopyWith<$Res> {
  _$ChatLoadedCopyWithImpl(this._self, this._then);

  final ChatLoaded _self;
  final $Res Function(ChatLoaded) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceRequestId = null,Object? withUserId = null,Object? currentUserId = null,Object? messages = null,Object? access = null,Object? hasMore = null,Object? nextCursor = freezed,Object? interlocutorName = freezed,Object? isLoadingOlder = null,Object? isSending = null,Object? sendError = freezed,}) {
  return _then(ChatLoaded(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,withUserId: null == withUserId ? _self.withUserId : withUserId // ignore: cast_nullable_to_non_nullable
as String,currentUserId: null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,access: null == access ? _self.access : access // ignore: cast_nullable_to_non_nullable
as ChatAccess,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as DateTime?,interlocutorName: freezed == interlocutorName ? _self.interlocutorName : interlocutorName // ignore: cast_nullable_to_non_nullable
as String?,isLoadingOlder: null == isLoadingOlder ? _self.isLoadingOlder : isLoadingOlder // ignore: cast_nullable_to_non_nullable
as bool,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,sendError: freezed == sendError ? _self.sendError : sendError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ChatFailure implements ChatState {
  const ChatFailure({required this.message});
  

 final  String message;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatFailureCopyWith<ChatFailure> get copyWith => _$ChatFailureCopyWithImpl<ChatFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatFailureCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory $ChatFailureCopyWith(ChatFailure value, $Res Function(ChatFailure) _then) = _$ChatFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChatFailureCopyWithImpl<$Res>
    implements $ChatFailureCopyWith<$Res> {
  _$ChatFailureCopyWithImpl(this._self, this._then);

  final ChatFailure _self;
  final $Res Function(ChatFailure) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChatFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
