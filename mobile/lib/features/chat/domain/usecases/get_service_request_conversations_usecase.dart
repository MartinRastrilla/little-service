import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/chat/domain/entities/conversation_summary.dart';
import 'package:mobile/features/chat/domain/repositories/chat_repository.dart';

class GetServiceRequestConversationsUseCase
    implements UseCase<List<ConversationSummary>, String> {
  final ChatRepository repository;

  const GetServiceRequestConversationsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ConversationSummary>>> call(
    String serviceRequestId,
  ) {
    return repository.getConversations(serviceRequestId);
  }
}
