import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/chat/domain/entities/chat_message.dart';

part 'chat_event.freezed.dart';

@freezed
sealed class ChatEvent with _$ChatEvent {
  const factory ChatEvent.opened({
    required String serviceRequestId,
    required String currentUserId,
    String? withUserId,
    String? interlocutorName,
  }) = ChatOpened;

  const factory ChatEvent.sendMessage({required String content}) = ChatSendMessage;

  const factory ChatEvent.loadOlderMessages() = ChatLoadOlderMessages;

  const factory ChatEvent.messageReceived({required ChatMessage message}) =
      ChatMessageReceived;

  const factory ChatEvent.messagesRead({
    required String readByUserId,
    required String withUserId,
  }) = ChatMessagesRead;

  const factory ChatEvent.closed() = ChatClosed;
}
