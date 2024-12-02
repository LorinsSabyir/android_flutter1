import 'package:flutter/material.dart';
import 'package:android_flutter/components/submitButton.dart';
import 'package:android_flutter/components/textfield.dart';
import 'package:android_flutter/loginpages/login.dart';
import 'package:android_flutter/entities/userCont.dart';

class SignUpScreen extends StatefulWidget {
  final UserController controller;

  const SignUpScreen({super.key, required this.controller});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Text Editing Controllers
  final name = TextEditingController();
  final last = TextEditingController();
  final userController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'CREATE YOUR ACCOUNT!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Full name fields
                  Row(
                    children: [
                      Expanded(
                        child: MyTextField(
                          controller: name,
                          hintText: 'First Name',
                          obscureText: false,
                        ),
                      ),
                      Expanded(
                        child: MyTextField(
                          controller: last,
                          hintText: 'Last Name',
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  MyTextField(
                    controller: userController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  const SizedBox(height: 20),

                  MyTextField(
                    controller: passController,
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),

                  MyTextField(
                    controller: confirmPassController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),

                  // Sign Up Button
                  SubmitButton(
                    controller: widget.controller,
                    formKey: _formKey, // Pass the form key
                  ),
                  const SizedBox(height: 30),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already Have an Account?"),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Login()),
                          );
                        },
                        child: const Text(
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
        ),
      ),
    );
  }
}
