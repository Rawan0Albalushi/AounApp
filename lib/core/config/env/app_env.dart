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
  static String get authMode {
    final mode = _env['AUTH_MODE']?.trim().toLowerCase() ?? 'demo';
    if (mode == 'api' || mode == 'demo') return mode;
    return 'demo';
  }

  static bool get isDemoMode => authMode == 'demo';

  static bool get isApiMode => authMode == 'api';

  static bool get enableNetworkLogs {
    final raw = _env['ENABLE_NETWORK_LOGS']?.trim().toLowerCase();
    return raw == '1' || raw == 'true';
  }

  static bool get enforceHttpsOnly {
    final raw = _env['ENFORCE_HTTPS_ONLY']?.trim().toLowerCase();
    if (raw == null || raw.isEmpty) return true;
    return raw == '1' || raw == 'true';
  }
}
