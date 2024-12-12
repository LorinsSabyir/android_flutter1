import 'package:flutter/material.dart';
import 'package:android_nga_flutter/components/cypher_textfield.dart';
import 'package:android_nga_flutter/components/cypher_result.dart';
import 'package:android_nga_flutter/components/cypher_button.dart';
import 'package:flutter/services.dart';

class Caesar extends StatefulWidget {
  @override
  State<Caesar> createState() => _CaesarState();
}

class _CaesarState extends State<Caesar> {
  final TextEditingController inputController = TextEditingController();
  final TextEditingController shiftController = TextEditingController();
  String resultText = "";

  // Caesar Cipher logic
  String caesarCipher(String text, int shift, bool encrypt) {
    if (!encrypt) shift = -shift;
    return text.split('').map((char) {
      if (char.codeUnitAt(0) >= 65 && char.codeUnitAt(0) <= 90) {
        // Uppercase letters
        return String.fromCharCode((char.codeUnitAt(0) - 65 + shift) % 26 + 65);
      } else if (char.codeUnitAt(0) >= 97 && char.codeUnitAt(0) <= 122) {
        // Lowercase letters
        return String.fromCharCode((char.codeUnitAt(0) - 97 + shift) % 26 + 97);
      } else {
        // Non-alphabetic characters
        return char;
      }
    }).join('');
  }

  void encryptText() {
    setState(() {
      final text = inputController.text;
      final shift = int.tryParse(shiftController.text) ?? 0;
      resultText = caesarCipher(text, shift, true);
    });
  }

  void decryptText() {
    setState(() {
      final text = inputController.text;
      final shift = int.tryParse(shiftController.text) ?? 0;
      resultText = caesarCipher(text, shift, false);
    });
  }

  void clearText() {
    setState(() {
      inputController.clear();
      shiftController.clear();
      resultText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF00646C),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock,
                    size: 100,
                    color: Colors.grey[700],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'This is Caesar Cipher',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  MyTextField(
                    controller: inputController,
                    hintText: 'Enter Message Here',
                    obscureText: false,
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),
                  MyTextField(
                    controller: shiftController,
                    hintText: 'Enter Shift Value',
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                    //keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Button(
                        onTap: encryptText,
                        label: 'Encrypt',
                        width: 100,
                        color: Color(0xFF1B4A56),
                      ),
                      Button(
                        onTap: decryptText,
                        label: 'Decrypt',
                        width: 100,
                        color: Color(0xFF1B4A56),
                      ),
                      Button(
                        onTap: clearText,
                        label: 'Clear',
                        width: 100,
                        color: Color(0xFFAC4040),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Result(resultText: resultText),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
