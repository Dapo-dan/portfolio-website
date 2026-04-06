import 'package:flutter/material.dart';
import 'package:porfolio/data/my_projects.dart';
import 'package:porfolio/widgets/project_card.dart';
import 'package:porfolio/widgets/app_section_container.dart';

class AllProjects extends StatelessWidget {
  final Size size;
  const AllProjects({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return AppSectionContainer(
      child: Center(
        child: LayoutBuilder(builder: (context, constraints) {
          final w = constraints.maxWidth;
          final crossAxisCount = w < 700 ? 1 : (w < 1100 ? 2 : 3);

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: 1,
            ),
            itemCount: myProjects.length,
            itemBuilder: (context, index) {
              return ProjectCard(project: myProjects[index]);
            },
          );
        }),
      ),
    );
  }
}
