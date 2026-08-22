import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/chat/domain/entities/chat_access.dart';
import 'package:mobile/features/chat/domain/entities/chat_message.dart';
import 'package:mobile/features/chat/domain/entities/conversation_summary.dart';
import 'package:mobile/features/chat/domain/entities/paged_messages.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatAccess>> getChatAccess({
    required String serviceRequestId,
    required String withUserId,
  });

  Future<Either<Failure, PagedMessages>> getMessages({
    required String serviceRequestId,
    required String withUserId,
    DateTime? cursor,
    int limit = 50,
  });

  Future<Either<Failure, ChatMessage>> sendMessage({
    required String serviceRequestId,
    required String toUserId,
    required String content,
  });

  Future<Either<Failure, void>> markAsRead({
    required String serviceRequestId,
    required String withUserId,
  });

  Future<Either<Failure, List<ConversationSummary>>> getConversations(
    String serviceRequestId,
  );
}
