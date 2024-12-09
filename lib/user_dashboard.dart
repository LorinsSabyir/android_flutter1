import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserDashboard(),
    );
  }
}

class UserDashboard extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  File? _pickedImage;

  // Validation flags
  bool isUsernameValid = true;
  bool isFirstnameValid = true;
  bool isLastnameValid = true;
  bool isPasswordValid = true;

  // Function to pick an image
  void pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _pickedImage = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  // Function to validate fields
  bool validateFields() {
    setState(() {
      isUsernameValid = usernameController.text.isNotEmpty;
      isFirstnameValid = firstnameController.text.isNotEmpty;
      isLastnameValid = lastnameController.text.isNotEmpty;
      isPasswordValid = passwordController.text.length >= 6;
    });

    return isUsernameValid &&
        isFirstnameValid &&
        isLastnameValid &&
        isPasswordValid;
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
                backgroundImage: _pickedImage != null
                    ? FileImage(_pickedImage!)
                    : AssetImage('assets/placeholder.png') as ImageProvider,
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

              // Buttons for image selection
              buildButton(
                title: 'Pick Gallery',
                icon: Icons.image_outlined,
                onClicked: () => pickImage(ImageSource.gallery),
              ),
              SizedBox(height: 10),
              buildButton(
                title: 'Pick Camera',
                icon: Icons.camera_alt_outlined,
                onClicked: () => pickImage(ImageSource.camera),
              ),
              SizedBox(height: 20),
              Divider(),

              // Text fields for user information
              buildTextField(
                controller: usernameController,
                label: 'Change Username',
                icon: Icons.person,
                isValid: isUsernameValid,
              ),
              buildTextField(
                controller: firstnameController,
                label: 'Change Firstname',
                icon: Icons.person_outline,
                isValid: isFirstnameValid,
              ),
              buildTextField(
                controller: lastnameController,
                label: 'Change Lastname',
                icon: Icons.person_outline,
                isValid: isLastnameValid,
              ),
              buildTextField(
                controller: passwordController,
                label: 'Change Password',
                icon: Icons.lock,
                obscureText: true,
                isValid: isPasswordValid,
              ),
              SizedBox(height: 16),

              // Save Button
              buildSaveButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // Text field builder function
  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    required bool isValid,
  }) {
    return Container(
      width: 250,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(icon, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: isValid ? Colors.transparent : Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: isValid ? Colors.black : Colors.red,
            ),
          ),
        ),
        obscureText: obscureText,
      ),
    );
  }

  // Save button
  Widget buildSaveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (validateFields()) {
          print('Information saved successfully!');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('All information saved successfully!'),
              backgroundColor: Colors.green, // Success Snackbar color
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please fill up the required information!'),
              backgroundColor: Colors.red, // Error Snackbar color
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 10,
        textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      child: Text('Save'),
    );
  }

// Button builder function
  Widget buildButton({
    required String title,
    required IconData icon,
    required VoidCallback onClicked,
  }) {
    return Container(
      width: 250,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
          textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        icon: Icon(icon, size: 24),
        label: Text(title),
        onPressed: onClicked,
      ),
    );
  }
}
