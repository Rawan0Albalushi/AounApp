/// Demo / future API model for HR announcements.
class AnnouncementItem {
  const AnnouncementItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.bodyEn,
    required this.bodyAr,
    required this.author,
    required this.publishedAt,
    this.titleAr,
    this.subtitleAr,
    this.authorAr,
  });

  final String id;
  final String title;
  final String subtitle;
  final String bodyEn;
  final String bodyAr;
  final String author;
  final String? authorAr;
  final String publishedAt;
  final String? titleAr;
  final String? subtitleAr;

  String localizedTitle(bool isAr) =>
      isAr && titleAr != null && titleAr!.isNotEmpty ? titleAr! : title;

  String localizedSubtitle(bool isAr) =>
      isAr && subtitleAr != null && subtitleAr!.isNotEmpty ? subtitleAr! : subtitle;

  String localizedAuthor(bool isAr) =>
      isAr && authorAr != null && authorAr!.isNotEmpty ? authorAr! : author;
}
