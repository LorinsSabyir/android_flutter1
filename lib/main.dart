import 'package:android_nga_flutter/login/login.dart';
import 'package:android_nga_flutter/ciphers/atbash.dart';
import 'package:flutter/material.dart';
import 'package:android_nga_flutter/ciphers/caesar.dart';
import 'package:android_nga_flutter/dashboard/dashboard.dart';

//import 'package:android_nga_flutter/ciphers/atbash.dart';

void main() {
  runApp(MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}