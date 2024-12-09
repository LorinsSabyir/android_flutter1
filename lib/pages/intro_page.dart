import 'package:flutter/material.dart';
import 'package:android_flutter/components/my_button.dart';
import 'dart:ui'; // for BackdropFilter

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make background transparent to show image
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background with blur effect using Container and BoxDecoration
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 9.0, sigmaY: 9.0), // Apply stronger blur
            child: Container(
              color: const Color.fromARGB(255, 113, 10, 41).withOpacity(0.2), // Add semi-transparent overlay
            ),
          ),
          
          // Center content on top of the blurred background
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Replace lock icon with image
                Image.asset(
                  'assets/redlock1.png', 
                  width: 300, 
                  height: 320, 
                ),

                const Text(
                  'Cipher Techniques', // title
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Encrypt, Decrypt & Discover", // subtitle
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),

                const SizedBox(height: 30),

                // Semi-red button with shadow
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 98, 9, 3).withOpacity(0.7), // Semi-red color
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4), // Shadow color
                        spreadRadius: 2, // Spread of the shadow
                        blurRadius: 5, // Blur effect of the shadow
                        offset: Offset(2, 2), // Shadow position
                      ),
                    ],
                  ),
                  child: MyButton(
                    onTap: () => Navigator.pushNamed(context, '/home_page'), // go to home page
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 83, 2, 2), // Icon color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
