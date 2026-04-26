import 'package:flutter/material.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../features/dashboard/presentation/widgets/dashboard_sections.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/demo_notifications_sheet.dart';
import '../main/main_shell.dart';

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
                              DashboardHomeHeader(
                                l10n: l10n,
                                onNotificationsTap: () =>
                                    showDemoNotificationsSheet(context),
                              ),
                              Positioned(
                                left: 20,
                                right: 20,
                                top: 168,
                                child: DashboardStatusCards(
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
                              DashboardServicesPanel(
                                l10n: l10n,
                                onRouteTap: (route) =>
                                    openAppRoute(context, route),
                                onWeListenTap: () => openAppRoute(
                                  context,
                                  AppRoutes.formWeListen,
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
                              DashboardAnnouncementsPanel(
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
