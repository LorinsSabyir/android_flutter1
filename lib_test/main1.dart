import 'package:flutter/material.dart';
import 'form.dart'; // Assume this file contains the UserForm class
import 'userCont.dart'; // Assume this file contains the UserController class
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserCont();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('User Form Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: UserForm(controller: userController),
        ),
      ),
    );
  }
}
