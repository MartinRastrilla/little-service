import 'package:dio/dio.dart';
import 'package:mobile/core/error/exceptions.dart';
import 'package:mobile/features/chat/data/models/chat_access_model.dart';
import 'package:mobile/features/chat/data/models/chat_message_model.dart';
import 'package:mobile/features/chat/data/models/conversation_summary_model.dart';
import 'package:mobile/features/chat/data/models/paged_messages_model.dart';

class ChatRemoteDataSource {
  final Dio dio;

  const ChatRemoteDataSource({required this.dio});

  Future<ChatAccessModel> getChatAccess({
    required String serviceRequestId,
    required String withUserId,
  }) async {
    try {
      final response = await dio.get(
        '/service-requests/$serviceRequestId/chat-access',
        queryParameters: {'withUserId': withUserId},
      );
      return _parseObject(response, ChatAccessModel.fromJson);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<PagedMessagesModel> getMessages({
    required String serviceRequestId,
    required String withUserId,
    DateTime? cursor,
    int limit = 50,
  }) async {
    try {
      final response = await dio.get(
        '/service-requests/$serviceRequestId/messages',
        queryParameters: {
          'withUserId': withUserId,
          'limit': limit,
          if (cursor != null) 'cursor': cursor.toUtc().toIso8601String(),
        },
      );
      return _parseObject(response, PagedMessagesModel.fromJson);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ChatMessageModel> sendMessage({
    required String serviceRequestId,
    required String toUserId,
    required String content,
  }) async {
    try {
      final response = await dio.post(
        '/service-requests/$serviceRequestId/messages',
        data: {'toUserId': toUserId, 'content': content},
      );
      return _parseObject(response, ChatMessageModel.fromJson);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<void> markAsRead({
    required String serviceRequestId,
    required String withUserId,
  }) async {
    try {
      await dio.post(
        '/service-requests/$serviceRequestId/messages/read',
        data: {'withUserId': withUserId},
      );
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<List<ConversationSummaryModel>> getConversations(
    String serviceRequestId,
  ) async {
    try {
      final response = await dio.get(
        '/service-requests/$serviceRequestId/conversations',
      );
      final data = response.data;
      if (data is! List) {
        throw ApiException(
          statusCode: response.statusCode,
          message: 'Formato de respuesta inválido',
          code: 'INVALID_RESPONSE',
        );
      }
      return data
          .whereType<Map<String, dynamic>>()
          .map(ConversationSummaryModel.fromJson)
          .toList();
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  T _parseObject<T>(
    Response<dynamic> response,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw ApiException(
        statusCode: response.statusCode,
        message: 'Formato de respuesta inválido',
        code: 'INVALID_RESPONSE',
      );
    }
    return fromJson(data);
  }

  ApiException _mapDioException(DioException error) {
    final response = error.response;
    final data = response?.data;
    if (data is Map<String, dynamic>) {
      return ApiException(
        statusCode: response?.statusCode,
        message: (data['message'] ?? 'Error de servidor').toString(),
        code: data['code']?.toString(),
      );
    }
    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return ApiException(
        statusCode: response?.statusCode,
        message: 'No se pudo conectar con el servidor',
        code: 'NETWORK_ERROR',
      );
    }
    return ApiException(
      statusCode: response?.statusCode,
      message: error.message ?? 'Error de red',
      code: 'NETWORK_ERROR',
    );
  }
}
