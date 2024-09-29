import 'package:flutter/material.dart';
import 'package:htfnew/auth/welcome_page.dart';
import 'package:htfnew/pages/home_page.dart';
import 'package:htfnew/pages/logIn_learner_done.dart';
import 'package:htfnew/pages/login_page.dart';
import 'package:htfnew/pages/login_provider_done.dart';
import 'package:htfnew/pages/register_page.dart';
import 'package:htfnew/pages/set_password.dart';
import 'package:htfnew/pages/splash_screen.dart';


 // Make sure this path matches the location of the splash_screen.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // Set the initial route
      routes: {
        '/': (context) => const SplashScreen(),  // Home route, typically the splash screen
        '/welcome_page': (context) => const WelcomeScreen(), // Welcome page route
        '/login_page': (context) => const LoginPage(), // Login page route
        '/logIn_learner_done': (context) => const HelloLearner(), 
        '/logIn_provider_done': (context) => const HelloProvider(),// Additional "Hello Welcome" page
        '/home_page':(context)=> const HomePage(),
        '/register_page':(context)=>const RegisterPage(),
        '/set_password': (context)=> const SetPassword(),
        
        
      },
       // Using SplashScreen as the home widget
    );
  }
}

