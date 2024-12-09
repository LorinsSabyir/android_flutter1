import 'package:flutter/material.dart';
import 'package:android_flutter/ciphers/threeciphers.dart';
import 'package:provider/provider.dart'; 
import 'package:android_flutter/pages/dashboard_page.dart';
import 'package:android_flutter/pages/home_page.dart';
import 'package:android_flutter/themes/light_mode.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/home_page': (context) => const HomePage(),
        '/dashboard_page': (context) => const DashboardPage(),
      },
    );
  }
}
