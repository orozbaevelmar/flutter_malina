import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_malina/constants/colors.dart';
import 'package:flutter_malina/constants/go.dart';
import 'package:flutter_malina/ui_presentation/widgets/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _navigateTo(context);
  }

  void _navigateTo(BuildContext context) {
    _timer = Timer(const Duration(seconds: 2), () {
      Go.replace(context, const CustomBottomNavigationBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColor.malina,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 96.54,
                width: 96.54,
                image: AssetImage(
                  'assets/icon1.png',
                ),
              ),
              SizedBox(height: 23.05),
              Image(
                width: 190.16,
                height: 30,
                image: AssetImage('assets/Vector.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
