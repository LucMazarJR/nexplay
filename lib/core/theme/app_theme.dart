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
      fillColor: colorScheme.surface,
      border: OutlineInputBorder(),
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
