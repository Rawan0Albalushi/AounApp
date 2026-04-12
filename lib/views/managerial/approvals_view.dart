import 'package:flutter/material.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/haptic_utils.dart';
import '../../core/utils/responsive.dart';
import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import '../../models/approval_item.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_hero_header.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/status_tag.dart';

class ApprovalsView extends StatelessWidget {
  const ApprovalsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.surfaceLight,
        body: AppShellBackdrop(
          child: SafeArea(
            top: false,
            child: SizedBox.expand(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Body sits *behind* the hero so cards can tuck under the gradient;
                  // the header is painted on top so [TabBar] taps are not stolen by the
                  // [TabBarView] (see hit-test order in [Stack]).
                  Positioned.fill(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: kCorporateHeroHeaderHeight -
                            kCorporateHeroOverlap,
                      ),
                      child: TabBarView(
                        children: [
                          _ApprovalList(
                            items: DemoData.pendingLeaves,
                            detailTitle: l10n.leaveDetails,
                            emptyIcon: Icons.beach_access_rounded,
                            emptyTitle: l10n.approvalsEmptyLeavesTitle,
                            emptyHint: l10n.approvalsEmptyLeavesHint,
                          ),
                          _ApprovalList(
                            items: DemoData.pendingExemptions,
                            detailTitle: l10n.exemptionDetails,
                            emptyIcon: Icons.fact_check_outlined,
                            emptyTitle: l10n.approvalsEmptyExemptionsTitle,
                            emptyHint: l10n.approvalsEmptyExemptionsHint,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CorporateHeroHeader(
                      title: l10n.managerialTitle,
                      subtitle: l10n.managerialSubtitle,
                      actions: [
                        IconButton(
                          tooltip: l10n.announcementsTitle,
                          icon: const Icon(Icons.campaign_outlined),
                          color: Colors.white,
                          onPressed: () => Navigator.of(context)
                              .pushNamed(AppRoutes.managerialAnnouncements),
                        ),
                      ],
                      bottom: TabBar(
                        indicatorColor: AppColors.royalGold,
                        indicatorWeight: 3,
                        labelColor: Colors.white,
                        unselectedLabelColor:
                            Colors.white.withValues(alpha: 0.65),
                        tabs: [
                          Tab(text: l10n.tabLeaves),
                          Tab(text: l10n.tabAttendanceExemptions),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String _firstChar(String s) {
  if (s.isEmpty) return '';
  return String.fromCharCode(s.runes.first);
}

String _initialsFromName(String name) {
  final parts =
      name.trim().split(RegExp(r'\s+')).where((s) => s.isNotEmpty).toList();
  if (parts.isEmpty) return '?';
  if (parts.length == 1) {
    final c = _firstChar(parts[0]);
    return c.isNotEmpty ? c.toUpperCase() : '?';
  }
  final a = _firstChar(parts[0]);
  final b = _firstChar(parts[1]);
  if (a.isEmpty && b.isEmpty) return '?';
  if (b.isEmpty) return a.toUpperCase();
  if (a.isEmpty) return b.toUpperCase();
  return '$a$b'.toUpperCase();
}

/// Uses first character when the title cannot be split into category · person.
String _initialsForItem(ApprovalItem item, bool isAr) {
  final parts = item.splitTitleParts(isAr);
  if (parts != null) {
    return _initialsFromName(parts.$2);
  }
  final t = item.localizedTitle(isAr);
  if (t.isEmpty) return '?';
  final c = _firstChar(t);
  return c.isNotEmpty ? c.toUpperCase() : '?';
}

class _ApprovalList extends StatelessWidget {
  const _ApprovalList({
    required this.items,
    required this.detailTitle,
    required this.emptyIcon,
    required this.emptyTitle,
    required this.emptyHint,
  });

  final List<ApprovalItem> items;
  final String detailTitle;
  final IconData emptyIcon;
  final String emptyTitle;
  final String emptyHint;

  Future<void> _onRefresh() async {
    lightImpact();
    await Future<void>.delayed(const Duration(milliseconds: 650));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final pageInsets = pagePadding(context);
    final maxW = contentMaxWidth(context);
    final scheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Align(
          alignment: Alignment.topCenter,
          child: RefreshIndicator(
            color: AppColors.royalGold,
            onRefresh: _onRefresh,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              // [TabBarView] starts at heroHeight−overlap; add [kCorporateHeroOverlap]
              // so the pending strip and cards sit fully below the gradient header.
              padding: EdgeInsets.fromLTRB(
                pageInsets.left,
                kCorporateHeroBodyTopSpacing + kCorporateHeroOverlap,
                pageInsets.right,
                pageInsets.bottom + 8,
              ),
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxW),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (items.isNotEmpty) ...[
                        _PendingSummaryBar(
                          label: l10n.approvalsPendingSummary(items.length),
                        ),
                        const SizedBox(height: 14),
                      ],
                      if (items.isEmpty)
                        SizedBox(
                          height: (constraints.maxHeight * 0.52)
                              .clamp(280.0, 520.0),
                          child: EmptyState(
                            icon: emptyIcon,
                            title: emptyTitle,
                            subtitle: emptyHint,
                          ),
                        )
                      else
                        ...List.generate(items.length, (i) {
                          final e = items[i];
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: i < items.length - 1 ? 12 : 0,
                            ),
                            child: _ApprovalCard(
                              item: e,
                              isAr: isAr,
                              scheme: scheme,
                              l10n: l10n,
                              detailTitle: detailTitle,
                            ),
                          );
                        }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PendingSummaryBar extends StatelessWidget {
  const _PendingSummaryBar({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.statusPendingBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.statusPendingFg.withValues(alpha: 0.12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Icon(
              Icons.pending_actions_rounded,
              size: 22,
              color: AppColors.statusPendingFg,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.statusPendingFg,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ApprovalCard extends StatelessWidget {
  const _ApprovalCard({
    required this.item,
    required this.isAr,
    required this.scheme,
    required this.l10n,
    required this.detailTitle,
  });

  final ApprovalItem item;
  final bool isAr;
  final ColorScheme scheme;
  final AppLocalizations l10n;
  final String detailTitle;

  IconData _typeIcon() {
    switch (item.type) {
      case ApprovalType.leave:
        return Icons.event_available_rounded;
      case ApprovalType.exemption:
        return Icons.schedule_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final parts = item.splitTitleParts(isAr);
    final initials = _initialsForItem(item, isAr);
    final chevron = Directionality.of(context) == TextDirection.rtl
        ? Icons.chevron_left_rounded
        : Icons.chevron_right_rounded;

    return Material(
      color: scheme.surface,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: scheme.outlineVariant.withValues(alpha: 0.55),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          lightImpact();
          Navigator.of(context).pushNamed(
            AppRoutes.managerialApprovalDetail,
            arguments: {
              'title': detailTitle,
              'item': item,
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 14, 8, 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: AppColors.royalGold.withValues(alpha: 0.18),
                foregroundColor: AppColors.goldDark,
                child: Text(
                  initials,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.goldDark,
                      ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: parts != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      parts.$1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                            color: scheme.onSurface
                                                .withValues(alpha: 0.55),
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      parts.$2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            height: 1.25,
                                          ),
                                    ),
                                  ],
                                )
                              : Text(
                                  item.localizedTitle(isAr),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: StatusTag(
                            label: l10n.approvalStatusPending,
                            kind: StatusKind.pending,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.localizedSubtitle(isAr),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: scheme.onSurface.withValues(alpha: 0.68),
                            height: 1.35,
                          ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        _InfoChip(
                          icon: _typeIcon(),
                          label: '${l10n.labelReferenceShort} ${item.id}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                chevron,
                color: scheme.onSurface.withValues(alpha: 0.35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: scheme.primary),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: scheme.onSurface.withValues(alpha: 0.8),
                ),
          ),
        ],
      ),
    );
  }
}
