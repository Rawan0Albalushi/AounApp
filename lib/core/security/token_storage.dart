import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/entities/auth_session.dart';

class TokenStorage {
  TokenStorage({FlutterSecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  static const _kAccessToken = 'auth_access_token';
  static const _kRefreshToken = 'auth_refresh_token';
  static const _kTokenType = 'auth_token_type';

  final FlutterSecureStorage _secureStorage;

  Future<void> saveSession(AuthSession session) async {
    await _secureStorage.write(key: _kAccessToken, value: session.accessToken);
    await _secureStorage.write(key: _kTokenType, value: session.tokenType);
    if (session.refreshToken != null && session.refreshToken!.isNotEmpty) {
      await _secureStorage.write(
        key: _kRefreshToken,
        value: session.refreshToken,
      );
    }
  }

  Future<AuthSession?> readSession() async {
    final accessToken = await _secureStorage.read(key: _kAccessToken);
    if (accessToken == null || accessToken.isEmpty) return null;
    final refreshToken = await _secureStorage.read(key: _kRefreshToken);
    final tokenType = await _secureStorage.read(key: _kTokenType) ?? 'Bearer';
    return AuthSession(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
    );
  }

  Future<void> clear() async {
    await _secureStorage.delete(key: _kAccessToken);
    await _secureStorage.delete(key: _kRefreshToken);
    await _secureStorage.delete(key: _kTokenType);
  }
}
