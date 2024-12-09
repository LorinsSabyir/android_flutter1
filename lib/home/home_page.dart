import 'package:android_nga_flutter/home/home_atbash.dart';
import 'package:android_nga_flutter/home/home_ceasar.dart';
import 'package:android_nga_flutter/home/home_vigenere.dart';
import 'package:android_nga_flutter/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(height: 25),

          // Title
          Center(
            child: Text(
              "Choose cipher techniques that you want to try!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Horizontal product list
          SizedBox(
            height: 590,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              children: [
                HomeAtbash(),
                HomeCaesar(),
                HomeVigenere(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
