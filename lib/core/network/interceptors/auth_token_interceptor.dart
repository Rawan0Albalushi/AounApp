import 'package:dio/dio.dart';

import '../../security/token_storage.dart';

class AuthTokenInterceptor extends Interceptor {
  AuthTokenInterceptor(this._tokenStorage);

  final TokenStorage _tokenStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final session = await _tokenStorage.readSession();
    if (session != null) {
      options.headers['Authorization'] = session.authorizationHeader;
    }
    handler.next(options);
  }
}
