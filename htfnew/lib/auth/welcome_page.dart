import 'package:flutter/material.dart';
import 'package:htfnew/pages/login_page.dart';
import 'package:htfnew/pages/register_page.dart';

// Assuming you have a HomePage widget to navigate after login

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.menu_book, // Adjust the icon to fit your branding
                size: 80,
                color: Color.fromARGB(255, 41, 10, 105),
              ),
              const SizedBox(height: 10),
              const Text(
                'GoLearn',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 41, 10, 105),
                ),
              ),
              const Text(
                'Your Personel Learning Partner',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 41, 10, 105),
                ),
              ),
              const SizedBox(height: 30),
              
              // Add padding around the "Revolutionary learning app..." text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0), // Adjust padding as needed
                child: Text(
                  'Revolutionary learning app '
                  'ensuring accessible, efficient, and reliable learning '
                  'anytime, anywhere.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color:Color.fromARGB(255, 41, 10, 105),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                ), // Adjust navigation
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 41, 10, 105), // Text color
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: const Text('Log In'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                ), // Adjust navigation
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 41, 10, 105),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






/*import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget{
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() =>_LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister>{
  // initially ,show login page
  bool showLoginPage = true;
  // toggle between login and register page
  void togglePages(){
    setState( (){
      showLoginPage=!showLoginPage;
    }
    );
  }

  @override
  Widget build(BuildContext context){
    if (showLoginPage){
      return LoginPage(onTap: togglePages);
    }
    else{
      return RegisterPage(onTap: togglePages);
    }
  }
}*/