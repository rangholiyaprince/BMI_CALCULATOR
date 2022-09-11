import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () =>
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/splash_logo.png", width: 125)),
          const SizedBox(
            height: 30,
            width: double.infinity,
          ),
          const Text(
            "BMI CALCULATOR",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 300,
          ),
          const CircularProgressIndicator(
            color: Color(0xffFF0C63),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Check Your BMI",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
