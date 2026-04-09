import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/theme/app_colors.dart';

/// Bottom corner radius aligned with [DashboardView] `_HomeHeader`.
const double kCorporateAppBarBottomRadius = 34;

/// Navy gradient AppBar (Al Ghalbi corporate header).
PreferredSizeWidget buildCorporateAppBar(
  BuildContext context, {
  String? title,
  List<Widget>? actions,
  PreferredSizeWidget? bottom,
  Widget? leading,
  bool automaticallyImplyLeading = true,
}) {
  final theme = Theme.of(context);
  const gradientColors = [
    AppColors.navy,
    AppColors.navyGradientEnd,
    Color(0xFF455A94),
  ];

  const bottomBarRadius = BorderRadius.vertical(
    bottom: Radius.circular(kCorporateAppBarBottomRadius),
  );

  return AppBar(
    automaticallyImplyLeading: automaticallyImplyLeading,
    leading: leading,
    title: title != null ? Text(title) : null,
    actions: actions,
    bottom: bottom,
    shape: RoundedRectangleBorder(borderRadius: bottomBarRadius),
    clipBehavior: Clip.antiAlias,
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white),
    actionsIconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle.light,
    titleTextStyle: theme.textTheme.titleLarge?.copyWith(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    flexibleSpace: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: bottomBarRadius,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
          stops: [0, 0.6, 1],
        ),
      ),
      child: const SizedBox.expand(),
    ),
  );
}
