import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/app_settings_provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_hero_header.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, this.onBackFallback});

  /// e.g. switch main shell to home tab when this page is not on the route stack.
  final VoidCallback? onBackFallback;

  void _showLanguageSheet(BuildContext context, AppSettingsProvider settings) {
    final l10n = AppLocalizations.of(context);
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                child: Text(
                  l10n.selectLanguage,
                  style: Theme.of(ctx).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                leading: Icon(
                  settings.locale.languageCode == 'ar'
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: AppColors.navy,
                ),
                title: Text(l10n.languageArabic),
                onTap: () {
                  settings.setLocale(const Locale('ar'));
                  Navigator.pop(ctx);
                },
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                leading: Icon(
                  settings.locale.languageCode == 'en'
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: AppColors.navy,
                ),
                title: Text(l10n.languageEnglish),
                onTap: () {
                  settings.setLocale(const Locale('en'));
                  Navigator.pop(ctx);
                },
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.signOut),
        content: Text(l10n.signOutConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(ctx).colorScheme.error,
            ),
            child: Text(l10n.signOut),
          ),
        ],
      ),
    );
    if (ok != true || !context.mounted) return;
    await context.read<AuthProvider>().logout();
    if (!context.mounted) return;
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.login,
      (r) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final settings = context.watch<AppSettingsProvider>();
    final scheme = Theme.of(context).colorScheme;
    final maxW = contentMaxWidth(context);
    final langLabel = settings.locale.languageCode == 'ar'
        ? l10n.languageArabic
        : l10n.languageEnglish;

    final pageInsets = pagePadding(context);
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      body: AppShellBackdrop(
        child: SafeArea(
          top: false,
          child: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: pageInsets.bottom + mainShellFloatingNavBottomPadding,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxW),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CorporateHeroHeader(
                      title: l10n.settingsTitle,
                      subtitle: l10n.appTitle,
                      onBackFallback: onBackFallback,
                    ),
                    CorporateHeroOverlap(
                      padding: EdgeInsets.fromLTRB(
                        pageInsets.left,
                        0,
                        pageInsets.right,
                        0,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: kCorporateHeroBodyTopSpacing,
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  _SettingsTile(
                                    icon: Icons.groups_outlined,
                                    iconBg: AppColors.royalGold
                                        .withValues(alpha: 0.2),
                                    title: l10n.settingsAboutUs,
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(AppRoutes.aboutUs),
                                  ),
                                  Divider(
                                    height: 1,
                                    indent: 68,
                                    color: scheme.outlineVariant
                                        .withValues(alpha: 0.5),
                                  ),
                                  _SettingsTile(
                                    icon: Icons.language_rounded,
                                    iconBg: AppColors.royalGold
                                        .withValues(alpha: 0.2),
                                    title: l10n.language,
                                    subtitle: langLabel,
                                    onTap: () => _showLanguageSheet(
                                        context, settings),
                                  ),
                                  Divider(
                                    height: 1,
                                    indent: 68,
                                    color: scheme.outlineVariant
                                        .withValues(alpha: 0.5),
                                  ),
                                  _SettingsTile(
                                    icon: Icons.gavel_outlined,
                                    iconBg: AppColors.royalGold
                                        .withValues(alpha: 0.2),
                                    title: l10n.settingsTermsOfService,
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(AppRoutes.termsOfService),
                                  ),
                                  Divider(
                                    height: 1,
                                    indent: 68,
                                    color: scheme.outlineVariant
                                        .withValues(alpha: 0.5),
                                  ),
                                  _SettingsTile(
                                    icon: Icons.lock_reset_rounded,
                                    iconBg: AppColors.royalGold
                                        .withValues(alpha: 0.2),
                                    title: l10n.settingsChangePassword,
                                    onTap: () => Navigator.of(context)
                                        .pushNamed(AppRoutes.changePassword),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            FilledButton.tonal(
                              style: FilledButton.styleFrom(
                                foregroundColor: scheme.error,
                                backgroundColor:
                                    scheme.error.withValues(alpha: 0.12),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () => _confirmSignOut(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.logout_rounded,
                                      color: scheme.error),
                                  const SizedBox(width: 10),
                                  Text(
                                    l10n.signOut,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: scheme.error,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
          ),
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.iconBg,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color iconBg;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.goldDark, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color:
                                  scheme.onSurface.withValues(alpha: 0.55),
                            ),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                Directionality.of(context) == TextDirection.rtl
                    ? Icons.chevron_left
                    : Icons.chevron_right,
                color: scheme.onSurface.withValues(alpha: 0.35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
