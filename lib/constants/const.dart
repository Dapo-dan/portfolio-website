import 'package:flutter/material.dart';
import 'package:get/get.dart';

double width() => Get.width;
double height() => Get.height;

verticalSpaceTiny() => const SizedBox(height: 5);
verticalSpaceSmall() => const SizedBox(height: 10);
verticalSpaceMedium() => const SizedBox(height: 25);
verticalSpaceLarge() => const SizedBox(height: 50);
verticalSpaceMassive() => const SizedBox(height: 100);

horizontalSpaceTiny() => const SizedBox(width: 5);
horizontalSpaceSmall() => const SizedBox(width: 10);
horizontalSpaceMedium() => const SizedBox(width: 25);

verticalSpace(double factor) => SizedBox(height: height() * factor);
horizontalSpace(double factor) => SizedBox(width: width() * factor);