import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:porfolio/design_system/app_theme.dart';
import 'package:porfolio/loading_page.dart';
import 'package:porfolio/widgets/custom_scroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const LoadingPage(),
    );
  }
}
