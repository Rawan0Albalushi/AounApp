import 'package:dio/dio.dart';

import '../../core/network/models/api_response.dart';

abstract class BaseApiService {
  const BaseApiService(this.dio);

  final Dio dio;

  ApiResponse<T> toApiResponse<T>({
    required Response<dynamic> response,
    required T data,
    String? message,
  }) {
    final payload = response.data;
    Map<String, dynamic>? meta;
    if (payload is Map<String, dynamic> &&
        payload['meta'] is Map<String, dynamic>) {
      meta = payload['meta'] as Map<String, dynamic>;
    }
    return ApiResponse<T>(
      data: data,
      message: message,
      statusCode: response.statusCode,
      meta: meta,
    );
  }
}
