import 'package:android_nga_flutter/ciphers/caesar.dart';
import 'package:flutter/material.dart';

class HomeCaesar extends StatelessWidget {
  const HomeCaesar({super.key});

   @override
Widget build(BuildContext context) {
  return Container(
    height: 250, // Adjusted the height to a smaller size
    decoration: BoxDecoration(  
      color: const Color.fromARGB(155, 5, 150, 150), // Background color
      borderRadius: BorderRadius.circular(12),
       border: Border.all( // Added border
        color: Colors.black, // Border color
        width: 2.0,         // Border width
      ),
    ),
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(20),
    width: 320,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(115, 10, 110, 102), // Background color
                    borderRadius: BorderRadius.circular(12),
                     border: Border.all( // Added border
                        color: Colors.black, // Border color
                        width: 1.0,         // Border width
                        ),
              boxShadow: [
                  BoxShadow(
                   color: const Color.fromARGB(255, 193, 199, 199).withOpacity(0.5), // Shadow color with transparency
                       spreadRadius: 10, // How far the shadow spreads
                            blurRadius: 5, // How soft the shadow is
                                offset: Offset(0, 3), // Position of the shadow (x, y)
                               ),
                  ],
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  "assets/CIP2.png", // Use the instance's imagePath
                  fit: BoxFit.cover, // Ensure the image fits properly
                ),
              ),
            ),
            const SizedBox(height: 20), // Reduced spacing to fit smaller height
            Text(
              "CAESAR CIPHER",
              style: const TextStyle(
                 color: Color.fromARGB(255, 2, 58, 68), // Change to the desired color
                fontWeight: FontWeight.bold,
                fontSize: 20, // Adjusted font size to fit smaller height
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "The Caesar Cipher is one of the simplest and oldest methods of encrypting messages, named after Julius Caesar.",
              style: TextStyle(
                 color: const Color.fromARGB(255, 0, 0, 0), // Change to the desired colors
                fontSize: 14, // Adjusted font size for better fit
              ),
            ),
          ],
        ),
        const SizedBox(height: 15), // Reduced spacing to fit smaller height
        Row(
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to another file or screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Caesar(), // Replace with your target screen widget
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(115, 3, 66, 61),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed:
                      null, // Optional: Disable IconButton since GestureDetector handles the tap
                  icon: const Icon(Icons.arrow_forward),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
}