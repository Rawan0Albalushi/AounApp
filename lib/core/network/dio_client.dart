import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../config/env/app_env.dart';
import '../security/token_storage.dart';
import 'interceptors/api_error_interceptor.dart';
import 'interceptors/auth_token_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

class DioClient {
  DioClient({required TokenStorage tokenStorage})
    : dio = Dio(
        BaseOptions(
          baseUrl: AppEnv.apiBaseUrl,
          connectTimeout: Duration(milliseconds: AppEnv.timeoutMs),
          receiveTimeout: Duration(milliseconds: AppEnv.timeoutMs),
          sendTimeout: Duration(milliseconds: AppEnv.timeoutMs),
          headers: {'Accept': 'application/json'},
        ),
      ) {
    dio.interceptors.add(RetryInterceptor(dio: dio));
    dio.interceptors.add(AuthTokenInterceptor(tokenStorage));
    dio.interceptors.add(ApiErrorInterceptor());
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: false,
          requestHeader: false,
        ),
      );
    }
  }

  final Dio dio;
}
