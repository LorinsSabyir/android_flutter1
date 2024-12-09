import 'package:android_nga_flutter/ciphers/vigenere.dart';
import 'package:flutter/material.dart';

class HomeVigenere extends StatelessWidget {
  const HomeVigenere({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
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
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.asset(
                    "assets/IM3.jpg", // Use the instance's imagePath
                    fit: BoxFit.cover, // Ensure the image fits properly
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                "Vigenere Cipher",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "A polyalphabetic cipher that uses a keyword to vary the shift, it is stronger than Caesar but still vulnerable to modern cryptanalysis without the key.",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to another file or screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Vigenere()// Replace with your target screen widget
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
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
