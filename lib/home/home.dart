// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: WelcomeScreen(),
//     );
//   }
// }

// class WelcomeScreen extends StatefulWidget {
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   TextEditingController userInputController = TextEditingController();
//   TextEditingController decodedTextController = TextEditingController();

//   // Atbash Cipher Encoding
//   String atbashEncode(String text) {
//     return text
//         .split('')
//         .map((char) {
//           if (char.toUpperCase().codeUnitAt(0) >= 65 && char.toUpperCase().codeUnitAt(0) <= 90) {
//             int base = char == char.toUpperCase() ? 65 : 97;
//             return String.fromCharCode(base + (25 - (char.codeUnitAt(0) - base)));
//           } else {
//             return char; // Non-alphabet characters remain unchanged
//           }
//         })
//         .join('');
//   }

//   // Clear Input and Output Fields
//   void clearFields() {
//     userInputController.clear();
//     decodedTextController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFAEC6C9),
//       appBar: AppBar(
//         title: Text('Atbash Cipher'),
//         backgroundColor: Color(0xFF2C2C2C),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // User Input Field
//             TextField(
//               controller: userInputController,
//               decoration: InputDecoration(
//                 hintText: 'Enter text here...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             // Encode Button
//             ElevatedButton(
//               onPressed: () {
//                 String encoded = atbashEncode(userInputController.text);
//                 decodedTextController.text = encoded;
//               },
//               child: Text('Encode'),
//             ),
//             SizedBox(height: 16),
//             // Decoded Text Field
//             TextField(
//               controller: decodedTextController,
//               readOnly: true,
//               decoration: InputDecoration(
//                 labelText: 'Encoded Result',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             // Clear Button
//             ElevatedButton(
//               onPressed: clearFields,
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//               child: Text('Clear'),
//             ),
//           ],
//         ),
//       ),
//       drawer: Drawer(
//         backgroundColor: Color(0xFF2C2C2C), // Drawer background color
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CaesarCipherScreen(),
//     );
//   }
// }

// class CaesarCipherScreen extends StatefulWidget {
//   @override
//   _CaesarCipherScreenState createState() => _CaesarCipherScreenState();
// }

// class _CaesarCipherScreenState extends State<CaesarCipherScreen> {
//   TextEditingController textController = TextEditingController();
//   TextEditingController shiftController = TextEditingController();
//   TextEditingController resultController = TextEditingController();
//   String dropdownValue = 'Right';

//   // Caesar Cipher Encode/Decode
//   String caesarCipher(String text, int shift, bool isRightShift) {
//     shift = shift % 26; // Handle large shifts
//     if (!isRightShift) {
//       shift = 26 - shift; // Reverse direction for left shift
//     }
//     return text
//         .split('')
//         .map((char) {
//           if (char.toUpperCase().codeUnitAt(0) >= 65 && char.toUpperCase().codeUnitAt(0) <= 90) {
//             int base = char == char.toUpperCase() ? 65 : 97;
//             return String.fromCharCode(base + (char.codeUnitAt(0) - base + shift) % 26);
//           } else {
//             return char; // Non-alphabetic characters remain unchanged
//           }
//         })
//         .join('');
//   }

//   // Clear Input and Output Fields
//   void clearFields() {
//     textController.clear();
//     shiftController.clear();
//     resultController.clear();
//     setState(() {
//       dropdownValue = 'Right';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFAEC6C9),
//       appBar: AppBar(
//         title: Text('Caesar Cipher'),
//         backgroundColor: Color(0xFF2C2C2C),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             // User Input Field
//             TextField(
//               controller: textController,
//               decoration: InputDecoration(
//                 hintText: 'Enter text here...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             // Shift Input Field
//             TextField(
//               controller: shiftController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: 'Enter number',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             // Dropdown Menu
//             DropdownButtonFormField<String>(
//               value: dropdownValue,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//               items: ['Right', 'Left'].map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   dropdownValue = newValue!;
//                 });
//               },
//             ),
//             SizedBox(height: 16),
//             // Encode Button
//             ElevatedButton(
//               onPressed: () {
//                 int shift = int.tryParse(shiftController.text) ?? 0;
//                 bool isRightShift = dropdownValue == 'Right';
//                 String encoded = caesarCipher(textController.text, shift, isRightShift);
//                 resultController.text = encoded;
//               },
//               child: Text('Encode'),
//             ),
//             SizedBox(height: 16),
//             // Decoded Text Field
//             TextField(
//               controller: resultController,
//               readOnly: true,
//               decoration: InputDecoration(
//                 labelText: 'Encoded Result',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             // Clear Button
//             ElevatedButton(
//               onPressed: clearFields,
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//               child: Text('Clear'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: VigenereCipherScreen(),
//     );
//   }
// }

// class VigenereCipherScreen extends StatefulWidget {
//   @override
//   _VigenereCipherScreenState createState() => _VigenereCipherScreenState();
// }

// class _VigenereCipherScreenState extends State<VigenereCipherScreen> {
//   TextEditingController textController = TextEditingController();
//   TextEditingController keywordController = TextEditingController();
//   TextEditingController resultController = TextEditingController();

//   // Vigenère Cipher Encoding
//   String vigenereEncode(String text, String keyword) {
//     if (text.isEmpty || keyword.isEmpty) return '';
//     final String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
//     String upperText = text.toUpperCase();
//     String upperKeyword = keyword.toUpperCase();

//     int keywordIndex = 0;
//     return upperText.split('').map((char) {
//       if (alphabet.contains(char)) {
//         int textCharIndex = alphabet.indexOf(char);
//         int keyCharIndex = alphabet.indexOf(upperKeyword[keywordIndex % upperKeyword.length]);
//         keywordIndex++;

//         // Encode character
//         int encodedIndex = (textCharIndex + keyCharIndex) % 26;
//         return alphabet[encodedIndex];
//       } else {
//         // Non-alphabet characters remain unchanged
//         return char;
//       }
//     }).join('');
//   }

//   // Clear Input and Output Fields
//   void clearFields() {
//     textController.clear();
//     keywordController.clear();
//     resultController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFAEC6C9),
//       appBar: AppBar(
//         title: Text('Vigenère Cipher'),
//         backgroundColor: Color(0xFF2C2C2C),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
            
//             // User Input Field for Text
//             TextField(
//               controller: textController,
//               decoration: InputDecoration(
//                 hintText: 'Enter text here...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),

//             // User Input Field for Keyword
//             TextField(
//               controller: keywordController,
//               decoration: InputDecoration(
//                 hintText: 'Enter keyword here...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),

//             // Encode Button
//             ElevatedButton(
//               onPressed: () {
//                 String encoded = vigenereEncode(
//                   textController.text,
//                   keywordController.text,
//                 );
//                 resultController.text = encoded;
//               },
//               child: Text('Encode'),
//             ),
//             SizedBox(height: 16),

//             // Decoded Text Field
//             TextField(
//               controller: resultController,
//               readOnly: true,
//               decoration: InputDecoration(
//                 labelText: 'Encoded Result',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),

//             // Clear Button
//             ElevatedButton(
//               onPressed: clearFields,
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//               child: Text('Clear'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

