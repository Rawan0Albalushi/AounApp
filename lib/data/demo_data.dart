import '../models/announcement_item.dart';
import '../models/approval_item.dart';
import '../models/demo_notification.dart';
import '../models/demo_task_item.dart';
import '../models/report_item.dart';

/// Central mock data so every screen can be explored end-to-end.
abstract final class DemoData {
  static const int leaveBalanceDays = 14;

  static List<ReportItem> attendanceReports = [
    const ReportItem(
      title: 'Wed, Apr 2 · Check-in',
      subtitle: 'On time · Riyadh HQ · Biometric',
      dateLabel: '08:01',
      titleAr: 'الأربعاء ٢ أبريل · تسجيل دخول',
      subtitleAr: 'في الوقت · الرياض المقر · بصمة',
      dateLabelAr: '٠٨:٠١',
    ),
    const ReportItem(
      title: 'Tue, Apr 1 · Check-out',
      subtitle: 'On time · Remote day',
      dateLabel: '17:12',
      titleAr: 'الثلاثاء ١ أبريل · تسجيل خروج',
      subtitleAr: 'في الوقت · يوم عن بُعد',
      dateLabelAr: '١٧:١٢',
    ),
    const ReportItem(
      title: 'Mon, Mar 31 · Check-in',
      subtitle: 'Late 12 min · Traffic (noted)',
      dateLabel: '08:42',
      titleAr: 'الإثنين ٣١ مارس · تسجيل دخول',
      subtitleAr: 'تأخير ١٢ دقيقة · ازدحام (مسجّل)',
      dateLabelAr: '٠٨:٤٢',
    ),
    const ReportItem(
      title: 'Mon, Mar 31 · Check-out',
      subtitle: 'Early exit · Doctor appointment',
      dateLabel: '15:35',
      titleAr: 'الإثنين ٣١ مارس · تسجيل خروج',
      subtitleAr: 'خروج مبكر · موعد طبيب',
      dateLabelAr: '١٥:٣٥',
    ),
    const ReportItem(
      title: 'Sun, Mar 30 · Weekend duty',
      subtitle: 'Overtime approved · Branch B',
      dateLabel: '09:00 – 14:00',
      titleAr: 'الأحد ٣٠ مارس · عمل نهاية أسبوع',
      subtitleAr: 'عمل إضافي معتمد · الفرع ب',
      dateLabelAr: '٠٩:٠٠ – ١٤:٠٠',
    ),
    const ReportItem(
      title: 'Thu, Mar 27 · Missing punch',
      subtitle: 'Corrected after ticket #4821',
      dateLabel: 'Resolved',
      titleAr: 'الخميس ٢٧ مارس · بصمة ناقصة',
      subtitleAr: 'تم التصحيح بعد التذكرة ٤٨٢١',
      dateLabelAr: 'تم الحل',
    ),
  ];

  static List<ReportItem> salaryTransfers = [
    const ReportItem(
      title: 'April 2026 payroll',
      subtitle: 'Status: Posted · Al Rajhi ****4521',
      dateLabel: '2026-04-28',
      titleAr: 'راتب أبريل ٢٠٢٦',
      subtitleAr: 'الحالة: مرحّل · الراجحي ****٤٥٢١',
      dateLabelAr: '٢٠٢٦-٠٤-٢٨',
    ),
    const ReportItem(
      title: 'March 2026 payroll',
      subtitle: 'Status: Completed · Al Rajhi ****4521',
      dateLabel: '2026-03-26',
      titleAr: 'راتب مارس ٢٠٢٦',
      subtitleAr: 'الحالة: مكتمل · الراجحي ****٤٥٢١',
      dateLabelAr: '٢٠٢٦-٠٣-٢٦',
    ),
    const ReportItem(
      title: 'February 2026 payroll',
      subtitle: 'Status: Completed · Al Rajhi ****4521',
      dateLabel: '2026-02-26',
      titleAr: 'راتب فبراير ٢٠٢٦',
      subtitleAr: 'الحالة: مكتمل · الراجحي ****٤٥٢١',
      dateLabelAr: '٢٠٢٦-٠٢-٢٦',
    ),
    const ReportItem(
      title: 'January 2026 bonus',
      subtitle: 'Performance bonus · Same account',
      dateLabel: '2026-01-30',
      titleAr: 'مكافأة يناير ٢٠٢٦',
      subtitleAr: 'مكافأة أداء · نفس الحساب',
      dateLabelAr: '٢٠٢٦-٠١-٣٠',
    ),
  ];

