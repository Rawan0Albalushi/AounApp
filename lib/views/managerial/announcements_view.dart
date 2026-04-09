import 'package:flutter/material.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import '../../models/announcement_item.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_hero_header.dart';

class AnnouncementsView extends StatelessWidget {
  const AnnouncementsView({super.key});

  void _openDetail(BuildContext context, AnnouncementItem item) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final body = isAr ? item.bodyAr : item.bodyEn;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.65,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          builder: (context, scrollController) {
            return ListView(
              controller: scrollController,
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              children: [
                Text(
                  item.localizedTitle(isAr),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${item.localizedAuthor(isAr)} · ${item.publishedAt}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.65),
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  item.localizedSubtitle(isAr),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 16),
                Text(
                  body,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.5,
                      ),
                ),
                const SizedBox(height: 24),
                Text(
                  isAr ? item.bodyEn : item.bodyAr,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        height: 1.45,
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.75),
                      ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final items = DemoData.announcements;

    final pageInsets = pagePadding(context);
    final maxW = contentMaxWidth(context);
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context)
            .pushNamed(AppRoutes.managerialAnnouncementCreate),
        icon: const Icon(Icons.campaign_outlined),
        label: Text(l10n.createAnnouncement),
      ),
      body: AppShellBackdrop(
        child: SafeArea(
          top: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CorporateHeroHeader(
                    title: l10n.announcementsTitle,
                    subtitle: l10n.announcementsSubtitle,
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline),
                        color: Colors.white,
                        onPressed: () => Navigator.of(context)
                            .pushNamed(AppRoutes.managerialAnnouncementCreate),
                      ),
                    ],
                  ),
                  Expanded(
                    child: CorporateHeroOverlap(
                      padding: EdgeInsets.fromLTRB(
                        pageInsets.left,
                        0,
                        pageInsets.right,
                        0,
                      ),
                      child: ListView.separated(
                        padding: EdgeInsets.only(
                          bottom: pageInsets.bottom + 88,
                        ),
                        itemCount: items.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, i) {
                final e = items[i];
                return ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxW),
                  child: Card(
                    child: ListTile(
                      title: Text(e.localizedTitle(isAr)),
                      subtitle: Text(
                        '${e.localizedSubtitle(isAr)}\n${e.publishedAt}',
                      ),
                      isThreeLine: true,
                      trailing: Icon(
                        Directionality.of(context) == TextDirection.rtl
                            ? Icons.chevron_left
                            : Icons.chevron_right,
                      ),
                      onTap: () => _openDetail(context, e),
                    ),
                  ),
                );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
