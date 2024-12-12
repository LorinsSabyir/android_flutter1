import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String resultText;

  // Constructor with the named parameter resultText
  Result({required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
      child: Container(
        constraints: BoxConstraints(
          minHeight: 100, // Minimum height for a larger field
          maxHeight: 200, // Optional: Set a maximum height
        ),
        decoration: BoxDecoration(
          border: Border.all(
    color: Colors.black,  // Border color
    width: 2.0,           // Border width
  ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: TextField(
          readOnly: true,
          maxLines: null, // Allows the text field to expand with content
          controller: TextEditingController(text: resultText),
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Color.fromARGB(255, 9, 8, 8)),
            border: InputBorder.none, // Removes the border
            fillColor: Colors.grey.shade200,
            filled: true,
            contentPadding: EdgeInsets.all(20), // Adds more padding inside the field
          ),
        ),
      ),
    );
  }
}
