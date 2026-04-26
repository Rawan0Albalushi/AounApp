import 'package:flutter/material.dart';

import '../../models/approval_item.dart';
import '../../views/auth/forgot_password_view.dart';
import '../../views/auth/login_view.dart';
import '../../views/auth/otp_view.dart';
import '../../views/auth/reset_password_view.dart';
import '../../views/forms/create_task_view.dart';
import '../../views/forms/leave_request_view.dart';
import '../../views/forms/service_request_view.dart';
import '../../views/forms/we_listen_view.dart';
import '../../views/main/main_shell.dart';
import '../../views/managerial/announcements_view.dart';
import '../../views/managerial/approval_detail_view.dart';
import '../../views/managerial/approvals_view.dart';
import '../../views/managerial/create_announcement_view.dart';
import '../../views/onboarding/onboarding_view.dart';
import '../../views/reports/attendance_report_view.dart';
import '../../views/reports/leave_status_report_view.dart';
import '../../views/reports/payslip_report_view.dart';
import '../../views/reports/salary_transfer_view.dart';
import '../../views/reports/service_status_report_view.dart';
import '../../views/settings/about_us_view.dart';
import '../../views/settings/change_password_view.dart';
import '../../views/settings/terms_of_service_view.dart';
import '../../views/splash/splash_view.dart';
import '../../views/tasks/task_list_view.dart';
import 'app_routes.dart';

typedef AppRouteBuilder = Widget Function(BuildContext context);

abstract final class AppRouter {
  static Map<String, AppRouteBuilder> get routes => {
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
    AppRoutes.reportService: (_) => const ServiceStatusReportView(),
    AppRoutes.reportPayslip: (_) => const PayslipReportView(),
    AppRoutes.formLeave: (_) => const LeaveRequestView(),
    AppRoutes.taskList: (_) => const TaskListView(),
    AppRoutes.formTask: (_) => const CreateTaskView(),
    AppRoutes.formService: (_) => const ServiceRequestView(),
    AppRoutes.formWeListen: (_) => const WeListenView(),
    AppRoutes.managerialApprovals: (_) => const ApprovalsView(),
    AppRoutes.managerialAnnouncements: (_) => const AnnouncementsView(),
    AppRoutes.managerialAnnouncementCreate: (_) => const CreateAnnouncementView(),
    AppRoutes.aboutUs: (_) => const AboutUsView(),
    AppRoutes.termsOfService: (_) => const TermsOfServiceView(),
    AppRoutes.changePassword: (_) => const ChangePasswordView(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppRoutes.managerialApprovalDetail) {
      final args = settings.arguments as Map<String, Object?>?;
      final item = args?['item'] as ApprovalItem?;
      final title = args?['title'] as String?;
      if (item != null && title != null) {
        return MaterialPageRoute<void>(
          builder: (_) => ApprovalDetailView(detailTitle: title, item: item),
          settings: settings,
        );
      }
    }
    return null;
  }
}
