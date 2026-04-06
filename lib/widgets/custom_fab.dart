import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/design_system/app_shadows.dart';

class ScrollPositionIndicatorFAB extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollPositionIndicatorFAB({super.key, required this.scrollController});

  @override
  State<ScrollPositionIndicatorFAB> createState() =>
      _ScrollPositionIndicatorFABState();
}

class _ScrollPositionIndicatorFABState
    extends State<ScrollPositionIndicatorFAB> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_updateProgress);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateProgress);
    super.dispose();
  }

  void _updateProgress() {
    if (!mounted) return;

    final maxScrollExtent = widget.scrollController.position.maxScrollExtent;
    final currentScroll = widget.scrollController.position.pixels;

    setState(() {
      progress = (currentScroll / maxScrollExtent).clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.scrollController.animateTo(
          0,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              value: progress, // Progress value
              strokeWidth: 4,
              color: studio, // Progress indicator color
              backgroundColor: studio.withValues(alpha: 0.2), // Track color
            ),
          ),
          const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
              boxShadow: AppShadows.md,
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.arrow_upward,
                color: studio,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
