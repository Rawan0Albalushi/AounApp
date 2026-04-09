// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'عون';

  @override
  String get appTagline => 'رفيقك في العمل';

  @override
  String get commonContinue => 'متابعة';

  @override
  String get commonSkip => 'تخطي';

  @override
  String get commonNext => 'التالي';

  @override
  String get commonBack => 'رجوع';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonSubmit => 'إرسال';

  @override
  String get commonSearch => 'بحث';

  @override
  String get commonDownloadPdf => 'تنزيل PDF';

  @override
  String get commonApprove => 'اعتماد';

  @override
  String get commonReject => 'رفض';

  @override
  String get commonViewDetails => 'عرض التفاصيل';

  @override
  String get commonLoading => 'جاري التحميل…';

  @override
  String get commonRetry => 'إعادة المحاولة';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String get signOutConfirm => 'هل تريد تسجيل الخروج من التطبيق؟';

  @override
  String get onboardingTitle1 => 'كل شيء في مكان واحد';

  @override
  String get onboardingBody1 =>
      'الوصول إلى الحضور والإجازات والرواتب والخدمات من لوحة واحدة.';

  @override
  String get onboardingTitle2 => 'وضوح في التصميم';

  @override
  String get onboardingBody2 => 'تجربة متميزة مع وسوم حالة واضحة وتنقّل سلس.';

  @override
  String get onboardingTitle3 => 'بلغتك';

  @override
  String get onboardingBody3 =>
      'بدّل بين العربية والإنجليزية في أي وقت مع دعم الاتجاهين RTL و LTR.';

  @override
  String get loginTitle => 'مرحبًا بعودتك';

  @override
  String get loginSubtitle => 'سجّل الدخول للمتابعة';

  @override
  String get fieldEmail => 'البريد الإلكتروني';

  @override
  String get fieldPassword => 'كلمة المرور';

  @override
  String get fieldConfirmPassword => 'تأكيد كلمة المرور';

  @override
  String get fieldOtp => 'رمز التحقق';

  @override
  String get loginAction => 'تسجيل الدخول';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get forgotTitle => 'استعادة كلمة المرور';

  @override
  String get forgotSubtitle => 'أدخل بريدك الإلكتروني وسنرسل رمز تحقق.';

  @override
  String get sendCode => 'إرسال الرمز';

  @override
  String get otpTitle => 'أدخل رمز التحقق';

  @override
  String otpSubtitle(String email) {
    return 'أرسلنا رمزًا إلى $email';
  }

  @override
  String get verify => 'تحقق';

  @override
  String get resetTitle => 'إنشاء كلمة مرور جديدة';

  @override
  String get resetSubtitle => 'اختر كلمة مرور قوية لحسابك.';

  @override
  String get resetPassword => 'تغيير كلمة المرور';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navProfile => 'الملف';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String dashboardGreeting(String name) {
    return 'مرحبًا، $name';
  }

  @override
  String get dashboardTitle => 'لوحة التحكم';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get quickActions => 'إجراءات سريعة';

  @override
  String get actionAttendance => 'الحضور';

  @override
  String get actionLeave => 'الإجازة';

  @override
  String get actionServiceStatus => 'حالة الخدمة';

  @override
  String get servicesTitle => 'الخدمات';

  @override
  String get svcTasks => 'المهام';

  @override
  String get svcAttendanceReport => 'تقرير الحضور';

  @override
  String get svcPayslip => 'كشف الراتب';

  @override
  String get svcServiceMgmt => 'إدارة الخدمات';

  @override
  String get svcLeaveMgmt => 'إدارة الإجازات';

  @override
  String get svcManagerDetails => 'تفاصيل المدير';

  @override
  String get svcWeListen => 'نستمع إليك';

  @override
  String get profileTitle => 'الملف الشخصي';

  @override
  String get employeeNo => 'الرقم الوظيفي';

  @override
  String get department => 'القسم';

  @override
  String get branch => 'الفرع';

  @override
  String get joiningDate => 'تاريخ الانضمام';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String get reportAttendance => 'تقرير الحضور';

  @override
  String get reportSalaryTransfer => 'حالة تحويل الراتب';

  @override
  String get reportLeaveStatus => 'حالة الإجازة';

  @override
  String get reportPayslip => 'كشف الراتب';

  @override
  String get dateRange => 'الفترة الزمنية';

  @override
  String get selectDateRange => 'اختر الفترة';

  @override
  String get statusCompleted => 'مكتمل';

  @override
  String get statusPending => 'قيد الانتظار';

  @override
  String get statusEarlyExit => 'خروج مبكر';

  @override
  String get statusApproved => 'معتمد';

  @override
  String get statusRejected => 'مرفوض';

  @override
  String get leaveRequestTitle => 'طلب إجازة';

  @override
  String get leaveBalance => 'رصيد الإجازة';

  @override
  String get leaveType => 'نوع الإجازة';

  @override
  String get attachment => 'مرفق';

  @override
  String get pickFile => 'اختيار ملف';

  @override
  String get createTaskTitle => 'إنشاء مهمة';

  @override
  String get assignTo => 'تعيين لموظف';

  @override
  String get taskDetails => 'تفاصيل المهمة';

  @override
  String get priority => 'الأولوية';

  @override
  String get priorityLow => 'منخفضة';

  @override
  String get priorityMedium => 'متوسطة';

  @override
  String get priorityHigh => 'عالية';

  @override
  String get serviceRequestTitle => 'طلب خدمة';

  @override
  String get serviceType => 'نوع الخدمة';

  @override
  String get deliveryMethod => 'طريقة التسليم';

  @override
  String get weListenTitle => 'نستمع إليك';

  @override
  String get feedbackCategory => 'التصنيف';

  @override
  String get feedbackMessage => 'رسالتك';

  @override
  String get managerialTitle => 'الاعتمادات';

  @override
  String get tabLeaves => 'الإجازات';

  @override
  String get tabAttendanceExemptions => 'استثناءات الحضور';

  @override
  String get announcementsTitle => 'الإعلانات';

  @override
  String get announcementsSeeAll => 'عرض الكل';

  @override
  String get announcementsHomePreviewTitle => 'تعميم نهاية العام';

  @override
  String get announcementsHomePreviewPeriod => '٢٦–٣١ ديسمبر ٢٠٢٤';

  @override
  String get announcementsStatusActive => 'نشط';

  @override
  String get createAnnouncement => 'إنشاء إعلان';

  @override
  String get announcementTitleEn => 'العنوان (إنجليزي)';

  @override
  String get announcementTitleAr => 'العنوان (عربي)';

  @override
  String get announcementBodyEn => 'النص (إنجليزي)';

  @override
  String get announcementBodyAr => 'النص (عربي)';

  @override
  String get emptyNoItems => 'لا يوجد شيء بعد';

  @override
  String get emptyNoItemsHint => 'عند توفر بيانات ستظهر هنا.';

  @override
  String get exemptionDetails => 'تفاصيل الاستثناء';

  @override
  String get leaveDetails => 'تفاصيل الإجازة';

  @override
  String get announcementDetails => 'تفاصيل الإعلان';

  @override
  String get validationRequired => 'هذا الحقل مطلوب';

  @override
  String get validationEmail => 'أدخل بريدًا إلكترونيًا صالحًا';

  @override
  String get validationMinPassword => 'كلمة المرور 8 أحرف على الأقل';

  @override
  String get validationPasswordMatch => 'كلمتا المرور غير متطابقتين';

  @override
  String get validationOtp => 'أدخل الرمز المكوّن من 6 أرقام';

  @override
  String get sampleUserName => 'أحمد المنصوري';

  @override
  String get sampleJobTitle => 'أخصائي أول';

  @override
  String get sampleDepartment => 'الموارد البشرية';

  @override
  String get sampleBranch => 'الرياض — المقر';

  @override
  String get sampleEmployeeNo => 'EMP-10294';

  @override
  String get settingsAboutUs => 'من نحن';

  @override
  String get settingsTermsOfService => 'اتفاقية شروط الخدمة';

  @override
  String get settingsChangePassword => 'تغيير كلمة المرور';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get languageArabic => 'العربية';

  @override
  String get languageEnglish => 'English';

  @override
  String get fieldCurrentPassword => 'كلمة المرور الحالية';

  @override
  String get changePasswordTitle => 'تغيير كلمة المرور';

  @override
  String get changePasswordSubtitle =>
      'أدخل كلمة المرور الحالية واختر كلمة مرور جديدة آمنة.';

  @override
  String get changePasswordSuccess => 'تم تحديث كلمة المرور بنجاح.';

  @override
  String get aboutUsContent =>
      'عون رفيقك في مكان العمل — يجمع الحضور والإجازات وكشوف الرواتب والخدمات في تجربة واحدة واضحة. نلتزم بتجربة موثوقة وسهلة الوصول لكل موظف.\n\nصُمم هذا التطبيق لدعم مهامك اليومية في العمل بوضوح وسهولة في الاستخدام.';

  @override
  String get termsOfServiceContent =>
      'آخر تحديث: أبريل ٢٠٢٦.\n\nباستخدامك لتطبيق عون فإنك توافق على هذه الشروط. يجب استخدام التطبيق فقط للأغراض المصرح بها وفق سياسات جهة عملك.\n\nقد نحدّث الميزات وهذه الشروط من وقت لآخر. استمرارك في استخدام التطبيق بعد التغييرات يعني موافقتك على الشروط المحدثة.\n\nللاستفسارات حول هذه الشروط، تواصل مع الموارد البشرية أو تقنية المعلومات لدى جهة عملك.';

  @override
  String get dashboardCardAttendanceStatus => 'حالة\nالحضور';

  @override
  String get dashboardCardLeaveStatus => 'حالة\nالإجازة';

  @override
  String get dashboardCardServiceStatus => 'حالة\nالخدمة';

  @override
  String get dashboardGridTask => 'المهام\nالتفاصيل';

  @override
  String get dashboardGridAttendance => 'الحضور\nالتفاصيل';

  @override
  String get dashboardGridPayslip => 'كشف\nالراتب';

  @override
  String get dashboardGridServiceMgmt => 'إدارة\nالخدمات';

  @override
  String get dashboardGridLeaveMgmt => 'إدارة\nالإجازات';

  @override
  String get dashboardGridManager => 'تفاصيل\nالمدير';

  @override
  String get fieldDateStart => 'البداية';

  @override
  String get fieldDateEnd => 'النهاية';

  @override
  String get leaveBalanceBreakdown => 'سنوي: 10 · مرضي: 3 · أخرى: 1';

  @override
  String get demoAttachmentPdf => 'medical-note-demo.pdf · 240 ك.ب';

  @override
  String get labelReferenceShort => 'المعرّف';

  @override
  String approvalDetailNarrative(String id) {
    return 'المرجع $id · أُرسل عبر تطبيق عون.\n\nجميع الطوابع الزمنية بتوقيت الرياض. تم رفع المستندات الداعمة إلى أرشيف الموارد البشرية. يمكنك مراجعة سياسات SP-HR-12 و AT-EX-03 قبل اتخاذ القرار.\n\nوحدة الموظف: العمليات · مركز التكلفة: CC-4401.';
  }

  @override
  String get demoSampleTaskBody =>
      'راجع مسودة سياسة الحضور للربع الثاني وأضف ملاحظاتك قبل 18 أبريل. ركّز على بند العمل عن بُعد وسقف العمل الإضافي.';

  @override
  String get demoSampleFeedbackBody =>
      'نموذج طلب الإجازة الجديد أوضح. سيكون من المفيد عرض رصيد كل نوع إجازة في نفس الشاشة.';

  @override
  String get demoLoginHint => 'تجريبي: demo@aoun.app · password12';

  @override
  String get demoOtpHint => 'تجريبي: استخدم الرمز 123456';
}
