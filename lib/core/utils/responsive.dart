import 'package:flutter/material.dart';

/// Breakpoints for mobile / tablet / desktop web.
abstract final class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
}

/// Returns column count for service grids and similar layouts.
int gridColumnCount(BuildContext context) {
  final w = MediaQuery.sizeOf(context).width;
  if (w >= Breakpoints.desktop) return 4;
  if (w >= Breakpoints.tablet) return 3;
  if (w >= Breakpoints.mobile) return 2;
  return 2;
}

/// Max content width on large screens (centered column).
double contentMaxWidth(BuildContext context) {
  final w = MediaQuery.sizeOf(context).width;
  if (w >= Breakpoints.desktop) return 1100;
  if (w >= Breakpoints.tablet) return 800;
  return double.infinity;
}

EdgeInsets pagePadding(BuildContext context) {
  final w = MediaQuery.sizeOf(context).width;
  final horizontal = w >= Breakpoints.tablet ? 32.0 : 20.0;
  return EdgeInsets.symmetric(horizontal: horizontal, vertical: 16);
}

bool isWideLayout(BuildContext context) {
  return MediaQuery.sizeOf(context).width >= Breakpoints.tablet;
}

/// Extra scroll padding so lists clear [MainShell]’s floating bottom nav pill.
const double mainShellFloatingNavBottomPadding = 76;
