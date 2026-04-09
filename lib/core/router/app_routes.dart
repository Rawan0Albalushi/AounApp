/// Named routes for [MaterialApp].
abstract final class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String otp = '/otp';
  static const String resetPassword = '/reset-password';
  static const String main = '/main';

  static const String reportAttendance = '/reports/attendance';
  static const String reportSalary = '/reports/salary-transfer';
  static const String reportLeave = '/reports/leave-status';
  static const String reportService = '/reports/service-status';
  static const String reportPayslip = '/reports/payslip';

  static const String formLeave = '/forms/leave';
  /// Task list (assignments) before opening the create form.
  static const String taskList = '/tasks';
  static const String formTask = '/forms/task';
  static const String formService = '/forms/service';
  static const String formWeListen = '/forms/we-listen';

  static const String managerialApprovals = '/managerial/approvals';
  static const String managerialApprovalDetail = '/managerial/approval-detail';
  static const String managerialAnnouncements = '/managerial/announcements';
  static const String managerialAnnouncementCreate =
      '/managerial/announcements/create';

  static const String aboutUs = '/settings/about-us';
  static const String termsOfService = '/settings/terms-of-service';
  static const String changePassword = '/settings/change-password';
}
