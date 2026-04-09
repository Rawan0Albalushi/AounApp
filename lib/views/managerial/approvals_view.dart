import 'package:flutter/material.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_app_bar.dart';
import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import '../../models/approval_item.dart';

class ApprovalsView extends StatelessWidget {
  const ApprovalsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildCorporateAppBar(
          context,
          title: l10n.managerialTitle,
          actions: [
            IconButton(
              tooltip: l10n.announcementsTitle,
              icon: const Icon(Icons.campaign_outlined),
              onPressed: () => Navigator.of(context)
                  .pushNamed(AppRoutes.managerialAnnouncements),
            ),
          ],
          bottom: TabBar(
            indicatorColor: AppColors.royalGold,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withValues(alpha: 0.65),
            tabs: [
              Tab(text: l10n.tabLeaves),
              Tab(text: l10n.tabAttendanceExemptions),
            ],
          ),
        ),
        body: AppShellBackdrop(
          child: TabBarView(
          children: [
            _ApprovalList(
              items: DemoData.pendingLeaves,
              detailTitle: l10n.leaveDetails,
            ),
            _ApprovalList(
              items: DemoData.pendingExemptions,
              detailTitle: l10n.exemptionDetails,
            ),
          ],
          ),
        ),
      ),
    );
  }
}

class _ApprovalList extends StatelessWidget {
  const _ApprovalList({
    required this.items,
    required this.detailTitle,
  });

  final List<ApprovalItem> items;
  final String detailTitle;

  @override
  Widget build(BuildContext context) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = contentMaxWidth(context);
        return Align(
          alignment: Alignment.topCenter,
          child: ListView.separated(
            padding: pagePadding(context),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final e = items[i];
              return ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxW),
                child: Card(
                  child: ListTile(
                    title: Text(e.localizedTitle(isAr)),
                    subtitle: Text(e.localizedSubtitle(isAr)),
                    trailing: Icon(
                      Directionality.of(context) == TextDirection.rtl
                          ? Icons.chevron_left
                          : Icons.chevron_right,
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.managerialApprovalDetail,
                        arguments: {
                          'title': detailTitle,
                          'item': e,
                        },
                      );
                    },
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
