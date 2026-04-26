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
  bool _isBusy = false;
  String? _errorMessage;

  bool get isAuthenticated => _authenticated;
  bool get isReady => _loaded;
  String? get pendingOtpEmail => _pendingEmail;
  bool get isBusy => _isBusy;
  String? get errorMessage => _errorMessage;

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
    _setBusy(true);
    try {
      _errorMessage = null;
      final session = await _authRepository.login(
        email: email,
        password: password,
      );
      await _sessionManager.saveSession(session);
      _authenticated = true;
      _pendingEmail = null;
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _setBusy(false);
    }
  }

  Future<void> logout() async {
    _setBusy(true);
    try {
      _errorMessage = null;
      await _authRepository.logout();
      await _sessionManager.clear();
      _authenticated = false;
    } finally {
      _setBusy(false);
    }
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
    _setBusy(true);
    try {
      _errorMessage = null;
      await _authRepository.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
    } catch (e) {
      _errorMessage = e.toString();
      rethrow;
    } finally {
      _setBusy(false);
    }
  }

  void clearError() {
    if (_errorMessage == null) return;
    _errorMessage = null;
    notifyListeners();
  }

  void _setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }
}
