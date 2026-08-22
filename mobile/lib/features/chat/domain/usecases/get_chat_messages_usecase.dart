import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/chat/domain/entities/paged_messages.dart';
import 'package:mobile/features/chat/domain/repositories/chat_repository.dart';

class GetChatMessagesParams {
  final String serviceRequestId;
  final String withUserId;
  final DateTime? cursor;
  final int limit;

  const GetChatMessagesParams({
    required this.serviceRequestId,
    required this.withUserId,
    this.cursor,
    this.limit = 50,
  });
}

class GetChatMessagesUseCase
    implements UseCase<PagedMessages, GetChatMessagesParams> {
  final ChatRepository repository;

  const GetChatMessagesUseCase(this.repository);

  @override
  Future<Either<Failure, PagedMessages>> call(GetChatMessagesParams params) {
    return repository.getMessages(
      serviceRequestId: params.serviceRequestId,
      withUserId: params.withUserId,
      cursor: params.cursor,
      limit: params.limit,
    );
  }
}
