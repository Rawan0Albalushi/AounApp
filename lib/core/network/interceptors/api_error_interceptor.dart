import 'package:dio/dio.dart';

import '../../error/app_exception.dart';

class ApiErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final mapped = _mapException(err);
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        error: mapped,
        type: err.type,
      ),
    );
  }

  AppException _mapException(DioException err) {
    final code = err.response?.statusCode;
    final message = switch (code) {
      400 => 'Bad request',
      401 => 'Unauthorized',
      403 => 'Forbidden',
      404 => 'Resource not found',
      422 => 'Validation failed',
      500 => 'Server error',
      _ => err.message ?? 'Network error',
    };
    return AppException(message, code: code?.toString());
  }
}