  static List<ReportItem> leaveStatusReports = [
    const ReportItem(
      title: 'Annual leave (approved)',
      subtitle: '5 working days · Manager: F. Alotaibi',
      dateLabel: '2026-04-10 → 2026-04-16',
      titleAr: 'إجازة سنوية (معتمدة)',
      subtitleAr: '٥ أيام عمل · المدير: ف. العتيبي',
      dateLabelAr: '٢٠٢٦-٠٤-١٠ ← ٢٠٢٦-٠٤-١٦',
    ),
    const ReportItem(
      title: 'Sick leave (approved)',
      subtitle: '1 day · Medical note attached',
      dateLabel: '2026-03-18',
      titleAr: 'إجازة مرضية (معتمدة)',
      subtitleAr: 'يوم واحد · مرفق تقرير طبي',
      dateLabelAr: '٢٠٢٦-٠٣-١٨',
    ),
    const ReportItem(
      title: 'Annual leave (pending)',
      subtitle: 'Awaiting HR · 3 days requested',
      dateLabel: '2026-05-01 → 2026-05-05',
      titleAr: 'إجازة سنوية (قيد الانتظار)',
      subtitleAr: 'بانتظار الموارد البشرية · طُلبت ٣ أيام',
      dateLabelAr: '٢٠٢٦-٠٥-٠١ ← ٢٠٢٦-٠٥-٠٥',
    ),
    const ReportItem(
      title: 'Unpaid leave (rejected)',
      subtitle: 'Overlap with critical project',
      dateLabel: '2026-02-02',
      titleAr: 'إجازة بدون راتب (مرفوضة)',
      subtitleAr: 'تداخل مع مشروع حرج',
      dateLabelAr: '٢٠٢٦-٠٢-٠٢',
    ),
    const ReportItem(
      title: 'Emergency leave (approved)',
      subtitle: 'Same-day approval',
      dateLabel: '2026-01-08',
      titleAr: 'إجازة طارئة (معتمدة)',
      subtitleAr: 'اعتماد في نفس اليوم',
      dateLabelAr: '٢٠٢٦-٠١-٠٨',
    ),
  ];

  /// Tasks shown on the task list screen (demo). [DemoTaskItem.referenceDate] drives the date filter.
  static final List<DemoTaskItem> taskListEntries = [
    DemoTaskItem(
      item: const ReportItem(
        title: 'Q2 policy review',
        subtitle: 'Assigned to you · High priority',
        dateLabel: 'Due Apr 18',
        titleAr: 'مراجعة سياسة الربع الثاني',
        subtitleAr: 'مُعيّنة لك · أولوية عالية',
        dateLabelAr: 'مستحق ١٨ أبريل',
      ),
      referenceDate: DateTime(2026, 4, 18),
    ),
    DemoTaskItem(
      item: const ReportItem(
        title: 'Onboarding checklist — Dana',
        subtitle: 'You created · Medium',
        dateLabel: 'Due Apr 22',
        titleAr: 'قائمة تهيئة — دانة',
        subtitleAr: 'أنشأتها أنت · متوسطة',
        dateLabelAr: 'مستحق ٢٢ أبريل',
      ),
      referenceDate: DateTime(2026, 4, 22),
    ),
    DemoTaskItem(
      item: const ReportItem(
        title: 'Update org chart slide',
        subtitle: 'Assigned to Omar Nasser · Low',
        dateLabel: 'Completed Apr 4',
        titleAr: 'تحديث شريحة الهيكل التنظيمي',
        subtitleAr: 'معيّنة لعمر ناصر · منخفضة',
        dateLabelAr: 'مكتمل ٤ أبريل',
      ),
      referenceDate: DateTime(2026, 4, 4),
    ),
    DemoTaskItem(
      item: const ReportItem(
        title: 'HR portal access review',
        subtitle: 'Pending approval · IT',
        dateLabel: 'Opened Apr 8',
        titleAr: 'مراجعة صلاحيات بوابة الموارد البشرية',
        subtitleAr: 'بانتظار الاعتماد · تقنية',
        dateLabelAr: 'مفتوحة ٨ أبريل',
      ),
      referenceDate: DateTime(2026, 4, 8),
    ),
  ];

