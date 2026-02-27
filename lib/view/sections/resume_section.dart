import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/const.dart';
import 'package:porfolio/data/education.dart';
import 'package:porfolio/data/resume_list.dart';
import 'package:porfolio/widgets/gradient_text.dart';
import 'package:porfolio/widgets/resume_card.dart';
import 'package:porfolio/widgets/app_section_container.dart';

class ResumeSection extends StatelessWidget {
  final Size size;

  const ResumeSection({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AppSectionContainer(
      backgroundColor: ebony,
      child: width() > 600
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width() > 950 ? width() * 0.3 : width() * 0.4,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/icons/experience.png",
                              height: width() > 950
                                  ? width() * 0.03
                                  : width() * 0.05,
                              color: studio,
                            ),
                          ),
                          GradientTextWidget(
                              size: size, text1: "My Experience"),
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: resumeData.length,
                        separatorBuilder: (context, index) =>
                            verticalSpaceMedium(),
                        itemBuilder: (context, index) {
                          final resumeItem = resumeData[index];
                          return ResumeCard(
                            title: resumeItem["title"]!,
                            date: resumeItem["date"]!,
                            company: resumeItem["company"]!,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width() > 950 ? width() * 0.3 : width() * 0.4,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/icons/education.png",
                              height: width() > 950
                                  ? width() * 0.03
                                  : width() * 0.05,
                              color: studio,
                            ),
                          ),
                          GradientTextWidget(size: size, text1: "My Education"),
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: educationList.length,
                        separatorBuilder: (context, index) =>
                            verticalSpaceMedium(),
                        itemBuilder: (context, index) {
                          final educationItem = educationList[index];
                          return ResumeCard(
                            title: educationItem["title"]!,
                            date: educationItem["date"]!,
                            company: educationItem["company"]!,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              children: [
                SizedBox(
                  width: width() < 600 ? width() * 0.8 : width() * 0.6,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image.asset(
                              "assets/icons/experience.png",
                              height: width() * 0.1,
                              color: studio,
                            ),
                          ),
                          GradientTextWidget(
                              size: size, text1: "My Experience"),
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: resumeData.length,
                        separatorBuilder: (context, index) =>
                            verticalSpaceMedium(),
                        itemBuilder: (context, index) {
                          final resumeItem = resumeData[index];
                          return ResumeCard(
                            title: resumeItem["title"]!,
                            date: resumeItem["date"]!,
                            company: resumeItem["company"]!,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                verticalSpace(0.05),
                SizedBox(
                  width: width() < 600 ? width() * 0.8 : width() * 0.6,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/icons/education.png",
                              height: width() * 0.1,
                              color: studio,
                            ),
                          ),
                          GradientTextWidget(size: size, text1: "My Education"),
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: educationList.length,
                        separatorBuilder: (context, index) =>
                            verticalSpaceMedium(),
                        itemBuilder: (context, index) {
                          final educationItem = educationList[index];
                          return ResumeCard(
                            title: educationItem["title"]!,
                            date: educationItem["date"]!,
                            company: educationItem["company"]!,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                verticalSpace(0.05),
              ],
            ),
    );
  }
}
