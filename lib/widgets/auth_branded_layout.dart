import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import 'corporate_app_bar.dart';

/// Soft shadow for hero header (aligned with home).
List<BoxShadow> authCardShadows(BuildContext context) {
  return [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 20,
      offset: const Offset(0, 8),
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.03),
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
  ];
}

const double kAuthFormMaxWidth = 440;

/// Navy gradient hero — content centered (same structure as login).
class AuthHeroHeader extends StatelessWidget {
  const AuthHeroHeader({
    super.key,
    required this.brandLabel,
    required this.headline,
    required this.subtitle,
    this.showBackButton = false,
    this.onBack,
  });

  final String brandLabel;
  final String headline;
  final String subtitle;

  /// When true, shows a leading back control (recovery flow).
  final bool showBackButton;
  final VoidCallback? onBack;

  static const double _bottomRadius = kCorporateAppBarBottomRadius;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;
    final theme = Theme.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    final panel = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(_bottomRadius),
          bottomRight: Radius.circular(_bottomRadius),
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.navy,
            AppColors.navyGradientEnd,
            Color(0xFF455A94),
          ],
          stops: [0, 0.6, 1],
        ),
        boxShadow: authCardShadows(context),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(24, topInset + 28, 24, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.royalGold, width: 2),
              ),
              child: const CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xFFE7ECF4),
                child: Icon(
                  Icons.shield_rounded,
                  color: AppColors.navy,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              brandLabel,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              headline,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.white.withValues(alpha: 0.92),
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );

    if (!showBackButton) return panel;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        panel,
        Positioned(
          top: topInset + 4,
          left: isRtl ? null : 2,
          right: isRtl ? 2 : null,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            onPressed: onBack ?? () => Navigator.of(context).maybePop(),
          ),
        ),
      ],
    );
  }
}

/// Section title on auth pages (no card).
TextStyle? authSectionTitleStyle(BuildContext context) {
  return Theme.of(context).textTheme.titleLarge?.copyWith(
    color: AppColors.navy,
    fontWeight: FontWeight.w700,
  );
}

/// Muted subtitle under section title.
TextStyle authSectionMutedStyle(BuildContext context, ColorScheme scheme) {
  return TextStyle(
    color: scheme.onSurface.withValues(alpha: 0.65),
    height: 1.45,
  );
}

/// Demo / hint line — centered, soft gold.
Widget authDemoHintBanner({
  required BuildContext context,
  required String text,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: AppColors.goldDark,
        fontWeight: FontWeight.w600,
        height: 1.35,
      ),
    ),
  );
}
