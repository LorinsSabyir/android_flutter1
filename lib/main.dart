import 'package:flutter/material.dart';
import 'test/cipher/atbash.dart'; // Adjust the import path based on your project structure
import 'test/cipher/caesar.dart';
import 'test/cipher/vigenere.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Atbash Cipher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Vigenere(), // Load the Atbash screen
    );
  }
}
