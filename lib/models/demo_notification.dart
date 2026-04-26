enum DemoNotificationKind { leave, finance, task, attendance, announcement }

class DemoNotification {
  const DemoNotification({
    required this.title,
    required this.body,
    required this.timeLabel,
    this.titleAr,
    this.bodyAr,
    this.timeLabelAr,
    this.isUnread = true,
    this.kind = DemoNotificationKind.announcement,
  });

  final String title;
  final String body;
  final String timeLabel;
  final String? titleAr;
  final String? bodyAr;
  final String? timeLabelAr;
  final bool isUnread;
  final DemoNotificationKind kind;

  String localizedTitle(bool isAr) =>
      isAr && titleAr != null && titleAr!.isNotEmpty ? titleAr! : title;

  String localizedBody(bool isAr) =>
      isAr && bodyAr != null && bodyAr!.isNotEmpty ? bodyAr! : body;

  String localizedTimeLabel(bool isAr) =>
      isAr && timeLabelAr != null && timeLabelAr!.isNotEmpty
      ? timeLabelAr!
      : timeLabel;
}
