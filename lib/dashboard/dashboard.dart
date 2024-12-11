import 'package:android_nga_flutter/entity/userCont.dart';
import 'package:android_nga_flutter/login/login.dart';
import 'package:flutter/material.dart';
import 'package:android_nga_flutter/components/textfield.dart';
import 'package:android_nga_flutter/entity/userModel.dart';

class Dashboard extends StatelessWidget {
  final User currentUser;

  // Initialize controllers with user data
  Dashboard({required this.currentUser, Key? key}) : super(key: key);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final passWordController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Populate controllers with the user's current data
    firstNameController.text = currentUser.firstName ?? '';
    lastNameController.text = currentUser.lastName ?? '';
    userNameController.text = currentUser.userName ?? '';
    passWordController.text = currentUser.passWord ?? '';
    confirmPassController.text = currentUser.passWord ?? '';

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
                backgroundImage: AssetImage('assets/placeholder.png')
                    as ImageProvider, // Dummy user photo
                onBackgroundImageError: (_, __) =>
                    print('Error loading profile picture'),
              ),
              SizedBox(height: 16),
              Text(
                '${currentUser.firstName ?? 'First Name'} ${currentUser.lastName ?? 'Last Name'}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                '${currentUser.userName ?? 'Username'}',
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
                children: [
                  // Update Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print('User data updated for: ${currentUser.userName}');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Information updated successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: Text('Update'),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Delete user Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        // Confirm deletion with a dialog
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Delete Account'),
                              content: const Text(
                                  'Are you sure you want to delete your account? This action cannot be undone.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(
                                      context, false), // Cancel deletion
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(
                                      context, true), // Confirm deletion
                                  child: const Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );

                        // Proceed with deletion if confirmed
                        if (confirm == true) {
                          try {
                            final userController = UserController();
                            await userController
                                .deleteUser(currentUser); // Delete user logic

                            // Show success message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Account deleted successfully'),
                                backgroundColor: Colors.green,
                              ),
                            );

                            // Navigate back to login screen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const Login()),
                            );
                          } catch (e) {
                            // Handle errors
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Failed to delete account: $e'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Delete'),
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
