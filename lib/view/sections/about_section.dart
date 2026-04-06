import 'package:flutter/material.dart';
import 'package:porfolio/constants/app_strings.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/widgets/app_section_container.dart';
import 'package:porfolio/widgets/drawer_image.dart';
import 'package:porfolio/widgets/gradient_text.dart';

class AboutSection extends StatelessWidget {
  final Size size;
  final double imageHeight;

  const AboutSection({
    super.key,
    required this.size,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppSectionContainer(
      backgroundColor: ebony,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final contentWidth = constraints.maxWidth;
          final isDesktop = contentWidth > 950;

          final desktopImageSize = (contentWidth * 0.34).clamp(260.0, 460.0);
          final mobileImageSize = (contentWidth * 0.65).clamp(180.0, 320.0);

          return Column(
            children: [
              GradientTextWidget(size: size, text1: 'About Me'),
              const SizedBox(height: 24),
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Center(
                        child: DrawerImage(
                          height: desktopImageSize,
                          width: desktopImageSize,
                        ),
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      flex: 5,
                      child: Text(
                        AppString.aboutMe,
                        style: TextStyles.style16regular,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    DrawerImage(
                      height: mobileImageSize,
                      width: mobileImageSize,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      AppString.aboutMe,
                      style: TextStyles.style16regular,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              const SizedBox(height: 40),
            ],
          );
        },
      ),
    );
  }
}
