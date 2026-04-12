// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Aoun';

  @override
  String get appTagline => 'Your workplace companion';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonSkip => 'Skip';

  @override
  String get commonNext => 'Next';

  @override
  String get commonBack => 'Back';

  @override
  String get commonSave => 'Save';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSubmit => 'Submit';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonDownloadPdf => 'Download PDF';

  @override
  String get commonApprove => 'Approve';

  @override
  String get commonReject => 'Reject';

  @override
  String get commonViewDetails => 'View details';

  @override
  String get commonLoading => 'Loading…';

  @override
  String get commonRetry => 'Retry';

  @override
  String get signOut => 'Sign out';

  @override
  String get signOutConfirm => 'Are you sure you want to sign out?';

  @override
  String get onboardingTitle1 => 'Everything in one place';

  @override
  String get onboardingBody1 =>
      'Access attendance, leave, payslips, and services from a single dashboard.';

  @override
  String get onboardingTitle2 => 'Built for clarity';

  @override
  String get onboardingBody2 =>
      'A premium experience with clear status tags and smooth navigation.';

  @override
  String get onboardingTitle3 => 'Speak your language';

  @override
  String get onboardingBody3 =>
      'Switch between Arabic and English anytime with proper RTL and LTR layouts.';

  @override
  String get loginTitle => 'Welcome back';

  @override
  String get loginSubtitle => 'Sign in to continue';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldPassword => 'Password';

  @override
  String get fieldConfirmPassword => 'Confirm password';

  @override
  String get fieldOtp => 'Verification code';

  @override
  String get loginAction => 'Sign in';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get forgotTitle => 'Reset password';

  @override
  String get forgotSubtitle =>
      'Enter your email and we will send a verification code.';

  @override
  String get sendCode => 'Send code';

  @override
  String get otpTitle => 'Enter OTP';

  @override
  String otpSubtitle(String email) {
    return 'We sent a code to $email';
  }

  @override
  String get verify => 'Verify';

  @override
  String get resetTitle => 'Create new password';

  @override
  String get resetSubtitle => 'Choose a strong password for your account.';

  @override
  String get resetPassword => 'Reset password';

  @override
  String get navHome => 'Home';

  @override
  String get navProfile => 'Profile';

  @override
  String get navSettings => 'Settings';

  @override
  String dashboardGreeting(String name) {
    return 'Hello, $name';
  }

  @override
  String get dashboardTitle => 'Dashboard';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsEmpty => 'No notifications yet';

  @override
  String get quickActions => 'Quick actions';

  @override
  String get actionAttendance => 'Attendance';

  @override
  String get actionLeave => 'Leave';

  @override
  String get actionServiceStatus => 'Service status';

  @override
  String get servicesTitle => 'Services';

  @override
  String get svcTasks => 'Tasks';

  @override
  String get svcAttendanceReport => 'Attendance report';

  @override
  String get svcPayslip => 'Payslip';

  @override
  String get svcServiceMgmt => 'Service management';

  @override
  String get svcLeaveMgmt => 'Leave management';

  @override
  String get svcManagerDetails => 'Manager details';

  @override
  String get svcWeListen => 'We Listen';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileSubtitle => 'Your workplace identity and contact details.';

  @override
  String get employeeNo => 'Employee No.';

  @override
  String get department => 'Department';

  @override
  String get branch => 'Branch';

  @override
  String get joiningDate => 'Joining date';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get reportAttendance => 'Attendance report';

  @override
  String get reportSalaryTransfer => 'Salary transfer status';

  @override
  String get reportLeaveStatus => 'Leave status';

  @override
  String get reportServiceStatus => 'Service status';

  @override
  String get reportPayslip => 'Payslip';

  @override
  String get dateRange => 'Date range';

  @override
  String get reportsListSubtitle => 'Filter by period and browse your records.';

  @override
  String get selectDateRange => 'Select date range';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusEarlyExit => 'Early exit';

  @override
  String get statusApproved => 'Approved';

  @override
  String get statusRejected => 'Rejected';

  @override
  String get leaveRequestTitle => 'Leave request';

  @override
  String get leaveRequestSubtitle => 'Plan time off with your balance in view.';

  @override
  String get leaveRequestIntro =>
      'Choose the leave type and dates, add an attachment if required, then submit for approval.';

  @override
  String get leaveRequestSubmitSuccess =>
      'Your leave request has been submitted.';

  @override
  String get leaveBalance => 'Leave balance';

  @override
  String get leaveType => 'Leave type';

  @override
  String get attachment => 'Attachment';

  @override
  String get pickFile => 'Pick file';

  @override
  String get createTaskTitle => 'Create task';

  @override
  String get createTaskSubtitle =>
      'Assign work with clear priority and context.';

  @override
  String get createTaskIntro =>
      'Pick a teammate, describe what needs to be done, and set priority.';

  @override
  String get createTaskSubmitSuccess => 'The task has been created.';

  @override
  String get assignTo => 'Assign to employee';

  @override
  String get taskDetails => 'Task details';

  @override
  String get taskListHeroSubtitle => 'See assignments and tasks you created.';

  @override
  String get taskListCreateNew => 'Create new task';

  @override
  String get priority => 'Priority';

  @override
  String get priorityLow => 'Low';

  @override
  String get priorityMedium => 'Medium';

  @override
  String get priorityHigh => 'High';

  @override
  String get serviceRequestTitle => 'Service request';

  @override
  String get serviceRequestSubtitle =>
      'HR letters, certificates, and workplace documents.';

  @override
  String get serviceRequestIntro =>
      'Pick the service and delivery method, then describe what you need so HR can prepare it without back-and-forth.';

  @override
  String get serviceRequestDetails => 'Details';

  @override
  String get serviceRequestDetailsHint =>
      'Purpose, exact wording, copies, or other instructions';

  @override
  String get serviceRequestNeededBy => 'Needed by';

  @override
  String get serviceRequestSubmitSuccess =>
      'Your service request has been submitted.';

  @override
  String get serviceType => 'Service type';

  @override
  String get deliveryMethod => 'Delivery method';

  @override
  String get weListenTitle => 'We Listen';

  @override
  String get weListenSubtitle =>
      'Ideas, concerns, or praise — we read every submission.';

  @override
  String get weListenIntro =>
      'Your feedback helps us improve Aoun and workplace services. Pick a category, set priority, and tell us what’s on your mind.';

  @override
  String get weListenSubmitSuccess => 'Thank you. Your feedback has been sent.';

  @override
  String get feedbackCategory => 'Category';

  @override
  String get feedbackMessage => 'Your message';

  @override
  String get feedbackMessageHint => 'What would you like us to know?';

  @override
  String get managerialTitle => 'Approvals';

  @override
  String get managerialSubtitle =>
      'Review pending leave and attendance requests.';

  @override
  String get tabLeaves => 'Leaves';

  @override
  String get tabAttendanceExemptions => 'Attendance exemptions';

  @override
  String get approvalStatusPending => 'Pending';

  @override
  String approvalsPendingSummary(int count) {
    return '$count pending';
  }

  @override
  String get approvalsEmptyLeavesTitle => 'No leave requests';

  @override
  String get approvalsEmptyLeavesHint =>
      'When a team member submits leave, it will appear here for your review.';

  @override
  String get approvalsEmptyExemptionsTitle => 'No attendance exemptions';

  @override
  String get approvalsEmptyExemptionsHint =>
      'Late arrivals, early departures, and similar requests will show up here.';

  @override
  String get announcementsTitle => 'Announcements';

  @override
  String get announcementsSubtitle => 'Company news and updates for your team.';

  @override
  String get announcementsSeeAll => 'See all';

  @override
  String get announcementsHomePreviewTitle => 'Year-end office notice';

  @override
  String get announcementsHomePreviewPeriod => 'Dec 26–31, 2024';

  @override
  String get announcementsStatusActive => 'Active';

  @override
  String get createAnnouncement => 'Create announcement';

  @override
  String get createAnnouncementSubtitle =>
      'Publish bilingual updates for your organization.';

  @override
  String get createAnnouncementIntro =>
      'Complete both languages so every colleague can read the message clearly.';

  @override
  String get createAnnouncementSubmitSuccess =>
      'The announcement has been published.';

  @override
  String get announcementTitleEn => 'Title (English)';

  @override
  String get announcementTitleAr => 'Title (Arabic)';

  @override
  String get announcementBodyEn => 'Message (English)';

  @override
  String get announcementBodyAr => 'Message (Arabic)';

  @override
  String get emptyNoItems => 'Nothing here yet';

  @override
  String get emptyNoItemsHint => 'When there is data, it will show up here.';

  @override
  String get exemptionDetails => 'Exemption details';

  @override
  String get leaveDetails => 'Leave details';

  @override
  String get approvalDetailSubtitle =>
      'Review the request and choose an action.';

  @override
  String get announcementDetails => 'Announcement details';

  @override
  String get validationRequired => 'This field is required';

  @override
  String get validationEmail => 'Enter a valid email';

  @override
  String get validationMinPassword => 'Password must be at least 8 characters';

  @override
  String get validationPasswordMatch => 'Passwords do not match';

  @override
  String get validationPasswordSameAsCurrent =>
      'New password must be different from your current password';

  @override
  String get validationOtp => 'Enter the 6-digit code';

  @override
  String get sampleUserName => 'Ahmed Al-Mansouri';

  @override
  String get sampleJobTitle => 'Senior Specialist';

  @override
  String get sampleDepartment => 'Human Resources';

  @override
  String get sampleBranch => 'Riyadh HQ';

  @override
  String get sampleEmployeeNo => 'EMP-10294';

  @override
  String get settingsAboutUs => 'About us';

  @override
  String get aboutUsSubtitle =>
      'Our product story, mission, and how to get help.';

  @override
  String get settingsTermsOfService => 'Terms of service agreement';

  @override
  String get termsOfServiceSubtitle =>
      'Please read these terms before using the app.';

  @override
  String get settingsChangePassword => 'Change password';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get languageArabic => 'Arabic';

  @override
  String get languageEnglish => 'English';

  @override
  String get fieldCurrentPassword => 'Current password';

  @override
  String get changePasswordTitle => 'Change password';

  @override
  String get changePasswordSubtitle =>
      'Enter your current password and choose a new secure password.';

  @override
  String get changePasswordSuccess => 'Password updated successfully.';

  @override
  String get aboutUsIntro =>
      'Aoun (عون) means support — and that is what we aim to be: one calm, focused place for the things you do every day at work, from attendance and leave to payslips, services, and feedback.';

  @override
  String get aboutUsWhoWeAreTitle => 'Who we are';

  @override
  String get aboutUsWhoWeAreBody =>
      'Aoun is an employee experience application that brings HR-related workflows into a single mobile experience. Instead of juggling multiple tools or unclear status, you get a structured dashboard, clear labels, and flows designed around real tasks: checking attendance, following up on leave, reading announcements, and reaching out when something needs attention.';

  @override
  String get aboutUsMissionTitle => 'Our mission';

  @override
  String get aboutUsMissionBody =>
      'We want to shrink the gap between you and your organization’s systems — fewer steps, less ambiguity, and faster answers to “what is my status?” and “what do I need to do next?”. The app is built for everyday use: readable typography, sensible defaults, and navigation that stays out of your way.';

  @override
  String get aboutUsVisionTitle => 'Our vision';

  @override
  String get aboutUsVisionBody =>
      'A workplace where every employee — regardless of role or location — can see what matters, act on it in a few taps, and feel confident that information is presented clearly in both Arabic and English, with proper right-to-left and left-to-right layouts.';

  @override
  String get aboutUsOfferTitle => 'What you can do here';

  @override
  String get aboutUsOfferBody =>
      '• Follow attendance, leave, and service status from the home experience.\n• Submit leave requests, tasks, and service requests through guided forms.\n• Open payslip and salary transfer views where your organization enables them.\n• Read company announcements and use “We Listen” to share structured feedback.\n• If you are a manager, review approvals for leave and attendance exemptions in one place.';

  @override
  String get aboutUsValuesTitle => 'What guides us';

  @override
  String get aboutUsValuesBody =>
      'Clarity over noise: we prefer honest labels and visible states over decorative clutter. Respect for your time: fewer taps for common actions. Accessibility: Arabic and English on equal footing. Trust: security and policy alignment are assumed, not optional.';

  @override
  String get aboutUsPrivacyTitle => 'Privacy & security';

  @override
  String get aboutUsPrivacyBody =>
      'How your data is stored and processed follows your employer’s policies and applicable regulations. Protect your sign-in credentials, use company-approved devices and networks when required, and reach out to HR or IT if you suspect unauthorized access.';

  @override
  String get aboutUsSupportTitle => 'Help & contact';

  @override
  String get aboutUsSupportBody =>
      'For password resets, access issues, entitlement questions, or bugs, contact your HR or IT team — they own accounts, permissions, and integration with backend systems. Product feedback can also go through “We Listen” inside the app when your organization uses it.';

  @override
  String get aboutUsFooterNote =>
      'This page describes the Aoun product. Some screens may show sample or demo data for illustration. Last updated: April 2026.';

  @override
  String get termsOfServiceContent =>
      'Last updated: April 2026.\n\nBy using the Aoun application, you agree to these terms. You must use the app only for authorized workplace purposes and in accordance with your employer\'s policies.\n\nWe may update features and these terms from time to time. Continued use of the app after changes constitutes acceptance of the revised terms.\n\nFor questions about these terms, contact your HR or IT department.';

  @override
  String get dashboardCardAttendanceStatus => 'Attendance\nStatus';

  @override
  String get dashboardCardLeaveStatus => 'Leave\nStatus';

  @override
  String get dashboardCardServiceStatus => 'Service\nStatus';

  @override
  String get dashboardGridTask => 'Task\nDetails';

  @override
  String get dashboardGridAttendance => 'Attendance\nDetails';

  @override
  String get dashboardGridPayslip => 'Payslip\nDetails';

  @override
  String get dashboardGridSalaryTransfer => 'Salary\nTransfer';

  @override
  String get dashboardGridServiceMgmt => 'Service\nManagement';

  @override
  String get dashboardGridLeaveMgmt => 'Leave\nManagement';

  @override
  String get dashboardGridManager => 'Manager\nDetails';

  @override
  String get fieldDateStart => 'Start';

  @override
  String get fieldDateEnd => 'End';

  @override
  String get leaveBalanceBreakdown => 'Annual: 10 · Sick: 3 · Other: 1';

  @override
  String get demoAttachmentPdf => 'medical-note-demo.pdf · 240 KB';

  @override
  String get labelReferenceShort => 'ID';

  @override
  String approvalDetailNarrative(String id) {
    return 'Reference $id · Submitted via Aoun app.\n\nAll timestamps are in Riyadh time. Supporting documents were uploaded to the HR document vault. You can cross-check policy rules SP-HR-12 and AT-EX-03 before deciding.\n\nEmployee unit: Operations · Cost center: CC-4401.';
  }

  @override
  String get demoSampleTaskBody =>
      'Review the Q2 attendance policy draft and add comments by Apr 18. Focus on remote-work clauses and overtime caps.';

  @override
  String get demoSampleFeedbackBody =>
      'The new leave request form is clearer. It would help to show remaining balance per leave type in the same screen.';

  @override
  String get demoLoginHint => 'Demo: demo@aoun.app · password12';

  @override
  String get demoOtpHint => 'Demo: use code 123456';
}
