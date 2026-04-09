import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kAuth = 'user_authenticated';

/// Mock authentication — replace with real API integration.
class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    _load();
  }

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
    // Demo: any non-empty credentials succeed
    if (email.isEmpty || password.isEmpty) return;
    _authenticated = true;
    _pendingEmail = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kAuth, true);
  }

  Future<void> logout() async {
    _authenticated = false;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kAuth, false);
  }

  /// Simulated OTP verification for demo flow.
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

  /// Logged-in password change (demo — replace with API call).
  Future<void> changePassword() async {
    notifyListeners();
  }
}
