import 'dart:async';
import 'package:bookstore/page/bottomNavigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen1> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (builder) => PracticeBottomNavBar()),
                (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: Lottie.asset('assets/animations/Animation - 1723480083007.json'),
        ),
      ),
    );
  }
}
