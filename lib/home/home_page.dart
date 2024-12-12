import 'package:android_nga_flutter/entity/userModel.dart';
import 'package:android_nga_flutter/home/home_atbash.dart';
import 'package:android_nga_flutter/home/home_ceasar.dart';
import 'package:android_nga_flutter/home/home_vigenere.dart';
import 'package:android_nga_flutter/components/my_drawer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  final User currentUser;

  const HomePage({Key? key, required this.currentUser}) : super(key: key);

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
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/ba1.png"), // Path to your image
          fit: BoxFit.cover, // Ensures the image covers the entire background
        ),
      ),
<<<<<<< HEAD
      child: ListView(
=======
      drawer: MyDrawer(currentUser: currentUser), // Pass currentUser to MyDrawer
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
>>>>>>> 51121275734b344d9682ae464e4fa5974f6b80d4
        children: [
          const SizedBox(height: 25),

          // Title
          Center(
            child: Padding(
              padding: EdgeInsets.all(20.0), // Sets padding of 20 on all sides
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