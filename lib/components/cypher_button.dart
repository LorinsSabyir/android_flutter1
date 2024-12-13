import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color? color;  // Customizable color
  final double? width;  // Optional width parameter

  const Button({
    required this.onTap,
    required this.label,
    this.color,  // Allow custom color
    this.width,  // Optional width parameter
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,  // Use provided width or default to automatic width
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: color ?? Color.fromARGB(255, 21, 22, 23),  // Use provided color or default color
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
    color: Colors.black,  // Border color
    width: 1.0,           // Border width
  ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
