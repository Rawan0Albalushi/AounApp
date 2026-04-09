import 'package:flutter/material.dart';

import '../data/demo_data.dart';
import '../l10n/app_localizations.dart';

void showDemoNotificationsSheet(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  final scheme = Theme.of(context).colorScheme;

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (ctx) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.55,
        minChildSize: 0.35,
        maxChildSize: 0.92,
        builder: (context, scrollController) {
          final isAr = Localizations.localeOf(context).languageCode == 'ar';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                child: Text(
                  l10n.notifications,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  itemCount: DemoData.notifications.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final n = DemoData.notifications[i];
                    final title = n.localizedTitle(isAr);
                    final body = n.localizedBody(isAr);
                    final timeLabel = n.localizedTimeLabel(isAr);
                    return Material(
                      color: scheme.surface,
                      borderRadius: BorderRadius.circular(14),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: n.isUnread
                              ? scheme.primary.withValues(alpha: 0.2)
                              : scheme.surfaceContainerHighest,
                          child: Icon(
                            n.isUnread
                                ? Icons.mark_email_unread_outlined
                                : Icons.mark_email_read_outlined,
                            size: 20,
                            color: scheme.primary,
                          ),
                        ),
                        title: Text(
                          title,
                          style: TextStyle(
                            fontWeight: n.isUnread
                                ? FontWeight.w700
                                : FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(body),
                        trailing: Text(
                          timeLabel,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        isThreeLine: true,
                      ),
                    );
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
