import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/const.dart';
import 'package:porfolio/constants/styles.dart';

class SkillWidget extends StatefulWidget {
  final String title;
  final String image;
  final double percentage;

  const SkillWidget({
    super.key,
    required this.title,
    required this.image,
    required this.percentage,
  });

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 40,
            ),
            decoration: BoxDecoration(
              color: _isHovered ? studio.withOpacity(0.2) : revolver,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _isHovered ? studio : revolver,
                width: 1.2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    _isHovered ? Colors.transparent : Colors.grey,
                    BlendMode.srcATop,
                  ),
                  child: AnimatedContainer(
                    width: _isHovered ? 120 : 100,
                    height: _isHovered ? 120 : 100,
                    duration: const Duration(milliseconds: 300),
                    child: Image.asset(
                      widget.image,
                    ),
                  ),
                ),
                verticalSpaceMedium(),
                Text(
                  "${(widget.percentage * 100).toInt()}%",
                  style: TextStyles.style16extrabold.copyWith(
                    color: _isHovered ? studio : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          verticalSpaceSmall(),
          Text(
            widget.title,
            style: TextStyles.style24extrabold.copyWith(
              color: studio,
            ),
          ),
        ],
      ),
    );
  }
}