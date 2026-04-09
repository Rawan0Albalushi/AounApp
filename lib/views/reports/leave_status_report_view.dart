import 'package:flutter/material.dart';

import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import 'report_list_page.dart';

class LeaveStatusReportView extends StatelessWidget {
  const LeaveStatusReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ReportListPage(
      title: l10n.reportLeaveStatus,
      items: DemoData.leaveStatusReports,
      emptyIcon: Icons.beach_access_outlined,
    );
  }
}
