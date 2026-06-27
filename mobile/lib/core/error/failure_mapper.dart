import 'package:mobile/core/error/exceptions.dart';
import 'package:mobile/core/error/failures.dart';

Failure mapExceptionToFailure(Object error) {
  if (error is ApiException) {
    final message = error.message ?? 'Error de servidor';
    if (error.statusCode == null) {
      return NetworkFailure(message, code: error.code);
    }
    return ServerFailure(message, code: error.code);
  }

  return const ServerFailure('Ocurrió un error inesperado', code: 'UNKNOWN');
}
