import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

/// Soft page background aligned with app theme ([AppColors.surfaceLight]).
class AppShellBackdrop extends StatelessWidget {
  const AppShellBackdrop({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: AppColors.surfaceLight),
        child,
      ],
    );
  }
}
