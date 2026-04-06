import 'package:flutter/material.dart';

class AppTypography {
  static const String fontFamily = 'SpaceGrotesk';

  static TextTheme textTheme(Brightness brightness) {
    final baseColor =
        brightness == Brightness.dark ? Colors.white : const Color(0xFF0F172A);

    TextStyle style({
      required double size,
      required FontWeight weight,
      double? height,
      double? letterSpacing,
    }) {
      return TextStyle(
        fontFamily: fontFamily,
        fontSize: size,
        fontWeight: weight,
        height: height,
        letterSpacing: letterSpacing,
        color: baseColor,
      );
    }

    return TextTheme(
      displayLarge: style(size: 48, weight: FontWeight.w700, height: 1.05),
      displayMedium: style(size: 40, weight: FontWeight.w700, height: 1.1),
      displaySmall: style(size: 34, weight: FontWeight.w700, height: 1.15),
      headlineLarge: style(size: 32, weight: FontWeight.w700, height: 1.15),
      headlineMedium: style(size: 28, weight: FontWeight.w700, height: 1.2),
      headlineSmall: style(size: 24, weight: FontWeight.w700, height: 1.25),
      titleLarge: style(size: 20, weight: FontWeight.w600, height: 1.3),
      titleMedium: style(size: 16, weight: FontWeight.w600, height: 1.3),
      titleSmall: style(size: 14, weight: FontWeight.w600, height: 1.3),
      bodyLarge: style(size: 16, weight: FontWeight.w400, height: 1.6),
      bodyMedium: style(size: 14, weight: FontWeight.w400, height: 1.6),
      bodySmall: style(size: 12, weight: FontWeight.w400, height: 1.5),
      labelLarge: style(size: 14, weight: FontWeight.w600, letterSpacing: 0.2),
      labelMedium: style(size: 12, weight: FontWeight.w600, letterSpacing: 0.2),
      labelSmall: style(size: 11, weight: FontWeight.w600, letterSpacing: 0.2),
    );
  }
}
