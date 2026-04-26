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

  /// Handles Laravel Sanctum/JWT-ish payloads.
  AuthSession _sessionFromJson(Map<String, dynamic> json) {
    final accessToken =
        (json['access_token'] ?? json['token'] ?? json['plainTextToken'] ?? '')
            .toString();
    final refreshToken = json['refresh_token']?.toString();
    final tokenType = (json['token_type'] ?? 'Bearer').toString();
    if (accessToken.isEmpty) {
      throw const AuthApiSessionParsingException();
    }
    return AuthSession(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
    );
  }
}

class AuthApiSessionParsingException implements Exception {
  const AuthApiSessionParsingException();

  @override
  String toString() => 'Auth response has no access token.';
}
