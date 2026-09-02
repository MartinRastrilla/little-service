import 'package:dio/dio.dart';
import 'package:mobile/core/error/exceptions.dart';
import 'package:mobile/features/service_requests/data/models/service_request_contract_model.dart';
import 'package:mobile/features/service_requests/domain/entities/service_request_contract.dart';

class ContractsRemoteDataSource {
  final Dio dio;

  const ContractsRemoteDataSource({required this.dio});

  Future<ServiceRequestContractModel> getContract(String serviceRequestId) async {
    try {
      final response = await dio.get('/service-requests/$serviceRequestId/contract');
      return _parseContract(response);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ServiceRequestContractModel> createContract(
    UpsertContractParams params,
  ) async {
    try {
      final response = await dio.post(
        '/service-requests/${params.serviceRequestId}/contract',
        data: _contractBody(params),
      );
      return _parseContract(response);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ServiceRequestContractModel> updateContract(
    UpsertContractParams params,
  ) async {
    try {
      final response = await dio.put(
        '/service-requests/${params.serviceRequestId}/contract',
        data: _contractBody(params),
      );
      return _parseContract(response);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<ServiceRequestContractModel> signContract(String serviceRequestId) async {
    try {
      final response = await dio.post(
        '/service-requests/$serviceRequestId/contract/sign',
      );
      return _parseContract(response);
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Future<void> cancelContract(String serviceRequestId) async {
    try {
      await dio.delete('/service-requests/$serviceRequestId/contract');
    } on DioException catch (error) {
      throw _mapDioException(error);
    }
  }

  Map<String, dynamic> _contractBody(UpsertContractParams params) {
    return {
      'terms': params.terms,
      'startDate': params.startDate.toUtc().toIso8601String(),
      'endDate': params.endDate.toUtc().toIso8601String(),
      'amount': params.amount,
    };
  }

  ServiceRequestContractModel _parseContract(Response<dynamic> response) {
    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw ApiException(
        statusCode: response.statusCode,
        message: 'Formato de respuesta inválido',
        code: 'INVALID_RESPONSE',
      );
    }
    return ServiceRequestContractModel.fromJson(data);
  }

  ApiException _mapDioException(DioException error) {
    final statusCode = error.response?.statusCode;
    final data = error.response?.data;

    if (data is Map<String, dynamic>) {
      return ApiException(
        statusCode: statusCode,
        message: (data['message'] ?? 'Error de servidor').toString(),
        code: data['code']?.toString(),
      );
    }

    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return ApiException(
        statusCode: statusCode,
        message: 'No se pudo conectar con el servidor',
        code: 'NETWORK_ERROR',
      );
    }

    return ApiException(
      statusCode: statusCode,
      message: error.message ?? 'Error de red',
      code: 'NETWORK_ERROR',
    );
  }
}
