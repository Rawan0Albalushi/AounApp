import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../providers/onboarding_provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _goNext());
  }

  Future<void> _goNext() async {
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;

    final onboarding = context.read<OnboardingProvider>();
    final auth = context.read<AuthProvider>();

    while (!onboarding.isReady || !auth.isReady) {
      await Future<void>.delayed(const Duration(milliseconds: 50));
      if (!mounted) return;
    }

    if (!onboarding.completed) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
      return;
    }
    if (!auth.isAuthenticated) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      return;
    }
    Navigator.of(context).pushReplacementNamed(AppRoutes.main);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.navy,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.royalGold, width: 2),
              ),
              child: const Icon(
                Icons.shield_moon_rounded,
                size: 48,
                color: AppColors.royalGold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              l10n.appTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.royalGold,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
