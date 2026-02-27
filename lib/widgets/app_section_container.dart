import 'package:flutter/material.dart';
import 'package:porfolio/design_system/app_spacing.dart';
import 'package:porfolio/responsive/app_breakpoints.dart';

class AppSectionContainer extends StatelessWidget {
  const AppSectionContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.maxWidth,
    this.padding,
  });

  final Widget child;
  final Color? backgroundColor;
  final double? maxWidth;
  final EdgeInsetsGeometry? padding;

  EdgeInsets _defaultPadding(BuildContext context) {
    final w = context.mediaWidth;
    final device = deviceSizeForWidth(w);

    // Keep sections breathable on desktop, but avoid “stretched to edges”.
    final horizontal = switch (device) {
      DeviceSize.mobile => AppSpacing.x4,
      DeviceSize.tablet => AppSpacing.x6,
      DeviceSize.desktop => AppSpacing.x8,
      DeviceSize.largeDesktop => AppSpacing.x12,
    };

    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: AppSpacing.x12,
    );
  }

  double _defaultMaxWidth(BuildContext context) {
    final device = context.deviceSize;
    return switch (device) {
      DeviceSize.mobile => double.infinity,
      DeviceSize.tablet => 960,
      DeviceSize.desktop => 1280,
      DeviceSize.largeDesktop => 1280,
    };
  }

  @override
  Widget build(BuildContext context) {
    final section = Padding(
      padding: padding ?? _defaultPadding(context),
      child: child,
    );

    return Container(
      width: double.infinity,
      color: backgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth ?? _defaultMaxWidth(context)),
          child: section,
        ),
      ),
    );
  }
}

