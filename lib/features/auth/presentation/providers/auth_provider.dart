import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/repositories/auth_repository.dart';

const _kAuth = 'user_authenticated';

class AuthProvider extends ChangeNotifier {
  AuthProvider({required AuthRepository authRepository})
    : _authRepository = authRepository {
    _load();
  }

  final AuthRepository _authRepository;

  bool _authenticated = false;
  String? _pendingEmail;
  bool _loaded = false;

  bool get isAuthenticated => _authenticated;
  bool get isReady => _loaded;
  String? get pendingOtpEmail => _pendingEmail;

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    _authenticated = prefs.getBool(_kAuth) ?? false;
    _loaded = true;
    notifyListeners();
  }

  void setPendingEmail(String email) {
    _pendingEmail = email;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) return;
    await _authRepository.login(email: email, password: password);
    _authenticated = true;
    _pendingEmail = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kAuth, true);
  }

  Future<void> logout() async {
    await _authRepository.logout();
    _authenticated = false;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kAuth, false);
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
