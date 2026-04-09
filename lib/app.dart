import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/router/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'l10n/app_localizations.dart';
import 'providers/app_settings_provider.dart';
import 'views/auth/forgot_password_view.dart';
import 'views/auth/login_view.dart';
import 'views/auth/otp_view.dart';
import 'views/auth/reset_password_view.dart';
import 'views/forms/create_task_view.dart';
import 'views/forms/leave_request_view.dart';
import 'views/forms/service_request_view.dart';
import 'views/forms/we_listen_view.dart';
import 'views/main/main_shell.dart';
import 'views/managerial/announcements_view.dart';
import 'views/managerial/approval_detail_view.dart';
import 'views/managerial/approvals_view.dart';
import 'views/managerial/create_announcement_view.dart';
import 'models/approval_item.dart';
import 'views/onboarding/onboarding_view.dart';
import 'views/reports/attendance_report_view.dart';
import 'views/reports/leave_status_report_view.dart';
import 'views/reports/payslip_report_view.dart';
import 'views/reports/salary_transfer_view.dart';
import 'views/settings/about_us_view.dart';
import 'views/settings/change_password_view.dart';
import 'views/settings/terms_of_service_view.dart';
import 'views/splash/splash_view.dart';

class AounApp extends StatelessWidget {
  const AounApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettingsProvider>(
      builder: (context, settings, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Aoun',
          locale: settings.locale,
          theme: buildAppTheme(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          initialRoute: AppRoutes.splash,
          routes: {
            AppRoutes.splash: (_) => const SplashView(),
            AppRoutes.onboarding: (_) => const OnboardingView(),
            AppRoutes.login: (_) => const LoginView(),
            AppRoutes.forgotPassword: (_) => const ForgotPasswordView(),
            AppRoutes.otp: (_) => const OtpView(),
            AppRoutes.resetPassword: (_) => const ResetPasswordView(),
            AppRoutes.main: (_) => const MainShell(),
            AppRoutes.reportAttendance: (_) => const AttendanceReportView(),
            AppRoutes.reportSalary: (_) => const SalaryTransferView(),
            AppRoutes.reportLeave: (_) => const LeaveStatusReportView(),
            AppRoutes.reportPayslip: (_) => const PayslipReportView(),
            AppRoutes.formLeave: (_) => const LeaveRequestView(),
            AppRoutes.formTask: (_) => const CreateTaskView(),
            AppRoutes.formService: (_) => const ServiceRequestView(),
            AppRoutes.formWeListen: (_) => const WeListenView(),
            AppRoutes.managerialApprovals: (_) => const ApprovalsView(),
            AppRoutes.managerialAnnouncements: (_) => const AnnouncementsView(),
            AppRoutes.managerialAnnouncementCreate: (_) =>
                const CreateAnnouncementView(),
            AppRoutes.aboutUs: (_) => const AboutUsView(),
            AppRoutes.termsOfService: (_) => const TermsOfServiceView(),
            AppRoutes.changePassword: (_) => const ChangePasswordView(),
          },
          onGenerateRoute: (settings) {
            if (settings.name == AppRoutes.managerialApprovalDetail) {
              final args = settings.arguments as Map<String, Object?>?;
              final item = args?['item'] as ApprovalItem?;
              final title = args?['title'] as String?;
              if (item != null && title != null) {
                return MaterialPageRoute<void>(
                  builder: (_) => ApprovalDetailView(
                    detailTitle: title,
                    item: item,
                  ),
                  settings: settings,
                );
              }
            }
            return null;
          },
        );
      },
    );
  }
}
