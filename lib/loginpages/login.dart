import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:android_flutter/components/button.dart';
import 'package:flutter/material.dart';
import 'package:android_flutter/components/textfield.dart';
import 'package:android_flutter/signup/signup.dart';
import 'dart:convert';
import 'package:android_flutter/entities/userCont.dart';
import 'package:android_flutter/homepage/homepage.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final userController = TextEditingController();

  final passController = TextEditingController();

  // Initialize UserController to manage user data
  final UserController _controller = UserController();

  // Login user method to validate input
  Future<void> loginUser() async {
    // Check if the fields are empty
    if (userController.text.isEmpty || passController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in both fields')),
      );
      return;
    }

    // Check if the user exists (you can load user data from a file or SharedPreferences)
    bool isValid =
        await _validateCredentials(userController.text, passController.text);

    if (isValid) {
      // Show success message and navigate to next screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );

      // Navigate to the home screen (replace with your home screen widget)
      Navigator.pushReplacement(
        context,

        // TODO adding homepage
        MaterialPageRoute(builder: (_) => Homepage()),
      );
    } else {
      // Show error message if credentials are incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  // Method to validate user credentials
  Future<bool> _validateCredentials(String username, String password) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/userData.json');

      if (await file.exists()) {
        // Read the user data from the file
        final jsonString = await file.readAsString();
        final Map<String, dynamic> userData = jsonDecode(jsonString);

        // Check if username and password match
        if (userData['userName'] == username &&
            userData['passWord'] == password) {
          return true; // Credentials are valid
        }
      }
    } catch (e) {
      print('Error validating credentials: $e');
    }
    return false; // Return false if validation fails
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(height: 50),

              const Text(
                'Hello! Welcome Back',
                style: TextStyle(
                  color: Color.fromARGB(255, 66, 66, 66),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 50),

              // Username TextField
              MyTextField(
                controller: userController,
                hintText: 'Username',
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input your Username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password TextField
              MyTextField(
                controller: passController,
                hintText: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input your Password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              // Sign In Button
              Button(
                onTap: loginUser,
              ),
              const SizedBox(height: 30),

              // Sign Up Option
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have an Account?"),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                SignUpScreen(controller: _controller)),
                      );
                    },
                    child: const Text(
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
