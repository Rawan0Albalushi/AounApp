import 'report_item.dart';

/// Demo task row with a calendar date used for the task list date filter.
class DemoTaskItem {
  const DemoTaskItem({
    required this.item,
    required this.referenceDate,
  });

  final ReportItem item;
  final DateTime referenceDate;
}
