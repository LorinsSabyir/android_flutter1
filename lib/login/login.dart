import 'package:flutter/material.dart';
import 'package:android_nga_flutter/home/home_page.dart';
import 'package:android_nga_flutter/components/textfield.dart';
import 'package:android_nga_flutter/signup/signup.dart';
import 'package:android_nga_flutter/entity/userCont.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userController = UserController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // For form validation

  Future<void> loginUser() async {
    if (_formKey.currentState?.validate() == true) {
      try {
        print('Attempting login...');
        final user = await _userController.loginUser(
          _usernameController.text.trim(),
          _passwordController.text.trim(),
        );

        if (user != null) {
          // Loading screen
          showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          );

          print('Login successful for user: ${user.userName}');

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login successful!')),
          );

          // Navigate to the HomePage with the current user's data
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(currentUser: user), // Pass user object
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid username or password')),
          );
        }
      } catch (e) {
        print('Error during login: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $e')),
        );
      }
    } else {
      print('Form validation failed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/darkteal.jpg'),
              fit: BoxFit.cover,
            )          
          ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // Logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(height: 50),

                  const Text(
                    'Hello! Welcome Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Username TextField
                  Textfield(
                    controller: _usernameController,
                    hintText: 'Username',
                    obscureText: false,
                    icon: Icons.lock,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input your Username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Password TextField
                  Textfield(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    icon: Icons.lock,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input your Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  // Login  Button
                  Padding(  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  
                  child: ElevatedButton(
                    onPressed: loginUser, // Call the login function
                      style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // Use transparent background
                      padding: EdgeInsets.zero,            // Remove default padding
                      shadowColor: Colors.transparent,    // Remove default shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Match the border radius
                      ),
                    ),
                    child: Container(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF08B1D8), // Light Blue
                      Color(0xFF0C8DAC), // Teal
                    ],
                    begin: Alignment.topLeft, // Starting point of the gradient
                    end: Alignment.bottomRight, // Ending point of the gradient
                  ),
                  borderRadius: BorderRadius.circular(10), // Same border radius
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF0C8DAC),
                      offset: const Offset(4.2, 4.2),
                      blurRadius: 15.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ),
              ),

              const SizedBox(height: 20),

                   // Sign Up Option
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have an Account?",
                      style: TextStyle(
                        fontSize: 15
                      ),),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Signup()),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
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
    ),
    );

  }
}
