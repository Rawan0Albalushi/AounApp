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
        : AuthSession(accessToken: 'demo-token-$email');
    await _tokenStorage.saveSession(session);
    return session;
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
