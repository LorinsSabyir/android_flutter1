import 'package:flutter/material.dart';
import 'package:android_nga_flutter/components/cypher_textfield.dart';
import 'package:android_nga_flutter/components/cypher_result.dart';
import 'package:android_nga_flutter/components/cypher_button.dart';

class Vigenere extends StatefulWidget {
  @override
  State<Vigenere> createState() => _VigenereState();
}

class _VigenereState extends State<Vigenere> {
  final messageController = TextEditingController();
  final keyController = TextEditingController();
  String resultText = "";

  // Function to format key to match message length
  String generateKey(String message, String key) {
    int messageLen = message.length;
    StringBuffer newKey = StringBuffer();

    for (int i = 0, j = 0; i < messageLen; i++) {
      if (message[i].toUpperCase().contains(RegExp(r'[A-Z]'))) {
        newKey.write(key[j % key.length].toUpperCase());
        j++;
      } else {
        newKey.write(message[i]); // Keep non-alphabetic characters
      }
    }
    return newKey.toString();
  }

  // Vigenere Cipher Logic
 String vigenereCipher(String message, String key, bool encrypt) {
  String formattedKey = generateKey(message, key);
  StringBuffer result = StringBuffer();

  for (int i = 0; i < message.length; i++) {
    if (message[i].toUpperCase().contains(RegExp(r'[A-Z]'))) {
      int shift = formattedKey[i].codeUnitAt(0) - 65;
      bool isUpperCase = message[i].toUpperCase() == message[i];
      int base = isUpperCase ? 65 : 97;

      int offset = encrypt
          ? (message[i].codeUnitAt(0) - base + shift) % 26
          : (message[i].codeUnitAt(0) - base - shift + 26) % 26;

      result.write(String.fromCharCode(base + offset));
    } else {
      result.write(message[i]); // Keep special characters unchanged
    }
  }
  return result.toString();
}


  // Encryption Function
  void encrypt() {
    setState(() {
      final message = messageController.text;
      final key = keyController.text;

      if (message.isNotEmpty && key.isNotEmpty) {
        resultText = vigenereCipher(message, key, true);
      } else {
        resultText = "Please enter both message and key.";
      }
    });
  }

  // Decryption Function
  void decrypt() {
    setState(() {
      final message = messageController.text;
      final key = keyController.text;

      if (message.isNotEmpty && key.isNotEmpty) {
        resultText = vigenereCipher(message, key, false);
      } else {
        resultText = "Please enter both message and key.";
      }
    });
  }

  // Clear Input Fields
  void clearText() {
    setState(() {
      messageController.clear();
      keyController.clear();
      resultText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.1),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 100,
              ),
              SizedBox(height: 20),
              Text(
                'This is Vigenere Cipher',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              MyTextField(
                controller: messageController,
                hintText: 'Enter Message Here',
                obscureText: false,
                maxLines: 5,
              ),
              SizedBox(height: 25),
              MyTextField(
                controller: keyController,
                hintText: 'Key',
                obscureText: false,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    onTap: encrypt,
                    label: 'Encrypt',
                    width: 100,
                  ),
                  Button(
                    onTap: decrypt,
                    label: 'Decrypt',
                    width: 100,
                  ),
                  Button(
                    onTap: clearText,
                    label: 'Clear',
                    color: Color.fromARGB(255, 143, 20, 12),
                    width: 100,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Result(resultText: resultText),
            ],
          ),
        ),
      ),
    );
  }
}
