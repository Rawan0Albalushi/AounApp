import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'core/di/app_services.dart';
import 'core/error/global_error_handler.dart';
import 'features/tasks/presentation/providers/task_provider.dart';
import 'providers/app_settings_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/onboarding_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    try {
      // Keep app bootable by loading shipped defaults.
      await dotenv.load(fileName: '.env.example');
    } catch (_) {
      // AppEnv handles missing initialization by using hardcoded defaults.
    }
  }
  GlobalErrorHandler.initialize();

  final services = AppServices.create();

  runZonedGuarded(() {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppSettingsProvider()),
          ChangeNotifierProvider(create: (_) => OnboardingProvider()),
          ChangeNotifierProvider(
            create: (_) => AuthProvider(
              authRepository: services.authRepository,
              sessionManager: services.sessionManager,
            ),
          ),
          ChangeNotifierProvider(
            create: (_) =>
                TaskProvider(taskRepository: services.taskRepository),
          ),
        ],
        child: const AounApp(),
      ),
    );
  }, GlobalErrorHandler.handleZoneError);
}
