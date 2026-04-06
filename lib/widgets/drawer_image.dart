import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/design_system/app_shadows.dart';

class DrawerImage extends StatelessWidget {
  final double height, width;

  const DrawerImage({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            studio,
            Color(0xFF6a5ae4),
          ],
        ),
      ),
      child: ClipOval(
        child: Transform.rotate(
          angle: 0.1,
          child: DecoratedBox(
            decoration: const BoxDecoration(boxShadow: AppShadows.sm),
            child: Image.asset(
              'assets/images/profile_new.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