  static List<ReportItem> serviceStatusReports = [
    const ReportItem(
      title: 'Experience letter (completed)',
      subtitle: 'Digital copy · HR inbox',
      dateLabel: '2026-04-02',
      titleAr: 'خطاب خبرة (مكتمل)',
      subtitleAr: 'نسخة رقمية · بريد الموارد البشرية',
      dateLabelAr: '٢٠٢٦-٠٤-٠٢',
    ),
    const ReportItem(
      title: 'Salary certificate (in progress)',
      subtitle: 'Requested for bank · Case #SR-1042',
      dateLabel: 'Due 2026-04-12',
      titleAr: 'شهادة راتب (قيد التنفيذ)',
      subtitleAr: 'مطلوبة للبنك · الحالة ‎#SR-1042',
      dateLabelAr: 'مستحق ٢٠٢٦-٠٤-١٢',
    ),
    const ReportItem(
      title: 'To-whom-it-may-concern (approved)',
      subtitle: 'English · Pickup at reception',
      dateLabel: '2026-03-20',
      titleAr: 'إلى من يهمه الأمر (معتمد)',
      subtitleAr: 'بالإنجليزية · الاستلام من الاستقبال',
      dateLabelAr: '٢٠٢٦-٠٣-٢٠',
    ),
    const ReportItem(
      title: 'No-objection letter (rejected)',
      subtitle: 'Incomplete sponsor details',
      dateLabel: '2026-02-05',
      titleAr: 'خطاب عدم ممانعة (مرفوض)',
      subtitleAr: 'بيانات الكفيل غير مكتملة',
      dateLabelAr: '٢٠٢٦-٠٢-٠٥',
    ),
  ];

  static List<ReportItem> payslips = [
    const ReportItem(
      title: 'Payslip · April 2026',
      subtitle: 'Net SAR 18,240 · Allowances + overtime',
      dateLabel: 'Issued 2026-04-28',
      titleAr: 'كشف راتب · أبريل ٢٠٢٦',
      subtitleAr: 'صافي ١٨٬٢٤٠ ر.س · بدلات + عمل إضافي',
      dateLabelAr: 'صدر في ٢٠٢٦-٠٤-٢٨',
    ),
    const ReportItem(
      title: 'Payslip · March 2026',
      subtitle: 'Net SAR 17,900',
      dateLabel: 'Issued 2026-03-26',
      titleAr: 'كشف راتب · مارس ٢٠٢٦',
      subtitleAr: 'صافي ١٧٬٩٠٠ ر.س',
      dateLabelAr: 'صدر في ٢٠٢٦-٠٣-٢٦',
    ),
    const ReportItem(
      title: 'Payslip · February 2026',
      subtitle: 'Net SAR 17,900',
      dateLabel: 'Issued 2026-02-26',
      titleAr: 'كشف راتب · فبراير ٢٠٢٦',
      subtitleAr: 'صافي ١٧٬٩٠٠ ر.س',
      dateLabelAr: 'صدر في ٢٠٢٦-٠٢-٢٦',
    ),
    const ReportItem(
      title: 'Payslip · January 2026',
      subtitle: 'Net SAR 17,650 · Mid-year adjustment',
      dateLabel: 'Issued 2026-01-28',
      titleAr: 'كشف راتب · يناير ٢٠٢٦',
      subtitleAr: 'صافي ١٧٬٦٥٠ ر.س · تسوية منتصف العام',
      dateLabelAr: 'صدر في ٢٠٢٦-٠١-٢٨',
    ),
    const ReportItem(
      title: 'Year-end statement 2025',
      subtitle: 'Tax summary · Download PDF bundle',
      dateLabel: '2026-01-15',
      titleAr: 'كشف نهاية العام ٢٠٢٥',
      subtitleAr: 'ملخص ضريبي · حزمة PDF',
      dateLabelAr: '٢٠٢٦-٠١-١٥',
    ),
  ];

