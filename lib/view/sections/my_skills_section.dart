import 'package:flutter/material.dart';
import 'package:porfolio/data/my_skills.dart';
import 'package:porfolio/widgets/gradient_text.dart';
import 'package:porfolio/widgets/skills_widget.dart';
import 'package:porfolio/widgets/app_section_container.dart';

class MySkillsSection extends StatelessWidget {
  final Size size;

  const MySkillsSection({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AppSectionContainer(
      child: Column(
        children: [
          GradientTextWidget(size: size, text1: "My Skills"),
          LayoutBuilder(builder: (context, constraints) {
            final w = constraints.maxWidth;
            final crossAxisCount = w < 650 ? 1 : (w < 1000 ? 2 : 4);

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: mySkills.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: w < 650 ? 2.5 : 1.1,
              ),
              itemBuilder: (context, index) {
                final skill = mySkills[index];
                return SkillWidget(
                  title: skill["title"]!,
                  image: skill["image"]!,
                  percentage: skill["percentage"]!,
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
