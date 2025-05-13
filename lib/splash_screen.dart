import 'dart:async';

import 'package:e_commerce/constants/images.dart';
import 'package:e_commerce/providers/storage_provider.dart';
import 'package:e_commerce/screens/home_screens/bottom_navbar.dart';
import 'package:e_commerce/screens/onboard_screens/next_screen.dart';
import 'package:e_commerce/screens/onboard_screens/onboard_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkAuth();
    super.initState();
  }

  void checkAuth() {
    Future.delayed(const Duration(seconds: 3), () {
      StorageProvider.i.getStorageValue('token').then((value) {
        if (value.isNotEmpty) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavigationScreen()),
              (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const NextScreen()), //OnboardScreen()
              (route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Image.asset(
        splashImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
