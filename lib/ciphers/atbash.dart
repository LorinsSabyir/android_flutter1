import 'package:flutter/material.dart';
import 'package:android_nga_flutter/components/cypher_textfield.dart';
import 'package:android_nga_flutter/components/cypher_result.dart';
import 'package:android_nga_flutter/components/cypher_button.dart';


class Atbash extends StatefulWidget {
  @override
  State<Atbash> createState() => _AtbashState();
}

class _AtbashState extends State<Atbash> {
  final inputController = TextEditingController();
  String resultText = "";

  // Atbash Cipher logic
  String atbashCipher(String input) {
    String result = '';
    for (int i = 0; i < input.length; i++) {
      if (input[i].toLowerCase() != input[i].toUpperCase()) {
        int charCode = input[i].codeUnitAt(0);
        if (charCode >= 97 && charCode <= 122) {
          charCode = 219 - charCode;
        } else if (charCode >= 65 && charCode <= 90) {
          charCode = 155 - charCode;
        }
        result += String.fromCharCode(charCode);
      } else {
        result += input[i];
      }
    }
    return result;
  }

  // Method to handle encryption/decryption
  void processText() {
    setState(() {
      resultText = atbashCipher(inputController.text);
    });
  }

  // Method to clear input and output
  void clearText() {
    setState(() {
      inputController.clear();
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
                'This is Atbash Cipher',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),
              // Input text field
              MyTextField(
                controller: inputController,
                hintText: 'Enter Message Here',
                obscureText: false,
              ),
              SizedBox(height: 30),
              // Buttons for processing and clearing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    onTap: processText, 
                    label: 'Translate',
                    width: 180,),
                  SizedBox(width:10),
                  Button(
                  onTap: clearText, 
                  label: 'Clear',
                  color: Color.fromARGB(255, 143, 20, 12),
                  width: 180,),
                ],
              ),
              SizedBox(height: 30),
              // Display the result
              Result(resultText: resultText),
            ],
          ),
        ),
      ),
    );
  }
}
