enum ApprovalType { leave, exemption }

class ApprovalItem {
  const ApprovalItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
    this.titleAr,
    this.subtitleAr,
  });

  final String id;
  final String title;
  final String subtitle;
  final ApprovalType type;
  final String? titleAr;
  final String? subtitleAr;

  String localizedTitle(bool isAr) =>
      isAr && titleAr != null && titleAr!.isNotEmpty ? titleAr! : title;

  String localizedSubtitle(bool isAr) =>
      isAr && subtitleAr != null && subtitleAr!.isNotEmpty ? subtitleAr! : subtitle;
}
