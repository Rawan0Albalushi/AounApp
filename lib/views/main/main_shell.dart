import 'package:flutter/material.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../dashboard/dashboard_view.dart';
import '../profile/profile_view.dart';
import '../settings/settings_view.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    void goHome() => setState(() => _index = 0);

    final pages = [
      DashboardView(onOpenTab: (i) => setState(() => _index = i)),
      ProfileView(onBackFallback: goHome),
      SettingsView(onBackFallback: goHome),
    ];

    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          IndexedStack(
            index: _index,
            children: pages,
          ),
          Positioned(
            left: 18,
            right: 18,
            bottom: bottomInset + 10,
            child: Material(
              color: Colors.transparent,
              elevation: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.royalGold,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Row(
                  children: [
                    Expanded(
                      child: _BottomNavItem(
                        label: l10n.navHome,
                        icon: Icons.home_rounded,
                        selected: _index == 0,
                        onTap: () => setState(() => _index = 0),
                      ),
                    ),
                    Expanded(
                      child: _BottomNavItem(
                        label: l10n.navProfile,
                        icon: Icons.person_rounded,
                        selected: _index == 1,
                        onTap: () => setState(() => _index = 1),
                      ),
                    ),
                    Expanded(
                      child: _BottomNavItem(
                        label: l10n.navSettings,
                        icon: Icons.settings_rounded,
                        selected: _index == 2,
                        onTap: () => setState(() => _index = 2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final activeColor = AppColors.navy;
    final inactiveColor = Colors.white.withValues(alpha: 0.82);
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: selected ? activeColor : inactiveColor,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: selected ? activeColor : inactiveColor,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Pushes named routes from child widgets (dashboard services).
void openAppRoute(BuildContext context, String route) {
  Navigator.of(context).pushNamed(route);
}

/// Maps quick navigation from dashboard profile shortcut.
class MainShellRoutes {
  static const String name = AppRoutes.main;
}
