import 'package:flutter/material.dart';
import 'package:get/get.dart';

double width() => Get.width;
double height() => Get.height;

// 8pt grid spacing helpers (PRD-aligned).
verticalSpaceTiny() => const SizedBox(height: 4);
verticalSpaceSmall() => const SizedBox(height: 8);
verticalSpaceMedium() => const SizedBox(height: 24);
verticalSpaceLarge() => const SizedBox(height: 48);
verticalSpaceMassive() => const SizedBox(height: 96);

horizontalSpaceTiny() => const SizedBox(width: 4);
horizontalSpaceSmall() => const SizedBox(width: 8);
horizontalSpaceMedium() => const SizedBox(width: 24);

verticalSpace(double factor) => SizedBox(height: height() * factor);
horizontalSpace(double factor) => SizedBox(width: width() * factor);

final GlobalKey aboutKey = GlobalKey();
final GlobalKey projectsKey = GlobalKey();
final GlobalKey resumeKey = GlobalKey();
final GlobalKey skillsKey = GlobalKey();
final GlobalKey contactKey = GlobalKey();

void scrollToSection(GlobalKey key) {
  final BuildContext? context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
