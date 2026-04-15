import 'package:flutter/material.dart';
import 'package:nexplay/core/theme/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get darkTheme {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.brandSeed,
          brightness: Brightness.dark,
        ).copyWith(
          primary: AppColors.brandPrimary,
          surface: AppColors.neutralSurfaceDark,
        );

    final inputDecorationTheme = InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surface.withValues(alpha: 0.72),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: colorScheme.onSurface.withValues(alpha: 0.16),
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: colorScheme.onSurface.withValues(alpha: 0.16),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: colorScheme.primary.withValues(alpha: 0.7),
          width: 1.2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: colorScheme.error.withValues(alpha: 0.85),
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: colorScheme.error, width: 1.2),
      ),
    );

    final cardThemeData = CardThemeData(
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      inputDecorationTheme: inputDecorationTheme,
      cardTheme: cardThemeData,
    );
  }
}
