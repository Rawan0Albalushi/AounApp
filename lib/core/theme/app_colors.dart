import 'package:flutter/material.dart';

/// Al Ghalbi–inspired corporate palette: Navy + Gold.
abstract final class AppColors {
  /// Primary brand navy — AppBars, headers, titles (light mode).
  static const Color navy = Color(0xFF002E5D);

  /// Slightly lighter navy for gradients and depth.
  static const Color navyGradientEnd = Color(0xFF1A4570);

  /// Dark-mode app bar gradient (deeper → brand navy).
  static const Color navyDarkDeep = Color(0xFF001428);

  /// Accent gold — buttons, active indicators, pending status.
  static const Color royalGold = Color(0xFFC5A059);

  /// Dark gold for icons on soft gold circles (~10% opacity backgrounds).
  static const Color goldDark = Color(0xFF8B6914);

  static const Color charcoal = Color(0xFF1A1A1A);
  static const Color goldMuted = Color(0xFFE8D5A3);

  /// Page background — matches home dashboard soft blue-grey.
  static const Color surfaceLight = Color(0xFFF3F6FB);

  static const Color surfaceDark = Color(0xFF121212);
  static const Color cardDark = Color(0xFF242424);

  /// Status: approved / success — dark green on soft green.
  static const Color statusApprovedFg = Color(0xFF1B5E20);
  static const Color statusApprovedBg = Color(0xFFE8F5E9);

  /// Status: rejected — calm red.
  static const Color statusRejectedFg = Color(0xFFC62828);
  static const Color statusRejectedBg = Color(0xFFFFEBEE);

  /// Status: pending — gold (same family as accent).
  static const Color statusPendingFg = Color(0xFF8B6914);
  static const Color statusPendingBg = Color(0xFFF5EFE3);
}
