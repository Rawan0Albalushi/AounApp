import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../data/demo_data.dart';
import '../l10n/app_localizations.dart';
import '../models/demo_notification.dart';

List<BoxShadow> _notificationCardShadow() {
  return [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.07),
      blurRadius: 18,
      offset: const Offset(0, 8),
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
  ];
}

({Color bg, Color iconColor, IconData icon}) _kindVisuals(
  DemoNotificationKind kind,
  ColorScheme scheme,
) {
  switch (kind) {
    case DemoNotificationKind.leave:
      return (
        bg: AppColors.statusApprovedBg,
        iconColor: AppColors.statusApprovedFg,
        icon: Icons.event_available_rounded,
      );
    case DemoNotificationKind.finance:
      return (
        bg: const Color(0xFFE3F2FD),
        iconColor: const Color(0xFF1565C0),
        icon: Icons.payments_rounded,
      );
    case DemoNotificationKind.task:
      return (
        bg: AppColors.statusPendingBg,
        iconColor: AppColors.statusPendingFg,
        icon: Icons.assignment_turned_in_rounded,
      );
    case DemoNotificationKind.attendance:
      return (
        bg: scheme.surfaceContainerHighest,
        iconColor: scheme.primary,
        icon: Icons.schedule_rounded,
      );
    case DemoNotificationKind.announcement:
      return (
        bg: const Color(0xFFF3E5F5),
        iconColor: const Color(0xFF6A1B9A),
        icon: Icons.campaign_rounded,
      );
  }
}

void showDemoNotificationsSheet(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  final theme = Theme.of(context);
  final scheme = theme.colorScheme;
  final items = DemoData.notifications;

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: AppColors.surfaceLight,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
    ),
    builder: (ctx) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.58,
        minChildSize: 0.35,
        maxChildSize: 0.92,
        builder: (context, scrollController) {
          final bottomPad = MediaQuery.paddingOf(context).bottom;
          final isAr = Localizations.localeOf(context).languageCode == 'ar';

          if (items.isEmpty) {
            return Padding(
              padding: EdgeInsets.fromLTRB(24, 8, 24, 24 + bottomPad),
              child: Column(
                children: [
                  Icon(
                    Icons.notifications_off_outlined,
                    size: 56,
                    color: scheme.onSurface.withValues(alpha: 0.35),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.notificationsEmpty,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: scheme.onSurface.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 4, 22, 12),
                child: Text(
                  l10n.notifications,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.navy,
                    letterSpacing: isAr ? 0 : -0.3,
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 20 + bottomPad),
                  itemCount: items.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, i) {
                    final n = items[i];
                    return _NotificationCard(notification: n, isAr: isAr);
                  },
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.notification, required this.isAr});

  final DemoNotification notification;
  final bool isAr;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final n = notification;
    final title = n.localizedTitle(isAr);
    final body = n.localizedBody(isAr);
    final timeLabel = n.localizedTimeLabel(isAr);
    final visuals = _kindVisuals(n.kind, scheme);
    final muted = scheme.onSurface.withValues(alpha: n.isUnread ? 0.75 : 0.55);

    return Container(
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: _notificationCardShadow(),
        border: Border.all(
          color: scheme.outlineVariant.withValues(alpha: 0.45),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 14, 16, 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: visuals.bg,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(visuals.icon, size: 24, color: visuals.iconColor),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: n.isUnread
                                ? FontWeight.w800
                                : FontWeight.w600,
                            height: 1.25,
                            color: scheme.onSurface.withValues(
                              alpha: n.isUnread ? 1 : 0.82,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        timeLabel,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: muted,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    body,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: muted,
                      height: 1.4,
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
