  import 'package:flutter/material.dart';

void main() {
  runApp(AtbashApp());
}

class AtbashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AtbashScreen(),
    );
  }
}

class AtbashScreen extends StatefulWidget {
  @override
  _AtbashScreenState createState() => _AtbashScreenState();
}

class _AtbashScreenState extends State<AtbashScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _convertedText = '';

  // Function to perform Atbash cipher conversion
  String atbashCipher(String input) {
    const String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String reversedAlphabet = 'ZYXWVUTSRQPONMLKJIHGFEDCBA';

    // Create a map for efficient letter substitution
    final Map<String, String> atbashMap = {
      for (int i = 0; i < alphabet.length; i++)
        alphabet[i]: reversedAlphabet[i]
    };

    // Extend to lowercase mapping
    atbashMap.addAll({
      for (int i = 0; i < alphabet.length; i++)
        alphabet[i].toLowerCase(): reversedAlphabet[i].toLowerCase()
    });

    // Replace each letter using the Atbash cipher mapping
    return input.split('').map((char) {
      return atbashMap[char] ?? char; // Non-alphabetic characters remain unchanged
    }).join('');
  }

  // Handle button press
  void _convertText() {
    setState(() {
      _convertedText = atbashCipher(_inputController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atbash Cipher Converter'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Input Text Field
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                labelText: 'Enter text',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Convert Button
            ElevatedButton(
              onPressed: _convertText,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: const Text(
                'Convert to Atbash',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),

            // Display Converted Text
            Text(
              'Converted Text:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _convertedText,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
