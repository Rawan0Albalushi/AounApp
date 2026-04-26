import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/feedback/app_snackbar.dart';
import 'core/router/app_router.dart';
import 'core/router/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'l10n/app_localizations.dart';
import 'providers/app_settings_provider.dart';

class AounApp extends StatelessWidget {
  const AounApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettingsProvider>(
      builder: (context, settings, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Aoun',
          scaffoldMessengerKey: rootScaffoldMessengerKey,
          locale: settings.locale,
          theme: buildAppTheme(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          initialRoute: AppRoutes.splash,
          routes: AppRouter.routes,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
