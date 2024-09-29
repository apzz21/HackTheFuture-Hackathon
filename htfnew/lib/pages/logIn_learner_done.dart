import 'package:flutter/material.dart';
import 'package:htfnew/pages/student_home_page.dart';


  // Make sure this is your home or next page after login

class HelloLearner extends StatelessWidget {
  const HelloLearner ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('Hello Learner'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 41, 10, 105)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                  'Welcome',
                   textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                     ),
              ),
            
             
              Text(
                'E-mail or Mobile Number.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize:16, fontWeight: FontWeight.bold,color: Colors.grey[800]),
              ),
             
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email or Mobile Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
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
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password screen action
                  },
                  child: const Text('Forget Password?'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  StudentHomePagenew()));
                  },
                    style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18,color: Colors.white,),
                    foregroundColor: Colors.white,
                    backgroundColor:const Color.fromARGB(255, 41, 10, 105),
                    padding: const EdgeInsets.symmetric(vertical: 12)
                    
                  ),
                  child: const Text('Log In'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('or '),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  
                  
                      Center(
                        child: IconButton(
                        icon: const Icon(Icons.fingerprint, size: 40),
                         onPressed: () {
                            // Your sign-in logic here
                         },
                         ),
                      )

                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    // Navigate to sign up page
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}