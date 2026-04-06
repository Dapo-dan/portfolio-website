import 'package:flutter/material.dart';
import 'package:porfolio/constants/const.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/responsive/app_breakpoints.dart';

class ResponsiveNavBar extends StatelessWidget {
  final List<String> menuItems = [
    'About',
    'Projects',
    'Resume',
    'Skills',
    'Contact',
  ];
  final ValueChanged<String> onItemSelected;

  ResponsiveNavBar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AppBreakpoints.desktopMin) {
          return DesktopNavBar(
              menuItems: menuItems, onItemSelected: onItemSelected);
        } else {
          return MobileNavBar(
            menuItems: menuItems,
          );
        }
      },
    );
  }
}

class DesktopNavBar extends StatelessWidget {
  final List<String> menuItems;
  final ValueChanged<String> onItemSelected;

  const DesktopNavBar(
      {super.key, required this.menuItems, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: height() * 0.05,
        right: width() * 0.1,
      ),
      child: Row(
        children: [
          const Spacer(),
          Row(
            children: menuItems
                .map(
                  (item) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width() * 0.02,
                    ),
                    child: GestureDetector(
                      onTap: () => onItemSelected(item),
                      child: Text(
                        item,
                        style: TextStyles.style18bold,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class MobileNavBar extends StatelessWidget {
  final List<String> menuItems;

  const MobileNavBar({
    super.key,
    required this.menuItems,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(),
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  final List<String> menuItems;
  final ValueChanged<String> onItemSelected;

  const MobileDrawer(
      {super.key, required this.menuItems, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: revolver,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            ...menuItems.map(
              (item) => ListTile(
                title: Text(
                  item.toUpperCase(),
                  style: TextStyles.style18bold,
                ),
                onTap: () {
                  onItemSelected(item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
