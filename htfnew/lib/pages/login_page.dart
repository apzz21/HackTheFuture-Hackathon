
import 'package:flutter/material.dart';
import 'package:htfnew/pages/logIn_learner_done.dart';
import 'package:htfnew/pages/login_provider_done.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // This variable holds the currently selected type (Learner/Provider)
  String? selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('Log In'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 41, 10, 105)
      ,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Welcome',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              
              const Text(
                'Welcome to GoLearn. Your learning is on check with us, bringing the better in you.',
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 41, 10, 105)),
              ),
              const SizedBox(height: 20),
              Text(
                'Type',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedType,
                hint: const Text('Select Type'),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                items: <String>['Learner', 'Provider'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedType = newValue;
                  });
                },
              ),
                         
                           const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedType == 'Learner') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HelloLearner()), // Navigate to Learner login page
                      );
                    } else if (selectedType == 'Provider') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HelloProvider()), // Navigate to Provider login page
                      );
                    } else {
                      // Show an error message if no type is selected
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select a type')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18),
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 41, 10, 105),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Log In'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('or sign up with'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.g_mobiledata, size: 40),
                    onPressed: () {
                      // Google sign-in action
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.facebook, size: 40),
                    onPressed: () {
                      // Facebook sign-in action
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.fingerprint, size: 40),
                    onPressed: () {
                      // Other sign-in action
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    // Navigate to sign-up page
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




/*import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/my_button.dart';
import 'package:flutter_application_1/components/my_textfield.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class LoginPage extends StatefulWidget{

  final void Function()? onTap;
  

   const LoginPage({super.key,required this.onTap});

   @override
   State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
//text editing controllers

  final TextEditingController emilController =TextEditingController();
  final TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    return  Scaffold(
    backgroundColor :Theme.of(context).colorScheme.surface,
    body:Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //logo
        Icon(
           Icons.lock_open_outlined,
           size: 100,
           color: Theme.of(context).colorScheme.inversePrimary,
        ),

        const SizedBox(height: 25),

        //meaasage ,app slogan
         Text(
          "Health Care App",
          style:TextStyle(
          fontSize:16,
          color: Theme.of(context).colorScheme.inversePrimary,
          ),
         ),

          const SizedBox(height: 25),
          // email textfield
          MyTextField(
            controller: emilController,
            hintText: "Email",
            obscureText: false,
          ),

          const SizedBox(height: 10),
          //password textfield

          MyTextField(
            controller: passwordController,
            hintText: "Password",
            obscureText: true,
          ),

          const SizedBox(height: 10),
          //sign in page

          MyButton(
           text: "Sign In",
           onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()),); // Assuming 'HomePage' is your home screen widge
               }    
           ),


           const SizedBox(height: 25),
          //not member?register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text(
                "Not a member?",
                style:TextStyle(
                  color:Theme.of(context).colorScheme.inversePrimary),
                ) ,
                const SizedBox(width:4),
                
                
              GestureDetector(
                onTap:widget.onTap,
                child: Text(
                "Register now",
                  style:TextStyle(
                   color:Theme.of(context).colorScheme.inversePrimary,
                   fontWeight: FontWeight.bold
                   ),
                  ) ,
              ),
            ],
        ),
      ],
     )
    ),
    );
  }
}


























//var text = Text(
//                "Register now",
//                style:TextStyle(
//                color:Theme.of(context).colorScheme.inversePrimary),
//                fontWeight:FontWeight.bold,
//              );*/