import 'package:flutter/material.dart';
import 'package:android_flutter/components/button.dart';
import 'package:android_flutter/components/textfield.dart';
import 'package:android_flutter/loginpages/login.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //text editing controller
  final name = TextEditingController();

  final last = TextEditingController();

  final userController = TextEditingController();

  final passController = TextEditingController();

  //Login User Button method
  void loginUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),

              //logo
              Icon(
                Icons.lock,
                size: 100,
              ),
              SizedBox(height: 20),

              //welcomeback
              Text(
                'CREATE YOUR ACCOUNT!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),

              // TODO get user name input
              // Full name
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      controller: name, // Use a separate controller
                      hintText: 'Your First Name',
                      obscureText: false,
                    ),
                  ),
                  Expanded(
                    child: MyTextField(
                      controller: last, // Use a different controller
                      hintText: 'Last Name',
                      obscureText: false,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // TODO get username input
              //Username
              MyTextField(
                controller: userController,
                hintText: 'Username',
                obscureText: false,
              ),
              SizedBox(height: 20),

              // TODO get password input
              //password textfield
              MyTextField(
                controller: passController,
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 30),

              // TODO submit button functionality
              //Log  in button
              Button(
                onTap: loginUser,
              ),
              SizedBox(height: 30),

              // register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have an Account?",
                    overflow:
                        TextOverflow.ellipsis, // Prevents text from overflowing
                  ),
                  const SizedBox(
                      width: 6), // Adds spacing between the text elements
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Login()),
                      );
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
