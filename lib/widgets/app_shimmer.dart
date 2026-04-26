import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../core/theme/app_colors.dart';

/// Skeleton placeholder while content loads.
class AppShimmer extends StatelessWidget {
  const AppShimmer({
    super.key,
    required this.child,
    this.baseColor,
    this.highlightColor,
  });

  final Widget child;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey.shade300,
      highlightColor: highlightColor ?? Colors.grey.shade100,
      child: child,
    );
  }
}

/// Common card-shaped skeleton line.
class ShimmerLine extends StatelessWidget {
  const ShimmerLine({super.key, this.height = 14, this.width, this.radius = 8});

  final double height;
  final double? width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.charcoal.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
