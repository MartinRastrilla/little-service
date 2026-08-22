import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failures.dart';
import 'package:mobile/core/usecases/usecase.dart';
import 'package:mobile/features/chat/domain/entities/chat_access.dart';
import 'package:mobile/features/chat/domain/repositories/chat_repository.dart';

class GetChatAccessParams {
  final String serviceRequestId;
  final String withUserId;

  const GetChatAccessParams({
    required this.serviceRequestId,
    required this.withUserId,
  });
}

class GetChatAccessUseCase
    implements UseCase<ChatAccess, GetChatAccessParams> {
  final ChatRepository repository;

  const GetChatAccessUseCase(this.repository);

  @override
  Future<Either<Failure, ChatAccess>> call(GetChatAccessParams params) {
    return repository.getChatAccess(
      serviceRequestId: params.serviceRequestId,
      withUserId: params.withUserId,
    );
  }
}
