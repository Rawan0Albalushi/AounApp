import 'package:flutter/material.dart';

import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import 'report_list_page.dart';

class AttendanceReportView extends StatelessWidget {
  const AttendanceReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ReportListPage(
      title: l10n.reportAttendance,
      items: DemoData.attendanceReports,
      emptyIcon: Icons.calendar_month_outlined,
    );
  }
}
