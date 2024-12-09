import 'package:flutter/material.dart';
import 'package:android_flutter/ciphers/details.dart';

class Shop extends ChangeNotifier {
  final List<Details> _shop = [
    Details(
      name: "Atbash Cipher",
      description:
          "A monoalphabetic cipher that substitutes letters with their reverse counterpart, it is weak due to its predictability and susceptibility to brute force.",
      imagePath: "assets/IM1.jpg", // Added imagePath (required field)
    ),
    Details(
      name: "Ceasar Cipher",
      description:
          "A simple substitution cipher that shifts letters by a fixed amount, it is weak and easily breakable through frequency analysis.",
      imagePath: "assets/IM2.jpg", // Added imagePath (required field)
    ),
    Details(
      name: "Vigenere Cipher",
      description:
          "A polyalphabetic cipher that uses a keyword to vary the shift, it is stronger than Caesar but still vulnerable to modern cryptanalysis without the key.",
      imagePath: "assets/IM3.jpg",// Added imagePath (required field)
    ),
  ];

  List<Details> _cart = [];

  // You need to specify the return type or initialize the list properly here
  List<Details> get shop => _shop;

  List<Details> get cart => _cart;

  void addToCart(Details item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Details item) {
    notifyListeners();
  }
}
