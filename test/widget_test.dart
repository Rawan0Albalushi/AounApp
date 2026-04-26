import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:aoun_app/domain/entities/auth_session.dart';
import 'package:aoun_app/domain/repositories/auth_repository.dart';
import 'package:aoun_app/l10n/app_localizations.dart';
import 'package:aoun_app/providers/app_settings_provider.dart';
import 'package:aoun_app/providers/auth_provider.dart';
import 'package:aoun_app/providers/onboarding_provider.dart';

class _FakeAuthRepository implements AuthRepository {
  @override
  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    return const AuthSession(accessToken: 'test-token');
  }

  @override
  Future<void> logout() async {}
}

void main() {
  testWidgets('Providers and localization smoke test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppSettingsProvider()),
          ChangeNotifierProvider(create: (_) => OnboardingProvider()),
          ChangeNotifierProvider(
            create: (_) => AuthProvider(authRepository: _FakeAuthRepository()),
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          home: const Scaffold(body: SizedBox.shrink()),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
