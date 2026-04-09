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
  String get notificationsEmpty => 'لا إشعارات بعد';

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
  String get profileSubtitle => 'هويتك في العمل وبيانات التواصل.';

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
  String get reportServiceStatus => 'حالة الخدمة';

  @override
  String get reportPayslip => 'كشف الراتب';

  @override
  String get dateRange => 'الفترة الزمنية';

  @override
  String get reportsListSubtitle => 'صفِّ حسب الفترة واطلع على السجلات.';

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
  String get leaveRequestSubtitle => 'خطط لإجازتك مع رصيدك أمامك.';

  @override
  String get leaveRequestIntro =>
      'اختر نوع الإجازة والتواريخ، وأرفق المستندات عند الحاجة، ثم أرسل للاعتماد.';

  @override
  String get leaveRequestSubmitSuccess => 'تم إرسال طلب الإجازة.';

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
  String get createTaskSubtitle => 'عيّن العمل بأولوية واضحة وسياق كافٍ.';

  @override
  String get createTaskIntro => 'اختر زميلًا، وصف المطلوب، وحدد الأولوية.';

  @override
  String get createTaskSubmitSuccess => 'تم إنشاء المهمة.';

  @override
  String get assignTo => 'تعيين لموظف';

  @override
  String get taskDetails => 'تفاصيل المهمة';

  @override
  String get taskListHeroSubtitle =>
      'اطلع على المهام المعيّنة لك والتي أنشأتها.';

  @override
  String get taskListCreateNew => 'إنشاء مهمة جديدة';

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
  String get serviceRequestSubtitle => 'خطابات، شهادات، ومستندات عمل رسمية.';

  @override
  String get serviceRequestIntro =>
      'اختر نوع الخدمة وطريقة التسليم، ثم اذكر التفاصيل ليتمكن فريق الموارد البشرية من تجهيز طلبك دون تأخير.';

  @override
  String get serviceRequestDetails => 'التفاصيل';

  @override
  String get serviceRequestDetailsHint =>
      'الغرض، الصياغة، عدد النسخ، أو أي تعليمات أخرى';

  @override
  String get serviceRequestNeededBy => 'مطلوب بحلول';

  @override
  String get serviceRequestSubmitSuccess => 'تم إرسال طلب الخدمة.';

  @override
  String get serviceType => 'نوع الخدمة';

  @override
  String get deliveryMethod => 'طريقة التسليم';

  @override
  String get weListenTitle => 'نستمع إليك';

  @override
  String get weListenSubtitle => 'أفكار أو ملاحظات أو شكر — نقرأ كل طلب.';

  @override
  String get weListenIntro =>
      'ملاحظاتك تساعدنا على تحسين عون وخدمات العمل. اختر التصنيف والأولوية، ثم اكتب رسالتك.';

  @override
  String get weListenSubmitSuccess => 'شكرًا لك. تم إرسال ملاحظاتك.';

  @override
  String get feedbackCategory => 'التصنيف';

  @override
  String get feedbackMessage => 'رسالتك';

  @override
  String get feedbackMessageHint => 'ما الذي تود إبلاغنا به؟';

  @override
  String get managerialTitle => 'الاعتمادات';

  @override
  String get managerialSubtitle => 'راجع طلبات الإجازة والحضور المعلقة.';

  @override
  String get tabLeaves => 'الإجازات';

  @override
  String get tabAttendanceExemptions => 'استثناءات الحضور';

  @override
  String get announcementsTitle => 'الإعلانات';

  @override
  String get announcementsSubtitle => 'أخبار وتحديثات الشركة لفريقك.';

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
  String get createAnnouncementSubtitle => 'انشر تحديثات بلغتين لجهة عملك.';

  @override
  String get createAnnouncementIntro =>
      'أكمل النص بالعربية والإنجليزية ليقرأ الجميع الرسالة بوضوح.';

  @override
  String get createAnnouncementSubmitSuccess => 'تم نشر الإعلان.';

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
  String get approvalDetailSubtitle => 'راجع الطلب واختر الإجراء المناسب.';

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
  String get validationPasswordSameAsCurrent =>
      'يجب أن تختلف كلمة المرور الجديدة عن الحالية';

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
  String get aboutUsSubtitle => 'قصة المنتج، الرسالة، وكيفية طلب المساعدة.';

  @override
  String get settingsTermsOfService => 'اتفاقية شروط الخدمة';

  @override
  String get termsOfServiceSubtitle =>
      'يرجى قراءة هذه الشروط قبل استخدام التطبيق.';

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
  String get aboutUsIntro =>
      '«عون» بمعنى الدعم — وهذا ما نسعى إليه: مكان واحد هادئ ومركّز لما تحتاجه يوميًا في العمل، من الحضور والإجازات إلى الرواتب والخدمات والملاحظات.';

  @override
  String get aboutUsWhoWeAreTitle => 'نبذة عن عون';

  @override
  String get aboutUsWhoWeAreBody =>
      'عون تطبيق لتجربة الموظف يجمع مسارات الموارد البشرية والخدمات في تجربة جوال واحدة. بدل تعدد الأدوات أو غموض الحالة، تحصل على لوحة منظمة، وسوم حالة واضحة، وتدفقات مبنية على مهام حقيقية: متابعة الحضور، متابعة الإجازات، قراءة الإعلانات، ورفع ما يحتاج متابعة عند الاقتضاء.';

  @override
  String get aboutUsMissionTitle => 'رسالتنا';

  @override
  String get aboutUsMissionBody =>
      'نريد تقليل الفجوة بينك وبين أنظمة جهة عملك — خطوات أقل، غموض أقل، وإجابات أسرع على «ما حالتي؟» و«ما المطلوب مني الآن؟». التطبيق مُصمّم للاستخدام اليومي: خط واضح، خيارات معقولة، وتنقّل لا يعيقك.';

  @override
  String get aboutUsVisionTitle => 'رؤيتنا';

  @override
  String get aboutUsVisionBody =>
      'مكان عمل يستطيع فيه كل موظف — بغض النظر عن الدور أو الموقع — أن يرى ما يهمّه، يتصرّف بخطوات قليلة، ويطمئن أن المعلومات معروضة بوضوح بالعربية والإنجليزية، مع دعم صحيح للاتجاهين من اليمين لليسار ومن اليسار لليمين.';

  @override
  String get aboutUsOfferTitle => 'ماذا يوفّر لك التطبيق';

  @override
  String get aboutUsOfferBody =>
      '• متابعة الحضور والإجازات وحالة الخدمة من تجربة الرئيسية.\n• تقديم طلبات الإجازة والمهام والخدمات عبر نماذج موجّهة.\n• عرض كشف الراتب وحالة تحويل الراتب حيث تفعّلها جهة عملك.\n• قراءة إعلانات الشركة واستخدام «نستمع إليك» لمشاركة ملاحظات منظمة.\n• إن كنت مديرًا، مراجعة اعتمادات الإجازات واستثناءات الحضور في مكان واحد.';

  @override
  String get aboutUsValuesTitle => 'ما يوجّهنا';

  @override
  String get aboutUsValuesBody =>
      'الوضوح لا الزحام: نفضّل التسميات الصادقة وحالات المعروض على الزخرفة بلا فائدة. احترام وقتك: إجراءات أقل للمهام المتكررة. إتاحة الوصول: العربية والإنجليزية على قدم المساواة. الثقة: الأمان والالتزام بالسياسات أصلٌ في التصميم لا خيارًا ثانويًا.';

  @override
  String get aboutUsPrivacyTitle => 'الخصوصية والأمان';

  @override
  String get aboutUsPrivacyBody =>
      'تخزين بياناتك ومعالجتها يخضع لسياسات جهة عملك والأنظمة المعمول بها. احمِ بيانات تسجيل الدخول، واستخدم الأجهزة والشبكات المعتمدة عند الاشتراط، وتواصل مع الموارد البشرية أو تقنية المعلومات عند الشك في وصول غير مصرّح به.';

  @override
  String get aboutUsSupportTitle => 'المساعدة والتواصل';

  @override
  String get aboutUsSupportBody =>
      'لإعادة تعيين كلمة المرور، مشاكل الدخول، صلاحيات الاستحقاق، أو الأعطال، تواصل مع فريق الموارد البشرية أو تقنية المعلومات — هم أصحاب الحسابات والصلاحيات والربط مع الأنظمة الخلفية. يمكن أيضًا إرسال ملاحظات على المنتج عبر «نستمع إليك» عند تفعيلها لدى جهة عملك.';

  @override
  String get aboutUsFooterNote =>
      'هذه الصفحة تصف منتج عون. قد تعرض بعض الشاشات بيانات تجريبية للتوضيح. آخر تحديث: أبريل ٢٠٢٦.';

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
  String get dashboardGridSalaryTransfer => 'حالة\nتحويل الراتب';

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
