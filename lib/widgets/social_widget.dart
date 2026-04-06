import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/design_system/app_shadows.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key});

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
    final scheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: studio.withValues(alpha: 0.5)),
              boxShadow: AppShadows.sm),
          child: Center(
            child: IconButton(
              hoverColor: scheme.surfaceContainerHighest,
              onPressed: () async {
                const url = 'http://www.linkedin.com/in/o-d-olatubosun';
                await _launch(url);
              },
              icon: const FaIcon(
                FontAwesomeIcons.linkedinIn,
                color: studio,
                size: 15,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: studio.withValues(alpha: 0.5)),
              boxShadow: AppShadows.sm),
          child: Center(
            child: IconButton(
              hoverColor: scheme.surfaceContainerHighest,
              onPressed: () async {
                const url = 'https://github.com/Dapo-dan';
                await _launch(url);
              },
              icon: const FaIcon(
                FontAwesomeIcons.github,
                color: studio,
                size: 15,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: studio.withValues(alpha: 0.5)),
              boxShadow: AppShadows.sm),
          child: Center(
            child: IconButton(
              hoverColor: scheme.surfaceContainerHighest,
              onPressed: () async {
                const url =
                    'https://www.upwork.com/freelancers/~01ef61a88d5ca9b18c';
                await _launch(url);
              },
              icon: const FaIcon(
                FontAwesomeIcons.upwork,
                color: studio,
                size: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
