import 'package:dio/dio.dart';

import '../../auth/token_refresher.dart';
import '../../security/token_storage.dart';

class AuthRefreshInterceptor extends Interceptor {
  AuthRefreshInterceptor({
    required Dio dio,
    required TokenRefresher tokenRefresher,
    required TokenStorage tokenStorage,
  }) : _dio = dio,
       _tokenRefresher = tokenRefresher,
       _tokenStorage = tokenStorage;

  final Dio _dio;
  final TokenRefresher _tokenRefresher;
  final TokenStorage _tokenStorage;

  static const _kRetriedWithRefresh = 'retried_with_refresh';

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    final options = err.requestOptions;
    final wasRetried = options.extra[_kRetriedWithRefresh] == true;
    final isRefreshRequest = options.path.contains('/auth/refresh');
    if (statusCode != 401 || wasRetried || isRefreshRequest) {
      handler.next(err);
      return;
    }

    try {
      final newAccessToken = await _tokenRefresher.refreshAccessToken();
      if (newAccessToken == null || newAccessToken.isEmpty) {
        handler.next(err);
        return;
      }

      options.extra[_kRetriedWithRefresh] = true;
      final session = await _tokenStorage.readSession();
      options.headers['Authorization'] = session?.authorizationHeader;
      final response = await _dio.fetch<dynamic>(options);
      handler.resolve(response);
    } catch (_) {
      await _tokenStorage.clear();
      handler.next(err);
    }
  }
}
