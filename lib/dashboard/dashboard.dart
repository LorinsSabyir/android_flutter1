import 'package:flutter/material.dart';
import 'package:android_nga_flutter/components/textfield.dart';

class Dashboard extends StatelessWidget {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final passWordController = TextEditingController();
  final confirmPassController = TextEditingController();

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
                backgroundImage: AssetImage('assets/placeholder.png')
                    as ImageProvider, //TODO add a dummy user photo
                onBackgroundImageError: (_, __) => print('Image load error'),
              ),
              SizedBox(height: 16),
              Text(
                'Lorenz',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'lorenz.gomelan@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              SizedBox(height: 25),

              Divider(),

              // Text fields for user information
              // Firstname textfield
              Row(
                children: [
                  Expanded(
                    child:
                        // Firstname textfield
                        Textfield(
                      controller: firstNameController,
                      hintText: 'Firstname',
                      obscureText: false,
                      icon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input your Firstname';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child:
                        // Lastname textfield
                        Textfield(
                      controller: lastNameController,
                      hintText: 'Lastname',
                      obscureText: false,
                      icon: Icons.lock,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input your Lastname';
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // Username textfield
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

              // Password textfield
              Textfield(
                controller: passWordController,
                hintText: 'Password',
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

              // Button
              Row(
                children: [
                  
                  //Update Button
                  Expanded(
                    child: 
                        ElevatedButton(
                      onPressed: () {
                        if (true) {
                          print('Information saved successfully!');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('All information saved successfully!'),
                              backgroundColor:
                                  Colors.green, // Success Snackbar color
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        // margin: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Update',
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

                  // Delete button
                  Expanded(
                    child: 
                        ElevatedButton(
                      onPressed: () {
                        if (true) {
                          print('Information saved successfully!');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('All information saved successfully!'),
                              backgroundColor:
                                  Colors.green, // Success Snackbar color
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        // margin: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 0, 0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Exit',
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
