import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

enum StatusKind { completed, pending, earlyExit, approved, rejected }

class StatusTag extends StatelessWidget {
  const StatusTag({super.key, required this.label, required this.kind});

  final String label;
  final StatusKind kind;

  (Color fg, Color bg) _colors() {
    switch (kind) {
      case StatusKind.completed:
      case StatusKind.approved:
        return (AppColors.statusApprovedFg, AppColors.statusApprovedBg);
      case StatusKind.pending:
        return (AppColors.statusPendingFg, AppColors.statusPendingBg);
      case StatusKind.rejected:
        return (AppColors.statusRejectedFg, AppColors.statusRejectedBg);
      case StatusKind.earlyExit:
        return (const Color(0xFFE65100), const Color(0xFFFFF3E0));
    }
  }

  @override
  Widget build(BuildContext context) {
    final (fg, bg) = _colors();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: fg.withValues(alpha: 0.25)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: fg,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}
