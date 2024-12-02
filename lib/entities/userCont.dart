import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'user.dart';
import 'dart:convert';
import 'dart:io';

class UserController {
  User userModel = User();
  int lastAssignedId = 0;

  // Load last assigned ID from persistent storage
  Future<void> loadLastAssignedId() async {
    final prefs = await SharedPreferences.getInstance();
    lastAssignedId = prefs.getInt('lastAssignedId') ?? 0; // Default to 0
  }

  // Save last assigned ID to persistent storage
  Future<void> saveLastAssignedId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastAssignedId', lastAssignedId);
  }

  // Generate and assign the next ID
  void generateNextId() {
    lastAssignedId++; // Increment the counter
    userModel.id = lastAssignedId.toString(); // Assign the new ID
  }

  // Create a new user and update the user model
  void createUser(String firstName, String lastName, String username, String password) {
    generateNextId(); // Generate new ID
    userModel.firstName = firstName;
    userModel.lastName = lastName;
    userModel.userName = username;
    userModel.passWord = password;

    // Optionally, save user data to a file
    saveToFile('userData.json');
  }

  // Save JSON to a file
  Future<void> saveToFile(String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);
      await file.writeAsString(userModel.toJson().toString());
      print('Data saved to $filePath');
    } catch (e) {
      print('Error saving data to file: $e');
    }
  }

  // Get JSON representation of the model
  String toJson() {
    return jsonEncode(userModel.toJson()); // Use jsonEncode instead of directly converting to string
  }
}
