import 'package:dio/dio.dart';

import '../../domain/entities/auth_session.dart';
import '../config/env/app_env.dart';
import '../security/token_storage.dart';

class TokenRefresher {
  TokenRefresher({required TokenStorage tokenStorage})
    : _tokenStorage = tokenStorage,
      _refreshDio = Dio(
        BaseOptions(
          baseUrl: AppEnv.apiBaseUrl,
          connectTimeout: Duration(milliseconds: AppEnv.timeoutMs),
          receiveTimeout: Duration(milliseconds: AppEnv.timeoutMs),
          sendTimeout: Duration(milliseconds: AppEnv.timeoutMs),
          headers: {'Accept': 'application/json'},
        ),
      );

  final TokenStorage _tokenStorage;
  final Dio _refreshDio;

  Future<String?> refreshAccessToken() async {
    if (AppEnv.isDemoMode) return null;
    final current = await _tokenStorage.readSession();
    final refreshToken = current?.refreshToken;
    if (refreshToken == null || refreshToken.isEmpty) return null;
    final response = await _refreshDio.post<Map<String, dynamic>>(
      '/auth/refresh',
      data: {'refresh_token': refreshToken},
      options: Options(
        headers: {'Authorization': current?.authorizationHeader},
      ),
    );
    final payload = response.data ?? <String, dynamic>{};
    final body = payload['data'] is Map<String, dynamic>
        ? payload['data'] as Map<String, dynamic>
        : payload;
    final session = _sessionFromJson(body, refreshToken: refreshToken);
    await _tokenStorage.saveSession(session);
    return session.accessToken;
  }

  AuthSession _sessionFromJson(
    Map<String, dynamic> json, {
    required String refreshToken,
  }) {
    final accessToken = (json['access_token'] ?? json['token'] ?? '')
        .toString()
        .trim();
    if (accessToken.isEmpty) {
      throw const _RefreshParsingException();
    }
    final tokenType = (json['token_type'] ?? 'Bearer').toString();
    final expiresIn = int.tryParse((json['expires_in'] ?? '').toString());
    return AuthSession(
      accessToken: accessToken,
      refreshToken: json['refresh_token']?.toString() ?? refreshToken,
      tokenType: tokenType,
      expiresAt: expiresIn == null
          ? null
          : DateTime.now().add(Duration(seconds: expiresIn)),
    );
  }
}

class _RefreshParsingException implements Exception {
  const _RefreshParsingException();
}
