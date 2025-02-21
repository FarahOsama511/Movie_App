import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_app/Feautres/HomeScreen/views/Home_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
              child: SizedBox(
        height: double.infinity,
        child: Image.network(
          "https://cdn.dribbble.com/users/1461209/screenshots/3832229/film-dribbble1.gif",
        ),
      ))),
    );
  }
}
