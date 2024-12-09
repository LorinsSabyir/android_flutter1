import 'package:flutter/material.dart';

class Button extends StatelessWidget{

  final Function()? onTap;
  const Button({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        ),
      
      child: Center(
        child: Text(
          'LOG IN',
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