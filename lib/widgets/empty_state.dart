import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

/// Friendly empty state with illustration-style icon treatment.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    this.title,
    this.subtitle,
    this.icon = Icons.inbox_outlined,
  });

  final String? title;
  final String? subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      scheme.primary.withValues(alpha: 0.2),
                      scheme.primary.withValues(alpha: 0.05),
                    ],
                  ),
                ),
                child: Icon(icon, size: 56, color: scheme.primary),
              ),
              const SizedBox(height: 24),
              Text(
                title ?? l10n.emptyNoItems,
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle ?? l10n.emptyNoItemsHint,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: scheme.onSurface.withValues(alpha: 0.65),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
