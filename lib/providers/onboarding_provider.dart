import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kOnboardingDone = 'onboarding_completed';

class OnboardingProvider extends ChangeNotifier {
  OnboardingProvider() {
    _load();
  }

  bool _completed = false;
  bool _loaded = false;

  bool get completed => _completed;
  bool get isReady => _loaded;

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    _completed = prefs.getBool(_kOnboardingDone) ?? false;
    _loaded = true;
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    _completed = true;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kOnboardingDone, true);
  }
}