  static List<ApprovalItem> pendingLeaves = [
    const ApprovalItem(
      id: 'L-2401',
      title: 'Annual leave · Sara Al-Harbi',
      subtitle: 'Apr 20–24 · 5 days · Balance OK',
      type: ApprovalType.leave,
      titleAr: 'إجازة سنوية · سارة الحربي',
      subtitleAr: '٢٠–٢٤ أبريل · ٥ أيام · الرصيد كافٍ',
    ),
    const ApprovalItem(
      id: 'L-2402',
      title: 'Sick leave · Omar Nasser',
      subtitle: 'Apr 8 · Attachment: clinic.pdf',
      type: ApprovalType.leave,
      titleAr: 'إجازة مرضية · عمر ناصر',
      subtitleAr: '٨ أبريل · مرفق: clinic.pdf',
    ),
    const ApprovalItem(
      id: 'L-2403',
      title: 'Unpaid leave · Layla F.',
      subtitle: 'May 1–10 · Personal travel',
      type: ApprovalType.leave,
      titleAr: 'إجازة بدون راتب · ليلى ف.',
      subtitleAr: '١–١٠ مايو · سفر شخصي',
    ),
    const ApprovalItem(
      id: 'L-2399',
      title: 'Emergency leave · Khalid M.',
      subtitle: 'Mar 30 · Family matter',
      type: ApprovalType.leave,
      titleAr: 'إجازة طارئة · خالد م.',
      subtitleAr: '٣٠ مارس · ظرف عائلي',
    ),
  ];

  static List<ApprovalItem> pendingExemptions = [
    const ApprovalItem(
      id: 'E-882',
      title: 'Late arrival · Khalid Mansour',
      subtitle: 'Mar 24 · Highway closure',
      type: ApprovalType.exemption,
      titleAr: 'تأخير حضور · خالد منصور',
      subtitleAr: '٢٤ مارس · إغلاق الطريق',
    ),
    const ApprovalItem(
      id: 'E-883',
      title: 'Early departure · Dana S.',
      subtitle: 'Mar 22 · School event',
      type: ApprovalType.exemption,
      titleAr: 'خروج مبكر · دانة س.',
      subtitleAr: '٢٢ مارس · فعالية مدرسية',
    ),
    const ApprovalItem(
      id: 'E-884',
      title: 'Remote work exception · IT rotation',
      subtitle: 'Mar 19 · Full day',
      type: ApprovalType.exemption,
      titleAr: 'استثناء عمل عن بُعد · دورة تقنية',
      subtitleAr: '١٩ مارس · يوم كامل',
    ),
    const ApprovalItem(
      id: 'E-885',
      title: 'Missed fingerprint · Lobby access',
      subtitle: 'Mar 17 · Security verified',
      type: ApprovalType.exemption,
      titleAr: 'بصمة فائتة · دخول الردهة',
      subtitleAr: '١٧ مارس · تأكيد أمني',
    ),
  ];

