import 'package:flutter/material.dart';
import 'package:porfolio/constants/const.dart';
import 'package:porfolio/widgets/count_container_widget.dart';

class StatsSection extends StatelessWidget {
  final Size size;

  const StatsSection({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width() * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CountWidget(
            size: size,
            text1: "5+",
            text2: "Years of",
            text3: "Experience",
          ),
          const SizedBox(width: 50),
          CountWidget(
            size: size,
            text1: "7+",
            text2: "Projects",
            text3: "Completed",
          ),
        ],
      ),
    );
  }
}
