import 'package:flutter/material.dart';
import 'package:htfnew/pages/splash_screen2.dart';


  // Make sure this is your home or next page after login

class SetPassword extends StatelessWidget {
  const SetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Accounts'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 41, 10, 105)
      ),
      body: SingleChildScrollView(
        child: Padding(
          //padding: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Set Password',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
             
              Text(
                'Welcome to Care Plus.Your health is on check with us ,brings the better in you.',
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
               Text(
                '  ',
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
              Text(
                'Password.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize:16, fontWeight: FontWeight.bold,color: Colors.grey[800]),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: '.............',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
               Text(
                '  ',
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
                             
              Text(
                ' Confirm Password.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize:16, fontWeight: FontWeight.bold,color: Colors.grey[800]),
              ),
              
              const SizedBox(height: 10),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '..............',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const SplashScreen2()), // Assuming 'HomePage' is your home screen widget
                    );
                  },
                    style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18),
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 41, 10, 105),
                    padding: const EdgeInsets.symmetric(vertical: 12)
                    
                  ),
                  child: const Text('Create New Password'),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
