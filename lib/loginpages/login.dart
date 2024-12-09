import 'dart:io';

import 'package:android_flutter/components/button.dart';
import 'package:flutter/material.dart';
import 'package:android_flutter/components/textfield.dart';
import 'package:android_flutter/signup/signup.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //text editing controller
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

              //TODO change the logo
              Icon(
                Icons.lock,
                size: 100,
              ),
              SizedBox(height: 50),

              //welcome back
              Text(
                'Hello! Welcome Back',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 50),

              //TODO get user input 
              //username textfield
              MyTextField(
                controller: userController,
                hintText: 'Username',
                obscureText: false,
              ),
              SizedBox(height: 20),

              // TODO get user input
              //password textfield
              MyTextField(
                controller: passController,
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(height: 15),

              // TODO sumbit and verify user input to the json
              //sign in button
              Button(
                onTap: loginUser,
              ),
              SizedBox(height: 30),

              // register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have an Account?",
                    overflow:
                        TextOverflow.ellipsis, // Prevents text from overflowing
                  ),
                  const SizedBox(
                      width: 6), // Adds spacing between the text elements
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      "Sign Up",
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