  static List<AnnouncementItem> announcements = [
    const AnnouncementItem(
      id: 'A1',
      title: 'Ramadan working hours 2026',
      titleAr: 'ساعات عمل رمضان ٢٠٢٦',
      subtitle: 'HR · Effective Apr 1',
      subtitleAr: 'الموارد البشرية · ساري من ١ أبريل',
      bodyEn:
          'During Ramadan, core hours are 10:00–15:00 with flexible start. '
          'Managers may approve staggered shifts for customer-facing teams.',
      bodyAr:
          'خلال رمضان تكون الساعات الأساسية من 10:00 إلى 15:00 مع مرونة في بداية الدوام. '
          'يحق للمديرين اعتماد ورديات متدرجة للفرق التي تخدم العملاء.',
      author: 'HR Operations',
      authorAr: 'عمليات الموارد البشرية',
      publishedAt: '2026-03-28',
    ),
    const AnnouncementItem(
      id: 'A2',
      title: 'New self-service: “We Listen”',
      titleAr: 'خدمة جديدة: «نستمع إليك»',
      subtitle: 'Product · Feedback channel',
      subtitleAr: 'المنتج · قناة الملاحظات',
      bodyEn:
          'You can now submit anonymous or named feedback with category and priority. '
          'Leadership reviews all high-priority items weekly.',
      bodyAr:
          'يمكنكم الآن إرسال ملاحظات باسمكم أو بشكل مجهول مع تصنيف وأولوية. '
          'تعرض الإدارة عناصر الأولوية العالية أسبوعياً.',
      author: 'Employee Experience',
      authorAr: 'تجربة الموظف',
      publishedAt: '2026-03-20',
    ),
    const AnnouncementItem(
      id: 'A3',
      title: 'Parking zone B maintenance',
      titleAr: 'صيانة موقف المنطقة ب',
      subtitle: 'Facilities · One week',
      subtitleAr: 'المرافق · أسبوع واحد',
      bodyEn:
          'Levels B2–B3 will be resurfaced Apr 6–12. Please use zone C or street parking vouchers.',
      bodyAr:
          'سيتم صيانة الطبقتين B2 وB3 خلال 6–12 أبريل. يرجى استخدام موقف C أو قسائم الشارع.',
      author: 'Facilities',
      authorAr: 'المرافق',
      publishedAt: '2026-03-15',
    ),
    const AnnouncementItem(
      id: 'A4',
      title: 'Mandatory cybersecurity refresher',
      titleAr: 'تدريب إلزامي للأمن السيبراني',
      subtitle: 'IT · Due Apr 30',
      subtitleAr: 'تقنية المعلومات · استحقاق ٣٠ أبريل',
      bodyEn:
          'Complete the 15-minute module in the LMS. Non-completion may suspend VPN access.',
      bodyAr:
          'أكملوا الوحدة (15 دقيقة) في نظام التعلم. قد يُعلّق الوصول لشبكة VPN عند عدم الإكمال.',
      author: 'Information Security',
      authorAr: 'الأمن المعلوماتي',
      publishedAt: '2026-03-10',
    ),
  ];

