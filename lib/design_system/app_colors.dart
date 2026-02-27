import 'package:flutter/material.dart';

/// Semantic colors built on the existing palette in `constants/colors.dart`.
/// Kept separate so we can migrate away from raw color constants over time.
class AppColors {
  // Brand / accents
  static const Color primary = Color.fromARGB(255, 125, 79, 240); // studio
  static const Color secondary = Color(0xFF6998B6); // hippieBlue

  // Surfaces (dark-first app)
  static const Color backgroundDark = Color(0xFF0A0612); // ebony
  static const Color surfaceDark = Color(0xFF271B3D); // revolver
  static const Color surfaceAltDark = Color(0xFF311A5F); // valhalla

  // Text
  static const Color onDark = Color(0xFFFFFFFF);
  static const Color onLight = Color(0xFF0F172A);

  // Status
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);

  /// Neutral scale (50–900)
  static const Map<int, Color> neutral = {
    50: Color(0xFFF8FAFC),
    100: Color(0xFFF1F5F9),
    200: Color(0xFFE2E8F0),
    300: Color(0xFFCBD5E1),
    400: Color(0xFF94A3B8),
    500: Color(0xFF64748B),
    600: Color(0xFF475569),
    700: Color(0xFF334155),
    800: Color(0xFF1E293B),
    900: Color(0xFF0F172A),
  };
}

class AppColorSchemes {
  static final ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.onDark,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onDark,
    error: AppColors.error,
    onError: AppColors.onDark,
    surface: AppColors.surfaceDark,
    onSurface: AppColors.onDark,
    surfaceContainerHighest: AppColors.surfaceAltDark,
    onSurfaceVariant: AppColors.neutral[200]!,
    outline: AppColors.neutral[600]!,
  );

  static final ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.onDark,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onDark,
    error: AppColors.error,
    onError: AppColors.onDark,
    surface: Colors.white,
    onSurface: AppColors.onLight,
    surfaceContainerHighest: AppColors.neutral[100]!,
    onSurfaceVariant: AppColors.neutral[700]!,
    outline: AppColors.neutral[300]!,
  );
}

