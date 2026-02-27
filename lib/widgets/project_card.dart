import 'package:flutter/material.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/design_system/app_shadows.dart';
import 'package:porfolio/responsive/app_breakpoints.dart';
import 'package:porfolio/model/project_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  bool _isVisible = false;

  void _onHover(bool hover) {
    setState(() {
      _isHovered = hover;
    });
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isDesktop = constraints.maxWidth >= AppBreakpoints.desktopMin;

      Widget card({required bool showOverlay}) {
        return Container(
          decoration: BoxDecoration(
            color: valhalla.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(16),
            boxShadow: AppShadows.sm,
            border: Border.all(color: studio.withValues(alpha: 0.25)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.project.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    curve: Curves.easeOutCubic,
                    duration: const Duration(milliseconds: 220),
                    height: showOverlay ? 108 : 0,
                    decoration: BoxDecoration(
                      color: studio,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: DefaultTextStyle(
                        style: TextStyles.style12extrabold,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.project.title,
                                    style: TextStyles.style20extrabold,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    widget.project.subtitle,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () => _launch(widget.project.iosUrl),
                              child: Text(
                                "iOS",
                                style: TextStyles.style12extrabold.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: white,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () => _launch(widget.project.androidUrl),
                              child: Text(
                                "Android",
                                style: TextStyles.style12extrabold.copyWith(
                                  decoration: TextDecoration.underline,
                                  decorationColor: white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      if (isDesktop) {
        return MouseRegion(
          onEnter: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 160),
            scale: _isHovered ? 1.02 : 1,
            child: card(showOverlay: _isHovered),
          ),
        );
      }

      return VisibilityDetector(
        key: Key(widget.project.title),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.1 && !_isVisible) {
            setState(() => _isVisible = true);
          }
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _isVisible ? 1 : 0,
          child: Transform.translate(
            offset: _isVisible ? Offset.zero : const Offset(0, 16),
            child: card(showOverlay: _isVisible),
          ),
        ),
      );
    });
  }
}
