import 'package:flutter_test/flutter_test.dart';

import 'package:aoun_app/core/auth/session_store.dart';
import 'package:aoun_app/domain/entities/auth_session.dart';
import 'package:aoun_app/domain/repositories/auth_repository.dart';
import 'package:aoun_app/features/auth/presentation/providers/auth_provider.dart';

class _FakeAuthRepository implements AuthRepository {
  bool loggedIn = false;
  bool passwordChanged = false;

  @override
  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    loggedIn = true;
    return AuthSession(accessToken: 'token-$email');
  }

  @override
  Future<void> logout() async {
    loggedIn = false;
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    if (currentPassword == 'wrong') {
      throw Exception('invalid current password');
    }
    passwordChanged = true;
  }

  @override
  Future<AuthSession> refreshSession() async {
    return const AuthSession(accessToken: 'refreshed-token');
  }
}

class _InMemorySessionStore implements SessionStore {
  bool _authenticated = false;

  @override
  Future<void> clear() async {
    _authenticated = false;
  }

  @override
  Future<bool> isAuthenticated() async => _authenticated;

  @override
  Future<void> saveSession(AuthSession session) async {
    _authenticated = session.accessToken.isNotEmpty;
  }
}

void main() {
  test('AuthProvider login and logout toggles authentication state', () async {
    final repo = _FakeAuthRepository();
    final sessionStore = _InMemorySessionStore();
    final provider = AuthProvider(
      authRepository: repo,
      sessionManager: sessionStore,
    );

    await Future<void>.delayed(Duration.zero);
    expect(provider.isReady, isTrue);
    expect(provider.isAuthenticated, isFalse);

    await provider.login('demo@aoun.app', 'password12');
    expect(provider.isAuthenticated, isTrue);
    expect(repo.loggedIn, isTrue);

    await provider.logout();
    expect(provider.isAuthenticated, isFalse);
    expect(repo.loggedIn, isFalse);
  });

  test('AuthProvider changePassword updates error state on failure', () async {
    final repo = _FakeAuthRepository();
    final sessionStore = _InMemorySessionStore();
    final provider = AuthProvider(
      authRepository: repo,
      sessionManager: sessionStore,
    );
    await Future<void>.delayed(Duration.zero);

    await expectLater(
      () => provider.changePassword(
        currentPassword: 'wrong',
        newPassword: 'newPassword12',
      ),
      throwsException,
    );
    expect(provider.errorMessage, isNotNull);

    provider.clearError();
    expect(provider.errorMessage, isNull);
  });
}
