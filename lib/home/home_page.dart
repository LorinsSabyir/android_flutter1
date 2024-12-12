import 'package:android_nga_flutter/entity/userModel.dart';
import 'package:android_nga_flutter/home/home_atbash.dart';
import 'package:android_nga_flutter/home/home_ceasar.dart';
import 'package:android_nga_flutter/home/home_vigenere.dart';
import 'package:android_nga_flutter/components/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User currentUser;

  const HomePage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00646C),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
      ),
      drawer: MyDrawer(currentUser: currentUser),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/ba1.png"), // Path to your image
            fit: BoxFit.cover, // Ensures the image covers the entire background
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(height: 25),

            // Title
            Center(
              child: Padding(
                padding:
                    EdgeInsets.all(20.0), // Sets padding of 20 on all sides
                child: Text(
                  "Choose cipher techniques that you want to try!",
                  textAlign: TextAlign.center, // Aligns the text to the center
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0), // Text color
                    fontSize: 25.0, // Text size
                    fontWeight: FontWeight.bold, // Optional: bold text
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Horizontal product list
            SizedBox(
              height: 590,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(25),
                children: [
                  HomeAtbash(),
                  HomeCaesar(),
                  HomeVigenere(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
