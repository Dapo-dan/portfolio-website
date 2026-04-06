import 'package:flutter/material.dart';
import 'package:porfolio/design_system/app_colors.dart';
import 'package:porfolio/design_system/app_spacing.dart';
import 'package:porfolio/design_system/app_typography.dart';

class AppTheme {
  static ThemeData light() => _theme(AppColorSchemes.light);
  static ThemeData dark() => _theme(AppColorSchemes.dark);

  static ThemeData _theme(ColorScheme scheme) {
    final textTheme = AppTypography.textTheme(scheme.brightness);

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: scheme.brightness == Brightness.dark
          ? AppColors.backgroundDark
          : scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
      ),
      cardTheme: CardThemeData(
        color: scheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: scheme.surfaceContainerHighest,
        contentTextStyle:
            textTheme.bodyMedium?.copyWith(color: scheme.onSurface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outline.withValues(alpha: 0.4),
        thickness: 1,
        space: AppSpacing.x4,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest.withValues(alpha: 0.7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.outline.withValues(alpha: 0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.outline.withValues(alpha: 0.35)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: scheme.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.x4,
          vertical: AppSpacing.x3,
        ),
      ),
    );
  }
}
