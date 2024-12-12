import 'package:android_nga_flutter/entity/userCont.dart';
import 'package:android_nga_flutter/login/login.dart';
import 'package:flutter/material.dart';
import 'package:android_nga_flutter/components/textfield.dart';
import 'package:android_nga_flutter/entity/userModel.dart';

class Dashboard extends StatefulWidget {
  final User currentUser;

  // Initialize controllers with user data
  Dashboard({required this.currentUser, super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController userNameController;
  late TextEditingController passWordController;
  late TextEditingController confirmPassController;

  @override
  void initState() {
    super.initState();
    firstNameController =
        TextEditingController(text: widget.currentUser.firstName ?? '');
    lastNameController =
        TextEditingController(text: widget.currentUser.lastName ?? '');
    userNameController =
        TextEditingController(text: widget.currentUser.userName ?? '');
    passWordController =
        TextEditingController(text: widget.currentUser.passWord ?? '');
    confirmPassController =
        TextEditingController(text: widget.currentUser.passWord ?? '');
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    passWordController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'User Dashboard',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.black.withOpacity(0.1),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile section
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/Aqua Blue - PFP.jpg')
                    as ImageProvider, // Dummy user photo
                onBackgroundImageError: (_, __) =>
                    print('Error loading profile picture'),
              ),
              SizedBox(height: 16),
              Text(
                '${widget.currentUser.firstName ?? 'First Name'} ${widget.currentUser.lastName ?? 'Last Name'}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                widget.currentUser.userName ?? 'Username',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 25),
              Divider(),

              // Text fields for user information
              Row(
                children: [
                  Expanded(
                    child: Textfield(
                      controller: firstNameController,
                      hintText: 'Firstname',
                      obscureText: false,
                      icon: Icons.person,
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
                      controller: lastNameController,
                      hintText: 'Lastname',
                      obscureText: false,
                      icon: Icons.person,
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
              Textfield(
                controller: userNameController,
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
              Textfield(
                controller: passWordController,
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
              const SizedBox(height: 20),
              Textfield(
                controller: confirmPassController,
                hintText: 'Confirm Password',
                obscureText: true,
                icon: Icons.lock,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passWordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Button Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Update Button
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0), // Add padding
                      child: ElevatedButton(
                        onPressed: () async {
                          // Update logic...
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF08B1D8),
                                Color(0xFF0C8DAC),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Update',
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
                  ),

                  // Spacing between buttons
                  const SizedBox(width: 15), // Adjust width as needed

                  // Delete Button
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0), // Add padding
                      child: ElevatedButton(
                        onPressed: () async {
                          // Delete logic...
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 255, 0, 0),
                                Color.fromARGB(255, 228, 56, 56),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Delete',
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
