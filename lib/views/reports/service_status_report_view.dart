import 'package:flutter/material.dart';

import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import 'report_list_page.dart';

class ServiceStatusReportView extends StatelessWidget {
  const ServiceStatusReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ReportListPage(
      title: l10n.reportServiceStatus,
      items: DemoData.serviceStatusReports,
      emptyIcon: Icons.miscellaneous_services_outlined,
    );
  }
}
