import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/demo_notifications_sheet.dart';
import '../main/main_shell.dart';

List<BoxShadow> _cardShadow(BuildContext context) {
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

class DashboardView extends StatefulWidget {
  const DashboardView({super.key, this.onOpenTab});

  final void Function(int index)? onOpenTab;

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      body: AppShellBackdrop(
        child: SafeArea(
          top: false,
          child: LayoutBuilder(
              builder: (context, constraints) {
                final maxW = contentMaxWidth(context);
                return Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                      bottom: 24 + mainShellFloatingNavBottomPadding,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: maxW),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 316,
                            child: Stack(
                              children: [
                                _HomeHeader(
                                  l10n: l10n,
                                  onNotificationsTap: () =>
                                      showDemoNotificationsSheet(context),
                                ),
                                Positioned(
                                  left: 20,
                                  right: 20,
                                  top: 168,
                                  child:                                 _StatusCards(
                                    l10n: l10n,
                                    onAttendance: () => openAppRoute(
                                      context,
                                      AppRoutes.reportAttendance,
                                    ),
                                    onLeave: () => openAppRoute(
                                      context,
                                      AppRoutes.reportLeave,
                                    ),
                                    onService: () => openAppRoute(
                                      context,
                                      AppRoutes.reportService,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.95),
                                    borderRadius: BorderRadius.circular(24),
                                    boxShadow: _cardShadow(context),
                                  ),
                                  padding: const EdgeInsets.fromLTRB(
                                    16,
                                    18,
                                    16,
                                    16,
                                  ),
                                  child: Column(
                                    children: [
                                      _ServicesGrid(
                                        l10n: l10n,
                                        onTap: (route) =>
                                            openAppRoute(context, route),
                                      ),
                                      const SizedBox(height: 16),
                                      _WeListenButton(
                                        title: l10n.svcWeListen,
                                        onTap: () => openAppRoute(
                                          context,
                                          AppRoutes.formWeListen,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        l10n.announcementsTitle,
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(
                                              color: AppColors.navy,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => openAppRoute(
                                        context,
                                        AppRoutes.managerialAnnouncements,
                                      ),
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        minimumSize: Size.zero,
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        foregroundColor: AppColors.navy,
                                      ),
                                      child: Text(
                                        l10n.announcementsSeeAll,
                                        style: theme.textTheme.labelLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                _AnnouncementsHomePanel(
                                  l10n: l10n,
                                  onOpenList: () => openAppRoute(
                                    context,
                                    AppRoutes.managerialAnnouncements,
                                  ),
                                  onCreate: () => openAppRoute(
                                    context,
                                    AppRoutes.managerialAnnouncementCreate,
                                  ),
                                ),
                                const SizedBox(height: 8),
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

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({required this.l10n, required this.onNotificationsTap});

  final AppLocalizations l10n;
  final VoidCallback onNotificationsTap;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;
    return Container(
      height: 240,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(34),
          bottomRight: Radius.circular(34),
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
        boxShadow: _cardShadow(context),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(18, topInset + 20, 18, 16),
        child: Column(
          children: [
            Row(
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
                      Icons.person_rounded,
                      color: AppColors.navy,
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.sampleUserName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        l10n.sampleJobTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.9),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2F3DE),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          l10n.announcementsStatusActive,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: Colors.green.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  tooltip: l10n.notifications,
                  onPressed: onNotificationsTap,
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusCards extends StatelessWidget {
  const _StatusCards({
    required this.l10n,
    required this.onAttendance,
    required this.onLeave,
    required this.onService,
  });

  final AppLocalizations l10n;
  final VoidCallback onAttendance;
  final VoidCallback onLeave;
  final VoidCallback onService;

  @override
  Widget build(BuildContext context) {
    final items = [
      (l10n.dashboardCardAttendanceStatus, Icons.calendar_month_rounded, onAttendance),
      (l10n.dashboardCardLeaveStatus, Icons.flight_rounded, onLeave),
      (l10n.dashboardCardServiceStatus, Icons.build_rounded, onService),
    ];

    return Row(
      children: [
        for (var i = 0; i < items.length; i++) ...[
          if (i > 0) const SizedBox(width: 12),
          Expanded(
            child: _QuickCard(
              title: items[i].$1,
              icon: items[i].$2,
              onTap: items[i].$3,
            ),
          ),
        ],
      ],
    );
  }
}

class _QuickCard extends StatelessWidget {
  const _QuickCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  static const _radius = 22.0;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(_radius);
    return Material(
      color: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 24,
              offset: const Offset(0, 10),
              spreadRadius: -6,
            ),
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.35),
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(
                  width: 1.2,
                  color: Colors.white.withValues(alpha: 0.55),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(alpha: 0.42),
                    Colors.white.withValues(alpha: 0.18),
                  ],
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: borderRadius,
                  splashColor: AppColors.navy.withValues(alpha: 0.08),
                  highlightColor: AppColors.navy.withValues(alpha: 0.04),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.65),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withValues(alpha: 0.25),
                                blurRadius: 8,
                                spreadRadius: -2,
                              ),
                            ],
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withValues(alpha: 0.55),
                                Colors.white.withValues(alpha: 0.2),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Icon(
                              icon,
                              color: AppColors.royalGold,
                              size: 24,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.center,
                              child: _QuickCardTitleLines(
                                title: title,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Two-line labels (e.g. Attendance / Status) stay readable in narrow cards.
class _QuickCardTitleLines extends StatelessWidget {
  const _QuickCardTitleLines({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
          color: const Color(0xFF1A2332),
          fontWeight: FontWeight.w700,
          height: 1.18,
          letterSpacing: -0.12,
        );
    final lines = title
        .split('\n')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .toList();
    if (lines.isEmpty) {
      return const SizedBox.shrink();
    }
    if (lines.length == 1) {
      return Text(
        lines.first,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: baseStyle,
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < lines.length; i++) ...[
          if (i > 0) const SizedBox(height: 2),
          Text(
            lines[i],
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.visible,
            softWrap: false,
            style: baseStyle,
          ),
        ],
      ],
    );
  }
}

class _WeListenButton extends StatelessWidget {
  const _WeListenButton({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.navy,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.headset_mic_rounded, color: AppColors.royalGold),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnnouncementsHomePanel extends StatelessWidget {
  const _AnnouncementsHomePanel({
    required this.l10n,
    required this.onOpenList,
    required this.onCreate,
  });

  final AppLocalizations l10n;
  final VoidCallback onOpenList;
  final VoidCallback onCreate;

  static const _radius = 20.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final chevron = isRtl ? Icons.chevron_left : Icons.chevron_right;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_radius),
        border: Border.all(color: const Color(0xFFE6ECF4)),
        boxShadow: _cardShadow(context),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onOpenList,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.navy.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.campaign_outlined,
                          color: AppColors.navy,
                          size: 22,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.announcementsHomePreviewTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: const Color(0xFF1A2332),
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            l10n.announcementsHomePreviewPeriod,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: const Color(0xFF5C6B7A),
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.statusApprovedBg,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              l10n.announcementsStatusActive,
                              style: theme.textTheme.labelMedium?.copyWith(
                                color: AppColors.statusApprovedFg,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Icon(
                        chevron,
                        color: const Color(0xFF9AA5B1),
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFEEF2F7)),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onCreate,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline_rounded,
                      color: AppColors.royalGold,
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.createAnnouncement,
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: const Color(0xFF2D3748),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Icon(
                      chevron,
                      color: const Color(0xFF9AA5B1),
                      size: 20,
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

class _ServicesGrid extends StatelessWidget {
  const _ServicesGrid({required this.l10n, required this.onTap});

  final AppLocalizations l10n;
  final void Function(String route) onTap;

  @override
  Widget build(BuildContext context) {
    final entries = <(String title, IconData icon, String route)>[
      (
        l10n.dashboardGridTask,
        Icons.assignment_turned_in_outlined,
        AppRoutes.taskList,
      ),
      (
        l10n.dashboardGridAttendance,
        Icons.fingerprint_rounded,
        AppRoutes.reportAttendance,
      ),
      (
        l10n.dashboardGridPayslip,
        Icons.account_balance_wallet_outlined,
        AppRoutes.reportPayslip,
      ),
      (
        l10n.dashboardGridSalaryTransfer,
        Icons.payments_outlined,
        AppRoutes.reportSalary,
      ),
      (
        l10n.dashboardGridServiceMgmt,
        Icons.miscellaneous_services_outlined,
        AppRoutes.formService,
      ),
      (l10n.dashboardGridLeaveMgmt, Icons.event_note_outlined, AppRoutes.formLeave),
      (l10n.dashboardGridManager, Icons.badge_outlined, AppRoutes.managerialApprovals),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = gridColumnCount(context);
        const spacing = 14.0;
        final itemW = (constraints.maxWidth - spacing * (cols - 1)) / cols;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (var i = 0; i < entries.length; i++)
              SizedBox(
                width: itemW,
                child: _ServiceTile(
                  title: entries[i].$1,
                  icon: entries[i].$2,
                  onTap: () => onTap(entries[i].$3),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: _cardShadow(context),
        color: const Color(0xFFFAFCFF),
        border: Border.all(color: const Color(0x101C2533)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColors.goldDark, size: 34),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: const Color(0xFF1D2533),
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
