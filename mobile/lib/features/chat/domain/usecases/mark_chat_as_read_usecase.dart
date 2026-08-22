import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/chat/domain/repositories/chat_repository.dart';

class MarkChatAsReadParams {
  final String serviceRequestId;
  final String withUserId;

  const MarkChatAsReadParams({
    required this.serviceRequestId,
    required this.withUserId,
  });
}

class MarkChatAsReadUseCase implements UseCase<void, MarkChatAsReadParams> {
  final ChatRepository repository;

  const MarkChatAsReadUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(MarkChatAsReadParams params) {
    return repository.markAsRead(
      serviceRequestId: params.serviceRequestId,
      withUserId: params.withUserId,
    );
  }
}
