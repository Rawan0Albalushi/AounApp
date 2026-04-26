import '../../domain/entities/auth_session.dart';
import '../security/token_storage.dart';
import 'session_store.dart';

/// Single source of truth for authentication session state.
class SessionManager implements SessionStore {
  SessionManager({required TokenStorage tokenStorage})
    : _tokenStorage = tokenStorage;

  final TokenStorage _tokenStorage;

  @override
  Future<bool> isAuthenticated() async {
    final session = await _tokenStorage.readSession();
    return session != null && session.accessToken.isNotEmpty;
  }

  @override
  Future<void> saveSession(AuthSession session) async {
    if (session.accessToken.isEmpty) return;
  }

  @override
  Future<void> clear() async {
    await _tokenStorage.clear();
  }
}
