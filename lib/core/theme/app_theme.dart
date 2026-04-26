import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Builds the app [ThemeData] with IBM Plex Sans Arabic for all locales.
ThemeData buildAppTheme() {
  const ColorScheme scheme = ColorScheme.light(
    primary: AppColors.royalGold,
    onPrimary: Colors.white,
    secondary: AppColors.navy,
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Color(0xFF1A1D21),
    error: Color(0xFFC62828),
  );

  final ThemeData light = ThemeData.light();
  final TextTheme textTheme = GoogleFonts.ibmPlexSansArabicTextTheme(
    light.textTheme,
  );
  final TextTheme primaryTextTheme = GoogleFonts.ibmPlexSansArabicTextTheme(
    light.primaryTextTheme,
  );

  const Color titleColor = AppColors.navy;

  final TextTheme themedTitles = textTheme.copyWith(
    headlineSmall: textTheme.headlineSmall?.copyWith(color: titleColor),
    headlineMedium: textTheme.headlineMedium?.copyWith(color: titleColor),
    headlineLarge: textTheme.headlineLarge?.copyWith(color: titleColor),
    titleLarge: textTheme.titleLarge?.copyWith(color: titleColor),
    titleMedium: textTheme.titleMedium?.copyWith(color: titleColor),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.surfaceLight,
    textTheme: themedTitles,
    primaryTextTheme: primaryTextTheme,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.navy,
      foregroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: themedTitles.titleLarge?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.06),
      surfaceTintColor: Colors.transparent,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      margin: EdgeInsets.zero,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.black12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.royalGold, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.royalGold,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.royalGold,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: scheme.onSurface,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        side: BorderSide(color: scheme.onSurface.withValues(alpha: 0.3)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.royalGold,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      indicatorColor: AppColors.royalGold.withValues(alpha: 0.22),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return themedTitles.labelMedium?.copyWith(
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          color: selected
              ? AppColors.royalGold
              : scheme.onSurface.withValues(alpha: 0.55),
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected
              ? AppColors.royalGold
              : scheme.onSurface.withValues(alpha: 0.55),
          size: 24,
        );
      }),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.royalGold,
      unselectedItemColor: scheme.onSurface.withValues(alpha: 0.55),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.royalGold,
      unselectedLabelColor: scheme.onSurface.withValues(alpha: 0.55),
      indicatorColor: AppColors.royalGold,
    ),
    dividerTheme: DividerThemeData(
      color: scheme.onSurface.withValues(alpha: 0.08),
    ),
  );
}
