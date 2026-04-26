import 'dart:async';

import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    required Dio dio,
    this.maxRetries = 2,
    this.retryableStatusCodes = const {408, 429, 500, 502, 503, 504},
  }) : _dio = dio;

  final Dio _dio;
  final int maxRetries;
  final Set<int> retryableStatusCodes;

  static const _kRetryCount = 'retry_count';

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!_shouldRetry(err)) {
      handler.next(err);
      return;
    }

    final options = err.requestOptions;
    final current = (options.extra[_kRetryCount] as int?) ?? 0;
    if (current >= maxRetries) {
      handler.next(err);
      return;
    }

    options.extra[_kRetryCount] = current + 1;
    final delayMs = 300 * (current + 1);
    await Future<void>.delayed(Duration(milliseconds: delayMs));

    try {
      final response = await _dio.fetch<dynamic>(options);
      handler.resolve(response);
    } on DioException catch (e) {
      handler.next(e);
    }
  }

  bool _shouldRetry(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError) {
      return true;
    }
    return retryableStatusCodes.contains(error.response?.statusCode);
  }
}
