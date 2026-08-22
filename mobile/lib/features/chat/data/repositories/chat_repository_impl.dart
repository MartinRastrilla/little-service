import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure_mapper.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:mobile/features/chat/domain/entities/chat_access.dart';
import 'package:mobile/features/chat/domain/entities/chat_message.dart';
import 'package:mobile/features/chat/domain/entities/conversation_summary.dart';
import 'package:mobile/features/chat/domain/entities/paged_messages.dart';
import 'package:mobile/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remote;

  ChatRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, ChatAccess>> getChatAccess({
    required String serviceRequestId,
    required String withUserId,
  }) async {
    try {
      final model = await remote.getChatAccess(
        serviceRequestId: serviceRequestId,
        withUserId: withUserId,
      );
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, PagedMessages>> getMessages({
    required String serviceRequestId,
    required String withUserId,
    DateTime? cursor,
    int limit = 50,
  }) async {
    try {
      final model = await remote.getMessages(
        serviceRequestId: serviceRequestId,
        withUserId: withUserId,
        cursor: cursor,
        limit: limit,
      );
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, ChatMessage>> sendMessage({
    required String serviceRequestId,
    required String toUserId,
    required String content,
  }) async {
    try {
      final model = await remote.sendMessage(
        serviceRequestId: serviceRequestId,
        toUserId: toUserId,
        content: content,
      );
      return Right(model.toEntity());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead({
    required String serviceRequestId,
    required String withUserId,
  }) async {
    try {
      await remote.markAsRead(
        serviceRequestId: serviceRequestId,
        withUserId: withUserId,
      );
      return const Right(null);
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }

  @override
  Future<Either<Failure, List<ConversationSummary>>> getConversations(
    String serviceRequestId,
  ) async {
    try {
      final models = await remote.getConversations(serviceRequestId);
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (error) {
      return Left(mapExceptionToFailure(error));
    }
  }
}
