import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: buildCorporateAppBar(context, title: l10n.profileTitle),
      body: AppShellBackdrop(
        child: LayoutBuilder(
        builder: (context, constraints) {
          final maxW = contentMaxWidth(context);
          return Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: pagePadding(context).copyWith(
                bottom: pagePadding(context).bottom +
                    mainShellFloatingNavBottomPadding,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxW),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 36,
                              backgroundColor:
                                  AppColors.royalGold.withValues(alpha: 0.25),
                              child: const Icon(Icons.person_rounded,
                                  size: 36, color: AppColors.charcoal),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.sampleUserName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    l10n.sampleJobTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: scheme.onSurface
                                              .withValues(alpha: 0.65),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _InfoCard(
                      icon: Icons.badge_outlined,
                      label: l10n.employeeNo,
                      value: l10n.sampleEmployeeNo,
                    ),
                    const SizedBox(height: 12),
                    _InfoCard(
                      icon: Icons.apartment_outlined,
                      label: l10n.department,
                      value: l10n.sampleDepartment,
                    ),
                    const SizedBox(height: 12),
                    _InfoCard(
                      icon: Icons.location_on_outlined,
                      label: l10n.branch,
                      value: l10n.sampleBranch,
                    ),
                    const SizedBox(height: 12),
                    _InfoCard(
                      icon: Icons.event_outlined,
                      label: l10n.joiningDate,
                      value: '2021-03-15',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: AppColors.royalGold),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: scheme.onSurface.withValues(alpha: 0.6),
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
