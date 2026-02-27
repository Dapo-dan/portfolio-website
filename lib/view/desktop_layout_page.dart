import 'package:flutter/material.dart';
import 'package:porfolio/constants/const.dart';
import 'package:porfolio/view/sections/contact_me_section.dart';
import 'package:porfolio/widgets/header_text_widget.dart';
import 'package:porfolio/widgets/rotating_image_widget.dart';
import 'package:porfolio/view/sections/about_section.dart';
import 'package:porfolio/view/sections/my_skills_section.dart';
import 'package:porfolio/view/sections/projects_section.dart';
import 'package:porfolio/view/sections/resume_section.dart';
import 'package:porfolio/widgets/section_spacing.dart';
import 'package:porfolio/widgets/social_tab.dart';
import 'package:porfolio/view/sections/stats_section.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SectionSpacing(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HeaderTextWidget(size: size),
                    const SizedBox(height: 20),
                    SocialLarge(size: size),
                  ],
                ),
                const Expanded(
                  child: Center(child: RotatingImageContainer()),
                ),
              ],
            ),
          ),
          verticalSpace(0.05),
          StatsSection(size: size),
          verticalSpace(0.05),
          AboutSection(
              key: aboutKey, size: size, imageHeight: size.height * 0.6),
          verticalSpace(0.05),
          ProjectsSection(
            key: projectsKey,
          ),
          verticalSpace(0.05),
          ResumeSection(key: resumeKey, size: size),
          verticalSpace(0.05),
          MySkillsSection(
            key: skillsKey,
            size: size,
          ),
          verticalSpace(0.1),
          ContactMeSection(
            key: contactKey,
            size: size,
          ),
        ],
      ),
    );
  }
}
