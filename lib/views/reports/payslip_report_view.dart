import 'package:flutter/material.dart';

import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import 'report_list_page.dart';

class PayslipReportView extends StatelessWidget {
  const PayslipReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ReportListPage(
      title: l10n.reportPayslip,
      items: DemoData.payslips,
      emptyIcon: Icons.receipt_long_outlined,
    );
  }
}
