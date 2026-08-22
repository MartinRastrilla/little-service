// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent()';
}


}

/// @nodoc
class $ChatEventCopyWith<$Res>  {
$ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}


/// Adds pattern-matching-related methods to [ChatEvent].
extension ChatEventPatterns on ChatEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatOpened value)?  opened,TResult Function( ChatSendMessage value)?  sendMessage,TResult Function( ChatLoadOlderMessages value)?  loadOlderMessages,TResult Function( ChatMessageReceived value)?  messageReceived,TResult Function( ChatMessagesRead value)?  messagesRead,TResult Function( ChatClosed value)?  closed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatOpened() when opened != null:
return opened(_that);case ChatSendMessage() when sendMessage != null:
return sendMessage(_that);case ChatLoadOlderMessages() when loadOlderMessages != null:
return loadOlderMessages(_that);case ChatMessageReceived() when messageReceived != null:
return messageReceived(_that);case ChatMessagesRead() when messagesRead != null:
return messagesRead(_that);case ChatClosed() when closed != null:
return closed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatOpened value)  opened,required TResult Function( ChatSendMessage value)  sendMessage,required TResult Function( ChatLoadOlderMessages value)  loadOlderMessages,required TResult Function( ChatMessageReceived value)  messageReceived,required TResult Function( ChatMessagesRead value)  messagesRead,required TResult Function( ChatClosed value)  closed,}){
final _that = this;
switch (_that) {
case ChatOpened():
return opened(_that);case ChatSendMessage():
return sendMessage(_that);case ChatLoadOlderMessages():
return loadOlderMessages(_that);case ChatMessageReceived():
return messageReceived(_that);case ChatMessagesRead():
return messagesRead(_that);case ChatClosed():
return closed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatOpened value)?  opened,TResult? Function( ChatSendMessage value)?  sendMessage,TResult? Function( ChatLoadOlderMessages value)?  loadOlderMessages,TResult? Function( ChatMessageReceived value)?  messageReceived,TResult? Function( ChatMessagesRead value)?  messagesRead,TResult? Function( ChatClosed value)?  closed,}){
final _that = this;
switch (_that) {
case ChatOpened() when opened != null:
return opened(_that);case ChatSendMessage() when sendMessage != null:
return sendMessage(_that);case ChatLoadOlderMessages() when loadOlderMessages != null:
return loadOlderMessages(_that);case ChatMessageReceived() when messageReceived != null:
return messageReceived(_that);case ChatMessagesRead() when messagesRead != null:
return messagesRead(_that);case ChatClosed() when closed != null:
return closed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String serviceRequestId,  String currentUserId,  String? withUserId,  String? interlocutorName)?  opened,TResult Function( String content)?  sendMessage,TResult Function()?  loadOlderMessages,TResult Function( ChatMessage message)?  messageReceived,TResult Function( String readByUserId,  String withUserId)?  messagesRead,TResult Function()?  closed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatOpened() when opened != null:
return opened(_that.serviceRequestId,_that.currentUserId,_that.withUserId,_that.interlocutorName);case ChatSendMessage() when sendMessage != null:
return sendMessage(_that.content);case ChatLoadOlderMessages() when loadOlderMessages != null:
return loadOlderMessages();case ChatMessageReceived() when messageReceived != null:
return messageReceived(_that.message);case ChatMessagesRead() when messagesRead != null:
return messagesRead(_that.readByUserId,_that.withUserId);case ChatClosed() when closed != null:
return closed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String serviceRequestId,  String currentUserId,  String? withUserId,  String? interlocutorName)  opened,required TResult Function( String content)  sendMessage,required TResult Function()  loadOlderMessages,required TResult Function( ChatMessage message)  messageReceived,required TResult Function( String readByUserId,  String withUserId)  messagesRead,required TResult Function()  closed,}) {final _that = this;
switch (_that) {
case ChatOpened():
return opened(_that.serviceRequestId,_that.currentUserId,_that.withUserId,_that.interlocutorName);case ChatSendMessage():
return sendMessage(_that.content);case ChatLoadOlderMessages():
return loadOlderMessages();case ChatMessageReceived():
return messageReceived(_that.message);case ChatMessagesRead():
return messagesRead(_that.readByUserId,_that.withUserId);case ChatClosed():
return closed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String serviceRequestId,  String currentUserId,  String? withUserId,  String? interlocutorName)?  opened,TResult? Function( String content)?  sendMessage,TResult? Function()?  loadOlderMessages,TResult? Function( ChatMessage message)?  messageReceived,TResult? Function( String readByUserId,  String withUserId)?  messagesRead,TResult? Function()?  closed,}) {final _that = this;
switch (_that) {
case ChatOpened() when opened != null:
return opened(_that.serviceRequestId,_that.currentUserId,_that.withUserId,_that.interlocutorName);case ChatSendMessage() when sendMessage != null:
return sendMessage(_that.content);case ChatLoadOlderMessages() when loadOlderMessages != null:
return loadOlderMessages();case ChatMessageReceived() when messageReceived != null:
return messageReceived(_that.message);case ChatMessagesRead() when messagesRead != null:
return messagesRead(_that.readByUserId,_that.withUserId);case ChatClosed() when closed != null:
return closed();case _:
  return null;

}
}

}

/// @nodoc


class ChatOpened implements ChatEvent {
  const ChatOpened({required this.serviceRequestId, required this.currentUserId, this.withUserId, this.interlocutorName});
  