  static List<DemoNotification> notifications = [
    const DemoNotification(
      title: 'Leave request approved',
      body: 'Your annual leave Apr 10–16 was approved by HR.',
      timeLabel: '2h ago',
      titleAr: 'تم اعتماد طلب الإجازة',
      bodyAr: 'تم اعتماد إجازتك السنوية ١٠–١٦ أبريل من الموارد البشرية.',
      timeLabelAr: 'منذ ساعتين',
      kind: DemoNotificationKind.leave,
    ),
    const DemoNotification(
      title: 'Payslip ready',
      body: 'March payslip is available under Services → Payslip.',
      timeLabel: 'Yesterday',
      titleAr: 'كشف الراتب جاهز',
      bodyAr: 'كشف مارس متاح ضمن الخدمات ← كشف الراتب.',
      timeLabelAr: 'أمس',
      kind: DemoNotificationKind.finance,
    ),
    const DemoNotification(
      title: 'New task assigned',
      body: '“Q2 policy review” — due Apr 18. Open Tasks to view.',
      timeLabel: 'Yesterday',
      titleAr: 'مهمة جديدة',
      bodyAr:
          '«مراجعة سياسة الربع الثاني» — استحقاق ١٨ أبريل. افتح المهام للعرض.',
      timeLabelAr: 'أمس',
      isUnread: false,
      kind: DemoNotificationKind.task,
    ),
    const DemoNotification(
      title: 'Attendance note',
      body: 'Missing punch on Mar 27 was corrected. No action needed.',
      timeLabel: 'Mar 28',
      titleAr: 'ملاحظة حضور',
      bodyAr: 'تم تصحيح بصمة ٢٧ مارس. لا يلزم إجراء.',
      timeLabelAr: '٢٨ مارس',
      isUnread: false,
      kind: DemoNotificationKind.attendance,
    ),
    const DemoNotification(
      title: 'Announcement',
      body: 'Ramadan working hours — see latest post in Announcements.',
      timeLabel: 'Mar 28',
      titleAr: 'إعلان',
      bodyAr: 'ساعات رمضان — راجع أحدث منشور في الإعلانات.',
      timeLabelAr: '٢٨ مارس',
      kind: DemoNotificationKind.announcement,
    ),
  ];

  /// Task assignees for dropdowns (id, nameEn, nameAr, deptEn, deptAr).
  static const List<
    (String id, String nameEn, String nameAr, String deptEn, String deptAr)
  >
  employees = [
    ('e1', 'Sara Al-Harbi', 'سارة الحربي', 'HR', 'الموارد البشرية'),
    ('e2', 'Omar Nasser', 'عمر ناصر', 'IT', 'تقنية المعلومات'),
    ('e3', 'Layla Fahad', 'ليلى فهد', 'Finance', 'المالية'),
    ('e4', 'Khalid Mansour', 'خالد منصور', 'Operations', 'العمليات'),
    ('e5', 'Dana Alsubaie', 'دانة السبيعي', 'Legal', 'الشؤون القانونية'),
  ];

  static const List<(String value, String labelEn, String labelAr)> leaveTypes =
      [
        ('annual', 'Annual leave', 'إجازة سنوية'),
        ('sick', 'Sick leave', 'إجازة مرضية'),
        ('unpaid', 'Unpaid leave', 'إجازة بدون راتب'),
        ('emergency', 'Emergency leave', 'إجازة طارئة'),
        ('study', 'Study leave', 'إجازة دراسية'),
      ];

  static const List<(String value, String labelEn, String labelAr)>
  serviceTypes = [
    ('letter', 'HR letter / certificate', 'خطاب / شهادة موارد بشرية'),
    ('id', 'ID card renewal', 'تجديد بطاقة'),
    ('bank', 'Bank letter', 'خطاب بنك'),
    ('salary', 'Salary certificate', 'شهادة راتب'),
  ];

  static const List<(String value, String labelEn, String labelAr)>
  deliveryMethods = [
    ('pickup', 'Pickup from HR', 'استلام من الموارد البشرية'),
    ('mail', 'Internal mail', 'بريد داخلي'),
    ('email', 'Secure email (PDF)', 'بريد إلكتروني آمن (PDF)'),
  ];

  static const List<(String value, String labelEn, String labelAr)>
  feedbackCategories = [
    ('workplace', 'Workplace & facilities', 'مكان العمل والمرافق'),
    ('policy', 'Policies & processes', 'السياسات والإجراءات'),
    ('manager', 'Manager relations', 'العلاقة مع المدير'),
    ('wellbeing', 'Wellbeing', 'الرفاهية'),
    ('other', 'Other', 'أخرى'),
  ];
}
