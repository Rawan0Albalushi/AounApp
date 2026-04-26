import 'package:flutter/foundation.dart';
import '../../../../core/auth/session_store.dart';
import '../../../../domain/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({
    required AuthRepository authRepository,
    required SessionStore sessionManager,
  }) : _authRepository = authRepository,
       _sessionManager = sessionManager {
    _load();
  }

  final AuthRepository _authRepository;
  final SessionStore _sessionManager;

  bool _authenticated = false;
  String? _pendingEmail;
  bool _loaded = false;

  bool get isAuthenticated => _authenticated;
  bool get isReady => _loaded;
  String? get pendingOtpEmail => _pendingEmail;

  Future<void> _load() async {
    _authenticated = await _sessionManager.isAuthenticated();
    _loaded = true;
    notifyListeners();
  }

  void setPendingEmail(String email) {
    _pendingEmail = email;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) return;
    final session = await _authRepository.login(email: email, password: password);
    await _sessionManager.saveSession(session);
    _authenticated = true;
    _pendingEmail = null;
    notifyListeners();
  }

  Future<void> logout() async {
    await _authRepository.logout();
    await _sessionManager.clear();
    _authenticated = false;
    notifyListeners();
  }

  Future<void> verifyOtp(String code) async {
    if (code.length >= 4) {
      _pendingEmail = null;
      notifyListeners();
    }
  }

  Future<void> completePasswordReset() async {
    _pendingEmail = null;
    notifyListeners();
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    if (currentPassword.isEmpty || newPassword.isEmpty) return;
    notifyListeners();
  }
}
