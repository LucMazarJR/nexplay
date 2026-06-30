import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4f378a),
      surfaceTint: Color(0xff6750a4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6750a4),
      onPrimaryContainer: Color(0xffe0d2ff),
      secondary: Color(0xff635a76),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffeaddff),
      onSecondaryContainer: Color(0xff69607c),
      tertiary: Color(0xff625b71),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffe8def8),
      onTertiaryContainer: Color(0xff686177),
      error: Color(0xff900708),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffb3261e),
      onErrorContainer: Color(0xffffcbc4),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff1c1b1c),
      onSurfaceVariant: Color(0xff494551),
      outline: Color(0xff7a7582),
      outlineVariant: Color(0xffcbc4d2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffcfbcff),
      primaryFixed: Color(0xffe9ddff),
      onPrimaryFixed: Color(0xff22005d),
      primaryFixedDim: Color(0xffcfbcff),
      onPrimaryFixedVariant: Color(0xff4f378a),
      secondaryFixed: Color(0xffeaddff),
      onSecondaryFixed: Color(0xff1f1730),
      secondaryFixedDim: Color(0xffcdc1e2),
      onSecondaryFixedVariant: Color(0xff4b425d),
      tertiaryFixed: Color(0xffe8def8),
      onTertiaryFixed: Color(0xff1e192b),
      tertiaryFixedDim: Color(0xffccc2dc),
      onTertiaryFixedVariant: Color(0xff4a4458),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f2f3),
      surfaceContainer: Color(0xfff1eded),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe6e1e2),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3e2578),
      surfaceTint: Color(0xff6750a4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6750a4),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3a324c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff726885),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff393347),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff716a80),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740003),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffb3261e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff121111),
      onSurfaceVariant: Color(0xff383440),
      outline: Color(0xff55505d),
      outlineVariant: Color(0xff706b78),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffcfbcff),
      primaryFixed: Color(0xff765fb4),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff5d4699),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff726885),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff59506c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff716a80),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff585167),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c6c6),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f2f3),
      surfaceContainer: Color(0xffebe7e7),
      surfaceContainerHigh: Color(0xffe0dcdc),
      surfaceContainerHighest: Color(0xffd4d1d1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff33196e),
      surfaceTint: Color(0xff6750a4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff513a8d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff302841),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4e4560),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2f293c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4c465b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff610002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff950c0b),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2e2a35),
      outlineVariant: Color(0xff4b4753),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffcfbcff),
      primaryFixed: Color(0xff513a8d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3a2174),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4e4560),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff372e48),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4c465b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff353043),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb8b8),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f0f0),
      surfaceContainer: Color(0xffe6e1e2),
      surfaceContainerHigh: Color(0xffd7d3d4),
      surfaceContainerHighest: Color(0xffc9c6c6),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffcfbcff),
      surfaceTint: Color(0xffcfbcff),
      onPrimary: Color(0xff381e72),
      primaryContainer: Color(0xff6750a4),
      onPrimaryContainer: Color(0xffe0d2ff),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff342c46),
      secondaryContainer: Color(0xffeaddff),
      onSecondaryContainer: Color(0xff69607c),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff332d41),
      tertiaryContainer: Color(0xffe8def8),
      onTertiaryContainer: Color(0xff686177),
      error: Color(0xffffb4aa),
      onError: Color(0xff690003),
      errorContainer: Color(0xffb3261e),
      onErrorContainer: Color(0xffffcbc4),
      surface: Color(0xff141314),
      onSurface: Color(0xffe6e1e2),
      onSurfaceVariant: Color(0xffcbc4d2),
      outline: Color(0xff948e9c),
      outlineVariant: Color(0xff494551),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e1e2),
      inversePrimary: Color(0xff6750a4),
      primaryFixed: Color(0xffe9ddff),
      onPrimaryFixed: Color(0xff22005d),
      primaryFixedDim: Color(0xffcfbcff),
      onPrimaryFixedVariant: Color(0xff4f378a),
      secondaryFixed: Color(0xffeaddff),
      onSecondaryFixed: Color(0xff1f1730),
      secondaryFixedDim: Color(0xffcdc1e2),
      onSecondaryFixedVariant: Color(0xff4b425d),
      tertiaryFixed: Color(0xffe8def8),
      onTertiaryFixed: Color(0xff1e192b),
      tertiaryFixedDim: Color(0xffccc2dc),
      onTertiaryFixedVariant: Color(0xff4a4458),
      surfaceDim: Color(0xff141314),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0f0e0e),
      surfaceContainerLow: Color(0xff1c1b1c),
      surfaceContainer: Color(0xff201f20),
      surfaceContainerHigh: Color(0xff2b2a2a),
      surfaceContainerHighest: Color(0xff363435),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe3d6ff),
      surfaceTint: Color(0xffcfbcff),
      onPrimary: Color(0xff2c1067),
      primaryContainer: Color(0xff9a83db),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff342c46),
      secondaryContainer: Color(0xffeaddff),
      onSecondaryContainer: Color(0xff4c445f),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff332d41),
      tertiaryContainer: Color(0xffe8def8),
      onTertiaryContainer: Color(0xff4b4559),
      error: Color(0xffffd2cc),
      onError: Color(0xff540002),
      errorContainer: Color(0xfffa5a4a),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141314),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe1dae8),
      outline: Color(0xffb6afbd),
      outlineVariant: Color(0xff948e9b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e1e2),
      inversePrimary: Color(0xff50398b),
      primaryFixed: Color(0xffe9ddff),
      onPrimaryFixed: Color(0xff160042),
      primaryFixedDim: Color(0xffcfbcff),
      onPrimaryFixedVariant: Color(0xff3e2578),
      secondaryFixed: Color(0xffeaddff),
      onSecondaryFixed: Color(0xff140d25),
      secondaryFixedDim: Color(0xffcdc1e2),
      onSecondaryFixedVariant: Color(0xff3a324c),
      tertiaryFixed: Color(0xffe8def8),
      onTertiaryFixed: Color(0xff130e20),
      tertiaryFixedDim: Color(0xffccc2dc),
      onTertiaryFixedVariant: Color(0xff393347),
      surfaceDim: Color(0xff141314),
      surfaceBright: Color(0xff464444),
      surfaceContainerLowest: Color(0xff080708),
      surfaceContainerLow: Color(0xff1e1d1e),
      surfaceContainer: Color(0xff292828),
      surfaceContainerHigh: Color(0xff333233),
      surfaceContainerHighest: Color(0xff3f3d3e),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff5edff),
      surfaceTint: Color(0xffcfbcff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffccb8ff),
      onPrimaryContainer: Color(0xff0f0033),
      secondary: Color(0xffffffff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffeaddff),
      onSecondaryContainer: Color(0xff2e263f),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe8def8),
      onTertiaryContainer: Color(0xff2c273a),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea3),
      onErrorContainer: Color(0xff220000),
      surface: Color(0xff141314),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff5edfc),
      outlineVariant: Color(0xffc7c0ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e1e2),
      inversePrimary: Color(0xff50398b),
      primaryFixed: Color(0xffe9ddff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffcfbcff),
      onPrimaryFixedVariant: Color(0xff160042),
      secondaryFixed: Color(0xffeaddff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffcdc1e2),
      onSecondaryFixedVariant: Color(0xff140d25),
      tertiaryFixed: Color(0xffe8def8),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffccc2dc),
      onTertiaryFixedVariant: Color(0xff130e20),
      surfaceDim: Color(0xff141314),
      surfaceBright: Color(0xff515050),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f20),
      surfaceContainer: Color(0xff313030),
      surfaceContainerHigh: Color(0xff3c3b3b),
      surfaceContainerHighest: Color(0xff484647),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
