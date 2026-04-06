import 'package:flutter/material.dart';
import 'package:porfolio/constants/const.dart';

class SectionSpacing extends StatelessWidget {
  final Widget child;

  const SectionSpacing({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: height() * 0.10,
        horizontal: width() * 0.04,
      ),
      child: child,
    );
  }
}
