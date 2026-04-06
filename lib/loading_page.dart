import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/const.dart';
import 'package:porfolio/home_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool _isLoading = true;
  Timer? _loadingTimer;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  void _simulateLoading() {
    _loadingTimer?.cancel();
    _loadingTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      setState(() => _isLoading = false);
    });
  }

  @override
  void dispose() {
    _loadingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: ebony,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/json/loading.json',
                width: width() * 0.5,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    width: 48,
                    height: 48,
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      );
    } else {
      return const HomePage();
    }
  }
}
