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

class UserDashboard extends StatelessWidget {
  // Function to pick an image
  void pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      print('Picked file path: ${pickedFile.path}');
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingControllers for text fields
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

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
                backgroundImage: AssetImage('assets/lorenz.png'),
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
              ),
              buildTextField(
                controller: phoneController,
                label: 'Change Phone',
                icon: Icons.phone,
              ),
              buildTextField(
                controller: passwordController,
                label: 'Change Password',
                icon: Icons.lock,
                obscureText: true,
              ),
              buildTextField(
                controller: addressController,
                label: 'Edit Address',
                icon: Icons.home,
              ),
              SizedBox(height: 16),

              // Configurable Save Button
              buildSaveButton(
                context: context,
                usernameController: usernameController,
                phoneController: phoneController,
                passwordController: passwordController,
                addressController: addressController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Button builder function in pick gallery and pick camera
Widget buildButton({
  required String title,
  required IconData icon,
  required VoidCallback onClicked,
}) {
  return Container(
    width: 250, // Limit button width
    margin: EdgeInsets.symmetric(vertical: 8.0), // Add spacing between buttons
    decoration: BoxDecoration(
      borderRadius:
          BorderRadius.circular(30), // Rounded corners for the container
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // Shadow color
          spreadRadius: 2, // How wide the shadow spreads
          blurRadius: 6, // How soft the shadow looks
          offset: Offset(2, 4), // Shadow position (x, y)
        ),
      ],
    ),
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // same radius kada textbox
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

// Text field builder function
Widget buildTextField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  bool obscureText = false,
}) {
  return Container(
    width: 250, // Limit text field width
    margin:
        EdgeInsets.symmetric(vertical: 8.0), // Add spacing between text fields
    decoration: BoxDecoration(
      borderRadius:
          BorderRadius.circular(30), // Rounded corners for the container
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // shadow color sa textbox
          spreadRadius: 2, // unsa ka wide and radius sa textbox
          blurRadius: 6, // soft shadow niya
          offset: Offset(2, 4), // Shadow position niya (x, y)
        ),
      ],
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white, // Set background color for the text field
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.transparent), // No border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide:
              BorderSide(color: Colors.transparent), // Highlighted border
        ),
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(icon, color: Colors.black),
      ),
      obscureText: obscureText,
    ),
  );
}

// Editable Save Button
// Editable Save Button with Modern Styling
Widget buildSaveButton({
  required BuildContext context,
  required TextEditingController usernameController,
  required TextEditingController phoneController,
  required TextEditingController passwordController,
  required TextEditingController addressController,
}) {
  return ElevatedButton(
    onPressed: () {
      print('Information saved:');
      print('Username: ${usernameController.text}');
      print('Phone: ${phoneController.text}');
      print('Password: ${passwordController.text}');
      print('Address: ${addressController.text}');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('All information saved successfully!'),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      // Button shape
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0), // Makes the button rounded
      ),
      // Button padding
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
      // Button background and foreground color
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      // Button shadow
      elevation: 10,
      // Button text style
      textStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Ensures the text color
      ),
    ),
    child: Text('Save'),
  );
}
