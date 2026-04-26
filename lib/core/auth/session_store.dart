import '../../domain/entities/auth_session.dart';

abstract class SessionStore {
  Future<bool> isAuthenticated();
  Future<void> saveSession(AuthSession session);
  Future<void> clear();
}
