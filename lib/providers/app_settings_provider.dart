import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleCode = 'app_locale_code';

class AppSettingsProvider extends ChangeNotifier {
  AppSettingsProvider() {
    _load();
  }

  Locale _locale = const Locale('ar');

  Locale get locale => _locale;

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_kLocaleCode);
    if (code != null && (code == 'ar' || code == 'en')) {
      _locale = Locale(code);
    }
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLocaleCode, locale.languageCode);
  }

  void toggleLocale() {
    setLocale(
      _locale.languageCode == 'ar' ? const Locale('en') : const Locale('ar'),
    );
  }
}
