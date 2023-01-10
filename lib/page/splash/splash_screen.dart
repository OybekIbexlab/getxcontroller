import 'dart:async';

import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 2;
  // duration of splash screen on second

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: splashtime),
      () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MyHomePage();
            },
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/splash_screen.gif",
          ),
        ),
      ),
    );
  }
}
