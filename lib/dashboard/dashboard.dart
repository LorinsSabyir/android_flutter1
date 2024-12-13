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
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Dashboard"),
        backgroundColor: Color(0xFF00646C),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Wallpaper Aesthetic.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
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
                          padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                final userController = UserController();

                                // Update user data
                                await userController.updateUser(
                                  widget.currentUser.id,
                                  firstNameController.text.trim(),
                                  lastNameController.text.trim(),
                                  userNameController.text.trim(),
                                  passWordController.text.trim(),
                                );

                                // Update the local `currentUser` object
                                widget.currentUser.firstName =
                                    firstNameController.text.trim();
                                widget.currentUser.lastName =
                                    lastNameController.text.trim();
                                widget.currentUser.userName =
                                    userNameController.text.trim();
                                widget.currentUser.passWord =
                                    passWordController.text.trim();

                                // Show success message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Information updated successfully!'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              } catch (e) {
                                // Show error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Failed to update user: $e'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 25.0),
                              decoration: BoxDecoration(
                                color: Color(0xFF1B4A56),
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
                          padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
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
                                            context, false), // Cancel
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(
                                            context, true), // Confirm
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  );
                                },
                              );

                              // Proceed if confirmed
                              if (confirm == true) {
                                try {
                                  final userController = UserController();
                                  await userController.deleteUser(
                                      widget.currentUser); // Delete user

                                  // Show success message
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Account deleted successfully'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );

                                  // Navigate back to login screen
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const Login()),
                                  );
                                } catch (e) {
                                  // Handle errors
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Failed to delete account: $e'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              }
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 25.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFAC4040),
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
        ),
      ),
    );
  }
}
