//<<<<<<< HEAD
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:htfnew/pages/login_page.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen2> {

  @override
  void initState() {
    super.initState();
    // Start loading when the splash screen is displayed
    startLoading();
  }

  void startLoading() {
    // Start a timer to simulate loading for 2 seconds
    Timer(const Duration(seconds: 2), () {
      // Navigate to the login page after the timer completes
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 10, 105),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(height: 20),
           
          ],
        ),
      ),
    );
  }
}