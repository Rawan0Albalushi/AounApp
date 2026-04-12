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

  /// When the title follows `Category · Person`, returns both parts; otherwise null.
  (String category, String person)? splitTitleParts(bool isAr) {
    final t = localizedTitle(isAr);
    const sep = ' · ';
    final i = t.indexOf(sep);
    if (i <= 0) return null;
    final left = t.substring(0, i).trim();
    final right = t.substring(i + sep.length).trim();
    if (left.isEmpty || right.isEmpty) return null;
    return (left, right);
  }
}
