import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/auth_session.dart';
import '../security/token_storage.dart';
import 'session_store.dart';

/// Single source of truth for authentication session state.
class SessionManager implements SessionStore {
  SessionManager({required TokenStorage tokenStorage})
    : _tokenStorage = tokenStorage;

  static const _kAuthenticated = 'session_authenticated';

  final TokenStorage _tokenStorage;

  @override
  Future<bool> isAuthenticated() async {
    final session = await _tokenStorage.readSession();
    if (session != null && session.accessToken.isNotEmpty) {
      await _persistAuthFlag(true);
      return true;
    }

    // Backward-compat for current demo flow.
    final prefs = await SharedPreferences.getInstance();
    final legacy = prefs.getBool('user_authenticated') ?? false;
    if (legacy) {
      await _persistAuthFlag(true);
    }
    return legacy;
  }

  @override
  Future<void> saveSession(AuthSession session) async {
    if (session.accessToken.isEmpty) return;
    await _persistAuthFlag(true);
  }

  @override
  Future<void> clear() async {
    await _tokenStorage.clear();
    await _persistAuthFlag(false);
  }

  Future<void> _persistAuthFlag(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kAuthenticated, value);
    // Preserve legacy key to keep existing demo behavior intact.
    await prefs.setBool('user_authenticated', value);
  }
}
