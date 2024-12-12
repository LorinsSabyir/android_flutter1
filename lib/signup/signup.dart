import 'package:android_nga_flutter/components/textfield.dart';
import 'package:android_nga_flutter/entity/userCont.dart';
import 'package:flutter/material.dart';
import 'package:android_nga_flutter/login/login.dart';

class Signup extends StatelessWidget {
  final _userController = UserController();

  // Text Editing Controllers
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/darkteal.jpg'),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/l.png',
                      width: 200,
                      height: 200,
                    ),
                    const Text(
                      'CREATE YOUR ACCOUNT',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),

                    // Full name fields
                    Row(
                      children: [
                        Expanded(
                          child: Textfield(
                            controller: _firstNameController,
                            hintText: 'Firstname',
                            obscureText: false,
                            icon: Icons.account_circle,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please input your Firstname';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          child: Textfield(
                            controller: _lastNameController,
                            hintText: 'Lastname',
                            obscureText: false,
                            icon: Icons.account_circle,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please input your Lastname';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Username textfield
                    Textfield(
                      controller: _usernameController,
                      hintText: 'Username',
                      obscureText: false,
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input your Username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Password fields with validation
                    Textfield(
                      controller: _passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      icon: Icons.vpn_key,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input your Password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Textfield(
                      controller: _confirmPassController,
                      hintText: 'Confirm Password',
                      obscureText: true,
                      icon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),

                    // Sign Up Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() == true) {
                            try {
                              await _userController.registerUser(
                                _firstNameController.text.trim(),
                                _lastNameController.text.trim(),
                                _usernameController.text.trim(),
                                _passwordController.text.trim(),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('User registered successfully'),
                                  backgroundColor: Colors.green,
                                ),
                              );

                              // Clear the text fields after success
                              _firstNameController.clear();
                              _lastNameController.clear();
                              _usernameController.clear();
                              _passwordController.clear();
                              _confirmPassController.clear();

                              // Navigate to login page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const Login()),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    e.toString().contains('User already exists')
                                        ? 'This username is already taken'
                                        : 'An error occurred. Please try again.',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.transparent, // Use custom background
                          padding: EdgeInsets.zero, // Remove default padding
                          shadowColor: Colors.transparent, // Remove shadow
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          // margin: EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF08B1D8), // Light Blue
                                Color(0xFF0C8DAC), // Teal
                              ],
                              begin: Alignment
                                  .topLeft, // Starting point of the gradient
                              end: Alignment
                                  .bottomRight, // Ending point of the gradient
                            ), // Custom background color
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 2.0, // Border width
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Login redirect
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already Have an Account?"),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const Login()),
                            );
                          },
                          child: const Text(
                            "Log In",
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
