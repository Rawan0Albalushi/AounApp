class ReportItem {
  const ReportItem({
    required this.title,
    required this.subtitle,
    required this.dateLabel,
    this.titleAr,
    this.subtitleAr,
    this.dateLabelAr,
  });

  final String title;
  final String subtitle;
  final String dateLabel;
  final String? titleAr;
  final String? subtitleAr;
  final String? dateLabelAr;

  String localizedTitle(bool isAr) =>
      isAr && titleAr != null && titleAr!.isNotEmpty ? titleAr! : title;

  String localizedSubtitle(bool isAr) =>
      isAr && subtitleAr != null && subtitleAr!.isNotEmpty
      ? subtitleAr!
      : subtitle;

  String localizedDateLabel(bool isAr) =>
      isAr && dateLabelAr != null && dateLabelAr!.isNotEmpty
      ? dateLabelAr!
      : dateLabel;
}
