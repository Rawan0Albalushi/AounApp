import '../../core/config/env/app_env.dart';
import '../../core/security/token_storage.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../services/auth_api_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthApiService authApiService,
    required TokenStorage tokenStorage,
  }) : _authApiService = authApiService,
       _tokenStorage = tokenStorage;

  final AuthApiService _authApiService;
  final TokenStorage _tokenStorage;

  @override
  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final session = AppEnv.isApiMode
        ? await _authApiService.login(email: email, password: password)
        : AuthSession(
            accessToken: 'demo-token-$email',
            refreshToken: 'demo-refresh-token',
            expiresAt: DateTime.now().add(const Duration(hours: 12)),
          );
    await _tokenStorage.saveSession(session);
    return session;
  }

  @override
  Future<AuthSession> refreshSession() async {
    final current = await _tokenStorage.readSession();
    final refreshToken = current?.refreshToken;
    if (refreshToken == null || refreshToken.isEmpty) {
      throw const AuthSessionParsingException();
    }
    final session = AppEnv.isApiMode
        ? await _authApiService.refreshToken(refreshToken: refreshToken)
        : AuthSession(
            accessToken: 'demo-token-refreshed',
            refreshToken: refreshToken,
            expiresAt: DateTime.now().add(const Duration(hours: 12)),
          );
    await _tokenStorage.saveSession(session);
    return session;
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    if (currentPassword.isEmpty || newPassword.isEmpty) {
      throw const AuthSessionParsingException();
    }
    if (AppEnv.isApiMode) {
      await _authApiService.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      return;
    }
    // Demo mode still validates and can fail to avoid false-success actions.
    if (currentPassword != 'password12') {
      throw const AuthInvalidPasswordException();
    }
  }

  @override
  Future<void> logout() async {
    if (AppEnv.isApiMode) {
      await _authApiService.logout();
    }
    await _tokenStorage.clear();
  }
}

class AuthSessionParsingException implements Exception {
  const AuthSessionParsingException();

  @override
  String toString() => 'Auth session payload is missing token fields.';
}

class AuthInvalidPasswordException implements Exception {
  const AuthInvalidPasswordException();

  @override
  String toString() => 'Current password is invalid.';
}