 final  String serviceRequestId;
 final  String currentUserId;
 final  String? withUserId;
 final  String? interlocutorName;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatOpenedCopyWith<ChatOpened> get copyWith => _$ChatOpenedCopyWithImpl<ChatOpened>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatOpened&&(identical(other.serviceRequestId, serviceRequestId) || other.serviceRequestId == serviceRequestId)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.withUserId, withUserId) || other.withUserId == withUserId)&&(identical(other.interlocutorName, interlocutorName) || other.interlocutorName == interlocutorName));
}


@override
int get hashCode => Object.hash(runtimeType,serviceRequestId,currentUserId,withUserId,interlocutorName);

@override
String toString() {
  return 'ChatEvent.opened(serviceRequestId: $serviceRequestId, currentUserId: $currentUserId, withUserId: $withUserId, interlocutorName: $interlocutorName)';
}


}

/// @nodoc
abstract mixin class $ChatOpenedCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $ChatOpenedCopyWith(ChatOpened value, $Res Function(ChatOpened) _then) = _$ChatOpenedCopyWithImpl;
@useResult
$Res call({
 String serviceRequestId, String currentUserId, String? withUserId, String? interlocutorName
});




}
/// @nodoc
class _$ChatOpenedCopyWithImpl<$Res>
    implements $ChatOpenedCopyWith<$Res> {
  _$ChatOpenedCopyWithImpl(this._self, this._then);

  final ChatOpened _self;
  final $Res Function(ChatOpened) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? serviceRequestId = null,Object? currentUserId = null,Object? withUserId = freezed,Object? interlocutorName = freezed,}) {
  return _then(ChatOpened(
serviceRequestId: null == serviceRequestId ? _self.serviceRequestId : serviceRequestId // ignore: cast_nullable_to_non_nullable
as String,currentUserId: null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,withUserId: freezed == withUserId ? _self.withUserId : withUserId // ignore: cast_nullable_to_non_nullable
as String?,interlocutorName: freezed == interlocutorName ? _self.interlocutorName : interlocutorName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ChatSendMessage implements ChatEvent {
  const ChatSendMessage({required this.content});
  

 final  String content;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatSendMessageCopyWith<ChatSendMessage> get copyWith => _$ChatSendMessageCopyWithImpl<ChatSendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatSendMessage&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'ChatEvent.sendMessage(content: $content)';
}


}

/// @nodoc
abstract mixin class $ChatSendMessageCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $ChatSendMessageCopyWith(ChatSendMessage value, $Res Function(ChatSendMessage) _then) = _$ChatSendMessageCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$ChatSendMessageCopyWithImpl<$Res>
    implements $ChatSendMessageCopyWith<$Res> {
  _$ChatSendMessageCopyWithImpl(this._self, this._then);

  final ChatSendMessage _self;
  final $Res Function(ChatSendMessage) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(ChatSendMessage(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatLoadOlderMessages implements ChatEvent {
  const ChatLoadOlderMessages();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatLoadOlderMessages);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.loadOlderMessages()';
}


}




/// @nodoc


class ChatMessageReceived implements ChatEvent {
  const ChatMessageReceived({required this.message});
  

 final  ChatMessage message;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageReceivedCopyWith<ChatMessageReceived> get copyWith => _$ChatMessageReceivedCopyWithImpl<ChatMessageReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessageReceived&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatEvent.messageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatMessageReceivedCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $ChatMessageReceivedCopyWith(ChatMessageReceived value, $Res Function(ChatMessageReceived) _then) = _$ChatMessageReceivedCopyWithImpl;
@useResult
$Res call({
 ChatMessage message
});




}
/// @nodoc
class _$ChatMessageReceivedCopyWithImpl<$Res>
    implements $ChatMessageReceivedCopyWith<$Res> {
  _$ChatMessageReceivedCopyWithImpl(this._self, this._then);

  final ChatMessageReceived _self;
  final $Res Function(ChatMessageReceived) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChatMessageReceived(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as ChatMessage,
  ));
}


}

/// @nodoc


class ChatMessagesRead implements ChatEvent {
  const ChatMessagesRead({required this.readByUserId, required this.withUserId});
  

 final  String readByUserId;
 final  String withUserId;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessagesReadCopyWith<ChatMessagesRead> get copyWith => _$ChatMessagesReadCopyWithImpl<ChatMessagesRead>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessagesRead&&(identical(other.readByUserId, readByUserId) || other.readByUserId == readByUserId)&&(identical(other.withUserId, withUserId) || other.withUserId == withUserId));
}


@override
int get hashCode => Object.hash(runtimeType,readByUserId,withUserId);

@override
String toString() {
  return 'ChatEvent.messagesRead(readByUserId: $readByUserId, withUserId: $withUserId)';
}


}

/// @nodoc
abstract mixin class $ChatMessagesReadCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory $ChatMessagesReadCopyWith(ChatMessagesRead value, $Res Function(ChatMessagesRead) _then) = _$ChatMessagesReadCopyWithImpl;
@useResult
$Res call({
 String readByUserId, String withUserId
});




}
/// @nodoc
class _$ChatMessagesReadCopyWithImpl<$Res>
    implements $ChatMessagesReadCopyWith<$Res> {
  _$ChatMessagesReadCopyWithImpl(this._self, this._then);

  final ChatMessagesRead _self;
  final $Res Function(ChatMessagesRead) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? readByUserId = null,Object? withUserId = null,}) {
  return _then(ChatMessagesRead(
readByUserId: null == readByUserId ? _self.readByUserId : readByUserId // ignore: cast_nullable_to_non_nullable
as String,withUserId: null == withUserId ? _self.withUserId : withUserId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatClosed implements ChatEvent {
  const ChatClosed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatClosed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.closed()';
}


}




// dart format on
