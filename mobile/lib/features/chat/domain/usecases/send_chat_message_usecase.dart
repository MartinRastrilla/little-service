import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/chat/domain/entities/chat_message.dart';
import 'package:mobile/features/chat/domain/repositories/chat_repository.dart';

class SendChatMessageParams {
  final String serviceRequestId;
  final String toUserId;
  final String content;

  const SendChatMessageParams({
    required this.serviceRequestId,
    required this.toUserId,
    required this.content,
  });
}

class SendChatMessageUseCase
    implements UseCase<ChatMessage, SendChatMessageParams> {
  final ChatRepository repository;

  const SendChatMessageUseCase(this.repository);

  @override
  Future<Either<Failure, ChatMessage>> call(SendChatMessageParams params) {
    return repository.sendMessage(
      serviceRequestId: params.serviceRequestId,
      toUserId: params.toUserId,
      content: params.content,
    );
  }
}
