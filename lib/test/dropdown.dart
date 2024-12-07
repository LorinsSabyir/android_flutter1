import 'dart:convert';  // For JSON encoding
import 'dart:io';  // For file handling
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DropdownJsonExample(),
    );
  }
}

class DropdownJsonExample extends StatefulWidget {
  @override
  _DropdownJsonExampleState createState() => _DropdownJsonExampleState();
}

class _DropdownJsonExampleState extends State<DropdownJsonExample> {
  String? _selectedValue;
  final List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  // Function to save selected value to a JSON file
  void _saveToJson(String selectedItem) async {
    // Create a map to represent the selected item
    Map<String, String> selectedItemMap = {
      'selected_item': selectedItem,
    };

    // Convert the map to JSON
    String jsonString = jsonEncode(selectedItemMap);

    // Get the path to save the JSON file (e.g., in the app's directory)
    File file = File('selected_item.json');
    
    // Save the JSON string to the file
    await file.writeAsString(jsonString);

    print('Saved to JSON: $jsonString');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dropdown to JSON Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              hint: Text('Select an item'),
              value: _selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
              },
              items: _items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            _selectedValue != null
                ? Text('Selected Item: $_selectedValue')
                : Text('No item selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectedValue != null
                  ? () {
                      // Save to JSON when Confirm button is pressed
                      _saveToJson(_selectedValue!);
                    }
                  : null, // Disable button if no item is selected
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
