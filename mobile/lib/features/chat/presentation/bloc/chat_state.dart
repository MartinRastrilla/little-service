import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile/features/chat/domain/entities/chat_access.dart';
import 'package:mobile/features/chat/domain/entities/chat_message.dart';

part 'chat_state.freezed.dart';

@freezed
sealed class ChatState with _$ChatState {
  const factory ChatState.loading() = ChatLoading;

  const factory ChatState.loaded({
    required String serviceRequestId,
    required String withUserId,
    required String currentUserId,
    required List<ChatMessage> messages,
    required ChatAccess access,
    required bool hasMore,
    DateTime? nextCursor,
    String? interlocutorName,
    @Default(false) bool isLoadingOlder,
    @Default(false) bool isSending,
    String? sendError,
  }) = ChatLoaded;

  const factory ChatState.failure({required String message}) = ChatFailure;
}
