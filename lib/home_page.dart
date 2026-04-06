import 'package:flutter/material.dart';
import 'package:porfolio/constants/const.dart';
import 'package:porfolio/constants/gradient_styles.dart';
import 'package:porfolio/responsive/app_breakpoints.dart';
import 'package:porfolio/view/desktop_layout_page.dart';
import 'package:porfolio/view/mobile_layout_page.dart';
import 'package:porfolio/widgets/custom_fab.dart';
import 'package:porfolio/widgets/navbar.dart';
import 'package:porfolio/view/tablet_layout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  int _selectedNavIndex = 0;

  static const List<String> _menuItems = [
    'About',
    'Projects',
    'Resume',
    'Skills',
    'Contact',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _navigateTo(String item) {
    if (item == 'About') scrollToSection(aboutKey);
    if (item == 'Projects') scrollToSection(projectsKey);
    if (item == 'Resume') scrollToSection(resumeKey);
    if (item == 'Skills') scrollToSection(skillsKey);
    if (item == 'Contact') scrollToSection(contactKey);
  }

  void _onDestinationSelected(int index) {
    setState(() => _selectedNavIndex = index);
    _navigateTo(_menuItems[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      //   automaticallyImplyLeading: false,
      //   title: ResponsiveNavBar(
      //     onItemSelected: (String item) {
      //       if (item == 'About') scrollToSection(aboutKey);
      //       if (item == 'Projects') scrollToSection(projectsKey);
      //       if (item == 'Resume') scrollToSection(resumeKey);
      //       if (item == 'Skills') scrollToSection(skillsKey);
      //       if (item == 'Contact') scrollToSection(contactKey);
      //     },
      //   ),
      // ),
      endDrawer: context.isMobile
          ? MobileDrawer(
              menuItems: _menuItems,
              onItemSelected: (item) {
                _navigateTo(item);
                Navigator.of(context).pop(); // Close the drawer after selection
              },
            )
          : null,
      bottomNavigationBar: context.isMobile
          ? NavigationBar(
              selectedIndex: _selectedNavIndex,
              onDestinationSelected: _onDestinationSelected,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: 'About',
                ),
                NavigationDestination(
                  icon: Icon(Icons.work_outline),
                  selectedIcon: Icon(Icons.work),
                  label: 'Projects',
                ),
                NavigationDestination(
                  icon: Icon(Icons.description_outlined),
                  selectedIcon: Icon(Icons.description),
                  label: 'Resume',
                ),
                NavigationDestination(
                  icon: Icon(Icons.auto_awesome_outlined),
                  selectedIcon: Icon(Icons.auto_awesome),
                  label: 'Skills',
                ),
                NavigationDestination(
                  icon: Icon(Icons.mail_outline),
                  selectedIcon: Icon(Icons.mail),
                  label: 'Contact',
                ),
              ],
            )
          : null,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: Styles.gradientDecoration,
            child: LayoutBuilder(builder: (context, constraints) {
              final device = deviceSizeForWidth(constraints.maxWidth);

              final content = SingleChildScrollView(
                controller: _scrollController,
                child: switch (device) {
                  DeviceSize.largeDesktop ||
                  DeviceSize.desktop =>
                    const DesktopView(),
                  DeviceSize.tablet => const TabletView(),
                  DeviceSize.mobile => const MobileView(),
                },
              );

              if (device == DeviceSize.tablet) {
                return Row(
                  children: [
                    NavigationRail(
                      selectedIndex: _selectedNavIndex,
                      onDestinationSelected: _onDestinationSelected,
                      labelType: NavigationRailLabelType.all,
                      destinations: const [
                        NavigationRailDestination(
                          icon: Icon(Icons.person_outline),
                          selectedIcon: Icon(Icons.person),
                          label: Text('About'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.work_outline),
                          selectedIcon: Icon(Icons.work),
                          label: Text('Projects'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.description_outlined),
                          selectedIcon: Icon(Icons.description),
                          label: Text('Resume'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.auto_awesome_outlined),
                          selectedIcon: Icon(Icons.auto_awesome),
                          label: Text('Skills'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.mail_outline),
                          selectedIcon: Icon(Icons.mail),
                          label: Text('Contact'),
                        ),
                      ],
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(child: content),
                  ],
                );
              }

              return content;
            }),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ScrollPositionIndicatorFAB(
              scrollController: _scrollController,
            ),
          ),
        ],
      ),
    );
  }
}
