import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/const.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/design_system/app_shadows.dart';
import 'package:porfolio/responsive/app_breakpoints.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isDesktop = constraints.maxWidth >= AppBreakpoints.desktopMin;

      Widget tile({required bool active}) {
        return Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: active ? studio.withValues(alpha: 0.18) : revolver,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: active ? studio : studio.withValues(alpha: 0.15),
                  width: 1.2,
                ),
                boxShadow: active ? AppShadows.sm : const [],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      active ? Colors.transparent : Colors.grey,
                      BlendMode.srcATop,
                    ),
                    child: AnimatedContainer(
                      width: active ? 110 : 96,
                      height: active ? 110 : 96,
                      duration: const Duration(milliseconds: 220),
                      child: Image.asset(widget.image),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "${(widget.percentage * 100).toInt()}%",
                    style: TextStyles.style16extrabold.copyWith(
                      color: active ? studio : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            verticalSpaceSmall(),
            Text(
              widget.title,
              style: TextStyles.style20extrabold.copyWith(color: studio),
              textAlign: TextAlign.center,
            ),
          ],
        );
      }

      if (isDesktop) {
        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 160),
            scale: _isHovered ? 1.03 : 1,
            child: tile(active: _isHovered),
          ),
        );
      }

      return VisibilityDetector(
        key: Key(widget.title),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.2 && !_isVisible) {
            setState(() => _isVisible = true);
          } else if (info.visibleFraction == 0 && _isVisible) {
            setState(() => _isVisible = false);
          }
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: _isVisible ? 1 : 0.15,
          child: tile(active: _isVisible),
        ),
      );
    });
  }
}

// class SkillWidget extends StatefulWidget {
//   final String title;
//   final String image;
//   final double percentage;

//   const SkillWidget({
//     super.key,
//     required this.title,
//     required this.image,
//     required this.percentage,
//   });

//   @override
//   State<SkillWidget> createState() => _SkillWidgetState();
// }

// class _SkillWidgetState extends State<SkillWidget> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       child: Column(
//         children: [
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             padding: const EdgeInsets.symmetric(
//               vertical: 20,
//               horizontal: 40,
//             ),
//             decoration: BoxDecoration(
//               color: _isHovered ? studio.withOpacity(0.2) : revolver,
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(
//                 color: _isHovered ? studio : revolver,
//                 width: 1.2,
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ColorFiltered(
//                   colorFilter: ColorFilter.mode(
//                     _isHovered ? Colors.transparent : Colors.grey,
//                     BlendMode.srcATop,
//                   ),
//                   child: AnimatedContainer(
//                     width: _isHovered ? 120 : 100,
//                     height: _isHovered ? 120 : 100,
//                     duration: const Duration(milliseconds: 300),
//                     child: Image.asset(
//                       widget.image,
//                     ),
//                   ),
//                 ),
//                 verticalSpaceMedium(),
//                 Text(
//                   "${(widget.percentage * 100).toInt()}%",
//                   style: TextStyles.style16extrabold.copyWith(
//                     color: _isHovered ? studio : Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           verticalSpaceSmall(),
//           Text(
//             widget.title,
//             style: TextStyles.style24extrabold.copyWith(
//               color: studio,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
