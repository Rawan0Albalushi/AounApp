import '../../domain/entities/auth_session.dart';
import 'base_api_service.dart';

class AuthApiService extends BaseApiService {
  const AuthApiService(super.dio);

  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    final payload = response.data ?? <String, dynamic>{};
    final body = payload['data'] is Map<String, dynamic>
        ? payload['data'] as Map<String, dynamic>
        : payload;
    final session = _sessionFromJson(body);
    toApiResponse<AuthSession>(
      response: response,
      data: session,
      message: payload['message']?.toString(),
    );
    return session;
  }

  Future<void> logout() async {
    await dio.post<void>('/auth/logout');
  }

  Future<AuthSession> refreshToken({required String refreshToken}) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/auth/refresh',
      data: {'refresh_token': refreshToken},
    );
    final payload = response.data ?? <String, dynamic>{};
    final body = payload['data'] is Map<String, dynamic>
        ? payload['data'] as Map<String, dynamic>
        : payload;
    final session = _sessionFromJson(body);
    toApiResponse<AuthSession>(
      response: response,
      data: session,
      message: payload['message']?.toString(),
    );
    return session;
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await dio.post<void>(
      '/auth/change-password',
      data: {
        'current_password': currentPassword,
        'password': newPassword,
        'password_confirmation': newPassword,
      },
    );
  }

  /// Handles Laravel Sanctum/JWT-ish payloads.
  AuthSession _sessionFromJson(Map<String, dynamic> json) {
    final accessToken =
        (json['access_token'] ?? json['token'] ?? json['plainTextToken'] ?? '')
            .toString();
    final refreshToken = json['refresh_token']?.toString();
    final tokenType = (json['token_type'] ?? 'Bearer').toString();
    final expiresIn = int.tryParse((json['expires_in'] ?? '').toString());
    if (accessToken.isEmpty) {
      throw const AuthApiSessionParsingException();
    }
    return AuthSession(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      expiresAt: expiresIn == null
          ? null
          : DateTime.now().add(Duration(seconds: expiresIn)),
    );
  }
}

class AuthApiSessionParsingException implements Exception {
  const AuthApiSessionParsingException();

  @override
  String toString() => 'Auth response has no access token.';
}
