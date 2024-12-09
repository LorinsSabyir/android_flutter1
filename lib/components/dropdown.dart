import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  @override
  _DropdownButtonExampleState createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  final items = ['Atbash', 'Ceasar Cipher', ' Vigenère Cipher', ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      blurRadius: 15.5,
                      offset: Offset(4.0, 4.0),
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: const Color.fromARGB(255, 7, 7, 8),
                      size: 28,
                    ),
                    dropdownColor:  Color.fromARGB(255, 222, 224, 225),
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (newValue) => setState(() => value = newValue),
                    hint: Text(
                      'Select Cipher',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      
    );
    
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      );
}

void main() => runApp(MaterialApp(
  home: DropdownButtonExample(),
));
