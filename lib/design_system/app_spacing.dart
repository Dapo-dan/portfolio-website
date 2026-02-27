import 'package:flutter/widgets.dart';

/// 8pt spacing scale (PRD-aligned: no arbitrary padding).
class AppSpacing {
  static const double x1 = 4;
  static const double x2 = 8;
  static const double x3 = 12;
  static const double x4 = 16;
  static const double x6 = 24;
  static const double x8 = 32;
  static const double x12 = 48;
  static const double x16 = 64;

  static EdgeInsets all(double v) => EdgeInsets.all(v);
  static EdgeInsets h(double v) => EdgeInsets.symmetric(horizontal: v);
  static EdgeInsets v(double v) => EdgeInsets.symmetric(vertical: v);
  static EdgeInsets hv({double h = 0, double v = 0}) =>
      EdgeInsets.symmetric(horizontal: h, vertical: v);
}

class AppGaps {
  static const Widget x1 = SizedBox(height: AppSpacing.x1, width: AppSpacing.x1);
  static const Widget x2 = SizedBox(height: AppSpacing.x2, width: AppSpacing.x2);
  static const Widget x3 = SizedBox(height: AppSpacing.x3, width: AppSpacing.x3);
  static const Widget x4 = SizedBox(height: AppSpacing.x4, width: AppSpacing.x4);
  static const Widget x6 = SizedBox(height: AppSpacing.x6, width: AppSpacing.x6);
  static const Widget x8 = SizedBox(height: AppSpacing.x8, width: AppSpacing.x8);
  static const Widget x12 =
      SizedBox(height: AppSpacing.x12, width: AppSpacing.x12);
  static const Widget x16 =
      SizedBox(height: AppSpacing.x16, width: AppSpacing.x16);
}

