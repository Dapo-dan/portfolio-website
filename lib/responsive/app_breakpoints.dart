import 'package:flutter/widgets.dart';

/// PRD breakpoints:
/// - Mobile: 0–599
/// - Tablet: 600–1023
/// - Desktop: 1024–1439
/// - Large Desktop: 1440+
class AppBreakpoints {
  static const double mobileMax = 599;
  static const double tabletMin = 600;
  static const double tabletMax = 1023;
  static const double desktopMin = 1024;
  static const double desktopMax = 1439;
  static const double largeDesktopMin = 1440;
}

enum DeviceSize {
  mobile,
  tablet,
  desktop,
  largeDesktop,
}

DeviceSize deviceSizeForWidth(double width) {
  if (width >= AppBreakpoints.largeDesktopMin) return DeviceSize.largeDesktop;
  if (width >= AppBreakpoints.desktopMin) return DeviceSize.desktop;
  if (width >= AppBreakpoints.tabletMin) return DeviceSize.tablet;
  return DeviceSize.mobile;
}

extension ResponsiveContext on BuildContext {
  Size get mediaSize => MediaQuery.sizeOf(this);
  double get mediaWidth => mediaSize.width;
  double get mediaHeight => mediaSize.height;

  DeviceSize get deviceSize => deviceSizeForWidth(mediaWidth);

  bool get isMobile => deviceSize == DeviceSize.mobile;
  bool get isTablet => deviceSize == DeviceSize.tablet;
  bool get isDesktop => deviceSize == DeviceSize.desktop;
  bool get isLargeDesktop => deviceSize == DeviceSize.largeDesktop;
}
