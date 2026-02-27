import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/design_system/app_spacing.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.title,
    this.loadingText,
    this.buttonColor,
    this.borderColor,
    this.textColor,
    this.borderRadius,
    this.hPadding,
    this.vPadding,
    this.allowSubmit = true,
    this.isLoading = false,
  });

  final String title;
  final String? loadingText;
  final void Function() onTap;
  final Color? buttonColor, borderColor;
  final Color? textColor;
  final double? borderRadius, hPadding, vPadding;
  final bool allowSubmit, isLoading;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isEnabled = allowSubmit && !isLoading;

    return InkWell(
      onTap: isEnabled ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
          ),
          gradient: LinearGradient(
            colors: [
              studio,
              studio.withValues(alpha: 0.5),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: scheme.primary.withValues(alpha: isEnabled ? 0.25 : 0.08),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: hPadding ?? AppSpacing.x8,
            vertical: vPadding ?? AppSpacing.x3,
          ),
          child: Center(
            child: Text(
              isLoading ? (loadingText ?? title) : title,
              style: TextStyles.style14extrabold.copyWith(
                color: textColor ?? (isEnabled ? white : scheme.onSurface),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
