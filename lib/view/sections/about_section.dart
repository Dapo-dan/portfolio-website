import 'package:flutter/material.dart';
import 'package:porfolio/constants/app_strings.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/const.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/widgets/app_section_container.dart';
import 'package:porfolio/widgets/drawer_image.dart';
import 'package:porfolio/widgets/gradient_text.dart';

class AboutSection extends StatelessWidget {
  final Size size;
  final double imageHeight;

  const AboutSection(
      {super.key, required this.size, required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return AppSectionContainer(
      backgroundColor: ebony,
      child: Column(
        children: [
          GradientTextWidget(size: size, text1: "About Me"),
          verticalSpace(0.01),
          width() > 950
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DrawerImage(
                      height: width() * 0.25,
                      width: width() * 0.25,
                    ),
                    // Container(
                    //   height: imageHeight,
                    //   width: width() * 0.25,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     image: const DecorationImage(
                    //       image: AssetImage("assets/images/profile_new.jpg"),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      width: width() * 0.4,
                      child: Text(
                        AppString.aboutMe,
                        style: TextStyles.style16regular.copyWith(height: 3),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    DrawerImage(
                      height: width() * 0.6,
                      width: width() * 0.6,
                    ),
                    // Container(
                    //   height: height() * 0.3,
                    //   width: width() * 0.6,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20),
                    //     image: const DecorationImage(
                    //       image: AssetImage(
                    //         "assets/images/profile_new.jpg",
                    //       ),
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    verticalSpaceMedium(),
                    Text(
                      AppString.aboutMe,
                      style: TextStyles.style16regular.copyWith(height: 3),
                      textAlign: TextAlign.justify,
                    ),
                    verticalSpace(0.05),
                  ],
                ),
          verticalSpace(0.05),
        ],
      ),
    );
  }
}
