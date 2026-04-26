import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnv {
  AppEnv._();

  static Map<String, String> get _env {
    try {
      return dotenv.env;
    } catch (_) {
      return const <String, String>{};
    }
  }

  static String get apiBaseUrl =>
      _env['API_BASE_URL']?.trim().isNotEmpty == true
      ? _env['API_BASE_URL']!.trim()
      : 'https://api.example.com';

  static int get timeoutMs {
    final raw = _env['API_TIMEOUT_MS'];
    final parsed = int.tryParse(raw ?? '');
    return parsed != null && parsed > 0 ? parsed : 30000;
  }

  /// demo = local mock behavior; api = backend-driven behavior.
  static String get authMode =>
      _env['AUTH_MODE']?.trim().toLowerCase() ?? 'demo';
}
