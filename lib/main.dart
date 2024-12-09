import 'package:flutter/material.dart';
import 'loginpages/login.dart';
import 'package:android_flutter/ciphers/threeciphers.dart';
import 'package:provider/provider.dart'; 
import 'package:android_flutter/loginpages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Login(),
    );
  }
}