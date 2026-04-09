import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Aoun'**
  String get appTitle;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Your workplace companion'**
  String get appTagline;

  /// No description provided for @commonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get commonContinue;

  /// No description provided for @commonSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get commonSkip;

  /// No description provided for @commonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get commonNext;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get commonSubmit;

  /// No description provided for @commonSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get commonSearch;

  /// No description provided for @commonDownloadPdf.
  ///
  /// In en, this message translates to:
  /// **'Download PDF'**
  String get commonDownloadPdf;

  /// No description provided for @commonApprove.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get commonApprove;

  /// No description provided for @commonReject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get commonReject;

  /// No description provided for @commonViewDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get commonViewDetails;

  /// No description provided for @commonLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading…'**
  String get commonLoading;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @signOutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get signOutConfirm;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Everything in one place'**
  String get onboardingTitle1;

  /// No description provided for @onboardingBody1.
  ///
  /// In en, this message translates to:
  /// **'Access attendance, leave, payslips, and services from a single dashboard.'**
  String get onboardingBody1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Built for clarity'**
  String get onboardingTitle2;

  /// No description provided for @onboardingBody2.
  ///
  /// In en, this message translates to:
  /// **'A premium experience with clear status tags and smooth navigation.'**
  String get onboardingBody2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Speak your language'**
  String get onboardingTitle3;

  /// No description provided for @onboardingBody3.
  ///
  /// In en, this message translates to:
  /// **'Switch between Arabic and English anytime with proper RTL and LTR layouts.'**
  String get onboardingBody3;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get loginTitle;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue'**
  String get loginSubtitle;

  /// No description provided for @fieldEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get fieldEmail;

  /// No description provided for @fieldPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get fieldPassword;

  /// No description provided for @fieldConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get fieldConfirmPassword;

  /// No description provided for @fieldOtp.
  ///
  /// In en, this message translates to:
  /// **'Verification code'**
  String get fieldOtp;

  /// No description provided for @loginAction.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get loginAction;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @forgotTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get forgotTitle;

  /// No description provided for @forgotSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email and we will send a verification code.'**
  String get forgotSubtitle;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get sendCode;

  /// No description provided for @otpTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP'**
  String get otpTitle;

  /// No description provided for @otpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We sent a code to {email}'**
  String otpSubtitle(String email);

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @resetTitle.
  ///
  /// In en, this message translates to:
  /// **'Create new password'**
  String get resetTitle;

  /// No description provided for @resetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a strong password for your account.'**
  String get resetSubtitle;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @dashboardGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}'**
  String dashboardGreeting(String name);

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick actions'**
  String get quickActions;

  /// No description provided for @actionAttendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get actionAttendance;

  /// No description provided for @actionLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave'**
  String get actionLeave;

  /// No description provided for @actionServiceStatus.
  ///
  /// In en, this message translates to:
  /// **'Service status'**
  String get actionServiceStatus;

  /// No description provided for @servicesTitle.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get servicesTitle;

  /// No description provided for @svcTasks.
  ///
  /// In en, this message translates to:
  /// **'Tasks'**
  String get svcTasks;

  /// No description provided for @svcAttendanceReport.
  ///
  /// In en, this message translates to:
  /// **'Attendance report'**
  String get svcAttendanceReport;

  /// No description provided for @svcPayslip.
  ///
  /// In en, this message translates to:
  /// **'Payslip'**
  String get svcPayslip;

  /// No description provided for @svcServiceMgmt.
  ///
  /// In en, this message translates to:
  /// **'Service management'**
  String get svcServiceMgmt;

  /// No description provided for @svcLeaveMgmt.
  ///
  /// In en, this message translates to:
  /// **'Leave management'**
  String get svcLeaveMgmt;

  /// No description provided for @svcManagerDetails.
  ///
  /// In en, this message translates to:
  /// **'Manager details'**
  String get svcManagerDetails;

  /// No description provided for @svcWeListen.
  ///
  /// In en, this message translates to:
  /// **'We Listen'**
  String get svcWeListen;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @employeeNo.
  ///
  /// In en, this message translates to:
  /// **'Employee No.'**
  String get employeeNo;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// No description provided for @branch.
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get branch;

  /// No description provided for @joiningDate.
  ///
  /// In en, this message translates to:
  /// **'Joining date'**
  String get joiningDate;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @reportAttendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance report'**
  String get reportAttendance;

  /// No description provided for @reportSalaryTransfer.
  ///
  /// In en, this message translates to:
  /// **'Salary transfer status'**
  String get reportSalaryTransfer;

  /// No description provided for @reportLeaveStatus.
  ///
  /// In en, this message translates to:
  /// **'Leave status'**
  String get reportLeaveStatus;

  /// No description provided for @reportPayslip.
  ///
  /// In en, this message translates to:
  /// **'Payslip'**
  String get reportPayslip;

  /// No description provided for @dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date range'**
  String get dateRange;

  /// No description provided for @selectDateRange.
  ///
  /// In en, this message translates to:
  /// **'Select date range'**
  String get selectDateRange;

  /// No description provided for @statusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @statusEarlyExit.
  ///
  /// In en, this message translates to:
  /// **'Early exit'**
  String get statusEarlyExit;

  /// No description provided for @statusApproved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get statusApproved;

  /// No description provided for @statusRejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get statusRejected;

  /// No description provided for @leaveRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave request'**
  String get leaveRequestTitle;

  /// No description provided for @leaveBalance.
  ///
  /// In en, this message translates to:
  /// **'Leave balance'**
  String get leaveBalance;

  /// No description provided for @leaveType.
  ///
  /// In en, this message translates to:
  /// **'Leave type'**
  String get leaveType;

  /// No description provided for @attachment.
  ///
  /// In en, this message translates to:
  /// **'Attachment'**
  String get attachment;

  /// No description provided for @pickFile.
  ///
  /// In en, this message translates to:
  /// **'Pick file'**
  String get pickFile;

  /// No description provided for @createTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'Create task'**
  String get createTaskTitle;

  /// No description provided for @assignTo.
  ///
  /// In en, this message translates to:
  /// **'Assign to employee'**
  String get assignTo;

  /// No description provided for @taskDetails.
  ///
  /// In en, this message translates to:
  /// **'Task details'**
  String get taskDetails;

  /// No description provided for @priority.
  ///
  /// In en, this message translates to:
  /// **'Priority'**
  String get priority;

  /// No description provided for @priorityLow.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get priorityLow;

  /// No description provided for @priorityMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get priorityMedium;

  /// No description provided for @priorityHigh.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get priorityHigh;

  /// No description provided for @serviceRequestTitle.
  ///
  /// In en, this message translates to:
  /// **'Service request'**
  String get serviceRequestTitle;

  /// No description provided for @serviceType.
  ///
  /// In en, this message translates to:
  /// **'Service type'**
  String get serviceType;

  /// No description provided for @deliveryMethod.
  ///
  /// In en, this message translates to:
  /// **'Delivery method'**
  String get deliveryMethod;

  /// No description provided for @weListenTitle.
  ///
  /// In en, this message translates to:
  /// **'We Listen'**
  String get weListenTitle;

  /// No description provided for @feedbackCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get feedbackCategory;

  /// No description provided for @feedbackMessage.
  ///
  /// In en, this message translates to:
  /// **'Your message'**
  String get feedbackMessage;

  /// No description provided for @managerialTitle.
  ///
  /// In en, this message translates to:
  /// **'Approvals'**
  String get managerialTitle;

  /// No description provided for @tabLeaves.
  ///
  /// In en, this message translates to:
  /// **'Leaves'**
  String get tabLeaves;

  /// No description provided for @tabAttendanceExemptions.
  ///
  /// In en, this message translates to:
  /// **'Attendance exemptions'**
  String get tabAttendanceExemptions;

  /// No description provided for @announcementsTitle.
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get announcementsTitle;

  /// No description provided for @announcementsSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get announcementsSeeAll;

  /// No description provided for @announcementsHomePreviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Year-end office notice'**
  String get announcementsHomePreviewTitle;

  /// No description provided for @announcementsHomePreviewPeriod.
  ///
  /// In en, this message translates to:
  /// **'Dec 26–31, 2024'**
  String get announcementsHomePreviewPeriod;

  /// No description provided for @announcementsStatusActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get announcementsStatusActive;

  /// No description provided for @createAnnouncement.
  ///
  /// In en, this message translates to:
  /// **'Create announcement'**
  String get createAnnouncement;

  /// No description provided for @announcementTitleEn.
  ///
  /// In en, this message translates to:
  /// **'Title (English)'**
  String get announcementTitleEn;

  /// No description provided for @announcementTitleAr.
  ///
  /// In en, this message translates to:
  /// **'Title (Arabic)'**
  String get announcementTitleAr;

  /// No description provided for @announcementBodyEn.
  ///
  /// In en, this message translates to:
  /// **'Message (English)'**
  String get announcementBodyEn;

  /// No description provided for @announcementBodyAr.
  ///
  /// In en, this message translates to:
  /// **'Message (Arabic)'**
  String get announcementBodyAr;

  /// No description provided for @emptyNoItems.
  ///
  /// In en, this message translates to:
  /// **'Nothing here yet'**
  String get emptyNoItems;

  /// No description provided for @emptyNoItemsHint.
  ///
  /// In en, this message translates to:
  /// **'When there is data, it will show up here.'**
  String get emptyNoItemsHint;

  /// No description provided for @exemptionDetails.
  ///
  /// In en, this message translates to:
  /// **'Exemption details'**
  String get exemptionDetails;

  /// No description provided for @leaveDetails.
  ///
  /// In en, this message translates to:
  /// **'Leave details'**
  String get leaveDetails;

  /// No description provided for @announcementDetails.
  ///
  /// In en, this message translates to:
  /// **'Announcement details'**
  String get announcementDetails;

  /// No description provided for @validationRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get validationRequired;

  /// No description provided for @validationEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get validationEmail;

  /// No description provided for @validationMinPassword.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get validationMinPassword;

  /// No description provided for @validationPasswordMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get validationPasswordMatch;

  /// No description provided for @validationOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code'**
  String get validationOtp;

  /// No description provided for @sampleUserName.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Al-Mansouri'**
  String get sampleUserName;

  /// No description provided for @sampleJobTitle.
  ///
  /// In en, this message translates to:
  /// **'Senior Specialist'**
  String get sampleJobTitle;

  /// No description provided for @sampleDepartment.
  ///
  /// In en, this message translates to:
  /// **'Human Resources'**
  String get sampleDepartment;

  /// No description provided for @sampleBranch.
  ///
  /// In en, this message translates to:
  /// **'Riyadh HQ'**
  String get sampleBranch;

  /// No description provided for @sampleEmployeeNo.
  ///
  /// In en, this message translates to:
  /// **'EMP-10294'**
  String get sampleEmployeeNo;

  /// No description provided for @settingsAboutUs.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get settingsAboutUs;

  /// No description provided for @settingsTermsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of service agreement'**
  String get settingsTermsOfService;

  /// No description provided for @settingsChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get settingsChangePassword;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select language'**
  String get selectLanguage;

  /// No description provided for @languageArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get languageArabic;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @fieldCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get fieldCurrentPassword;

  /// No description provided for @changePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePasswordTitle;

  /// No description provided for @changePasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your current password and choose a new secure password.'**
  String get changePasswordSubtitle;

  /// No description provided for @changePasswordSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password updated successfully.'**
  String get changePasswordSuccess;

  /// No description provided for @aboutUsContent.
  ///
  /// In en, this message translates to:
  /// **'Aoun is your workplace companion — bringing attendance, leave, payslips, and services into one clear experience. We are committed to a reliable, accessible experience for every employee.\n\nThis app is designed to support your daily tasks at work with clarity and ease of use.'**
  String get aboutUsContent;

  /// No description provided for @termsOfServiceContent.
  ///
  /// In en, this message translates to:
  /// **'Last updated: April 2026.\n\nBy using the Aoun application, you agree to these terms. You must use the app only for authorized workplace purposes and in accordance with your employer\'s policies.\n\nWe may update features and these terms from time to time. Continued use of the app after changes constitutes acceptance of the revised terms.\n\nFor questions about these terms, contact your HR or IT department.'**
  String get termsOfServiceContent;

  /// No description provided for @dashboardCardAttendanceStatus.
  ///
  /// In en, this message translates to:
  /// **'Attendance\nStatus'**
  String get dashboardCardAttendanceStatus;

  /// No description provided for @dashboardCardLeaveStatus.
  ///
  /// In en, this message translates to:
  /// **'Leave\nStatus'**
  String get dashboardCardLeaveStatus;

  /// No description provided for @dashboardCardServiceStatus.
  ///
  /// In en, this message translates to:
  /// **'Service\nStatus'**
  String get dashboardCardServiceStatus;

  /// No description provided for @dashboardGridTask.
  ///
  /// In en, this message translates to:
  /// **'Task\nDetails'**
  String get dashboardGridTask;

  /// No description provided for @dashboardGridAttendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance\nDetails'**
  String get dashboardGridAttendance;

  /// No description provided for @dashboardGridPayslip.
  ///
  /// In en, this message translates to:
  /// **'Payslip\nDetails'**
  String get dashboardGridPayslip;

  /// No description provided for @dashboardGridServiceMgmt.
  ///
  /// In en, this message translates to:
  /// **'Service\nManagement'**
  String get dashboardGridServiceMgmt;

  /// No description provided for @dashboardGridLeaveMgmt.
  ///
  /// In en, this message translates to:
  /// **'Leave\nManagement'**
  String get dashboardGridLeaveMgmt;

  /// No description provided for @dashboardGridManager.
  ///
  /// In en, this message translates to:
  /// **'Manager\nDetails'**
  String get dashboardGridManager;

  /// No description provided for @fieldDateStart.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get fieldDateStart;

  /// No description provided for @fieldDateEnd.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get fieldDateEnd;

  /// No description provided for @leaveBalanceBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Annual: 10 · Sick: 3 · Other: 1'**
  String get leaveBalanceBreakdown;

  /// No description provided for @demoAttachmentPdf.
  ///
  /// In en, this message translates to:
  /// **'medical-note-demo.pdf · 240 KB'**
  String get demoAttachmentPdf;

  /// No description provided for @labelReferenceShort.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get labelReferenceShort;

  /// No description provided for @approvalDetailNarrative.
  ///
  /// In en, this message translates to:
  /// **'Reference {id} · Submitted via Aoun app.\n\nAll timestamps are in Riyadh time. Supporting documents were uploaded to the HR document vault. You can cross-check policy rules SP-HR-12 and AT-EX-03 before deciding.\n\nEmployee unit: Operations · Cost center: CC-4401.'**
  String approvalDetailNarrative(String id);

  /// No description provided for @demoSampleTaskBody.
  ///
  /// In en, this message translates to:
  /// **'Review the Q2 attendance policy draft and add comments by Apr 18. Focus on remote-work clauses and overtime caps.'**
  String get demoSampleTaskBody;

  /// No description provided for @demoSampleFeedbackBody.
  ///
  /// In en, this message translates to:
  /// **'The new leave request form is clearer. It would help to show remaining balance per leave type in the same screen.'**
  String get demoSampleFeedbackBody;

  /// No description provided for @demoLoginHint.
  ///
  /// In en, this message translates to:
  /// **'Demo: demo@aoun.app · password12'**
  String get demoLoginHint;

  /// No description provided for @demoOtpHint.
  ///
  /// In en, this message translates to:
  /// **'Demo: use code 123456'**
  String get demoOtpHint;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
