import 'dart:convert';
import 'dart:io';
import 'package:android_nga_flutter/entity/userModel.dart';

class UserController {
  final String _folderName = "data";
  final String _fileName = "users.json";

  // Create folder inside project directory
  Future<Directory> _getLocalFolder() async {
    final directory = Directory.current; // Get current working directory
    final folderPath = '${directory.path}/$_folderName'; // Add folder name
    final folder = Directory(folderPath);

    if (!await folder.exists()) {
      print("Folder does not exist. Creating folder...");
      await folder.create();
    }
    return folder;
  }

  // Json directory inside project directory
  Future<File> _getLocalFile() async {
    final folder = await _getLocalFolder();
    print("Userdata is saved into ${folder.path}");
    return File('${folder.path}/$_fileName');
  }

  // Read users
  Future<List<User>> _readUsersFromFile() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        final contents = await file.readAsString();
        final List<dynamic> jsonData = json.decode(contents);
        return jsonData.map((data) => User.fromJson(data)).toList();
      } else {
        print("File does not exist. Returning empty list.");
        return [];
      }
    } catch (e) {
      print("Error reading users: $e");
      return [];
    }
  }

  // Create new user
  Future<void> _writeUsersToFile(List<User> users) async {
    print("Writing users to file...");
    try {
      final file = await _getLocalFile();
      final List<Map<String, dynamic>> jsonData =
          users.map((user) => user.toJson()).toList();
      await file.writeAsString(json.encode(jsonData));
      print("Users written to file successfully.");
    } catch (e) {
      print("Error writing users to file: $e");
    }
  }

  // Login user
  Future<User?> loginUser(String username, String password) async {
    print("Attempting to log in user...");
    try {
      final users = await _readUsersFromFile();
      for (var user in users) {
        if (user.userName == username && user.passWord == password) {
          print("Login successful for user: $username");
          return user; // Return the logged-in user
        }
      }
      print("Login failed. Invalid username or password.");
      return null; // Return null for invalid login
    } catch (e) {
      print("Error during login: $e");
      return null; // Return null if an error occurs
    }
  }

  // Register user
  Future<void> registerUser(String firstName, String lastName, String userName,
      String passWord) async {
    print("Attempting to register user: $userName");
    try {
      final users = await _readUsersFromFile();

      // Check if the username already exists
      if (users.any((user) => user.userName == userName)) {
        print("User already exists: $userName");
        throw Exception('User already exists');
      }

      // Generate an incremental ID for the new user
      int newId = 1; // Start with ID 1
      if (users.isNotEmpty) {
        // Find the maximum existing ID and increment by 1
        newId = users
                .map((user) => int.tryParse(user.id) ?? 0)
                .fold(0, (prev, element) => element > prev ? element : prev) +
            1;
      }

      // Create the new user with the generated ID
      final newUser = User(
        id: newId.toString(), // Use the incremented ID
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        passWord: passWord,
      );

      users.add(newUser);

      // Write the updated user list to the file
      await _writeUsersToFile(users);
      print("User registered successfully: $userName");
    } catch (e) {
      print("Error during registration: $e");
      rethrow;
    }
  }

  // Update user
  Future<void> updateUser(
    String id,
    String firstName,
    String lastName,
    String userName,
    String passWord,
  ) async {
    final users = await _readUsersFromFile();

    // Locate the user by ID
    final index = users.indexWhere((user) => user.id == id);
    if (index == -1) {
      throw Exception('User not found');
    }

    // Ensure the username is unique for all users except the one being updated
    final duplicateUser =
        users.any((user) => user.userName == userName && user.id != id);
    if (duplicateUser) {
      throw Exception('Username already exists');
    }

    // Update user details
    users[index] = User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      userName: userName,
      passWord: passWord,
    );

    // Save updated users to the file
    await _writeUsersToFile(users);
  }

  // Delete user
  Future<void> deleteUser(User userToDelete) async {
    print("Attempting to delete user with ID: ${userToDelete.id}");
    try {
      // Read all users from the JSON file
      final users = await _readUsersFromFile();

      // Check initial length for comparison
      final initialLength = users.length;

      // Remove the user matching the ID
      users.removeWhere((user) => user.id == userToDelete.id);

      if (users.length < initialLength) {
        // Write updated user list back to the file
        await _writeUsersToFile(users);
        print("User deleted successfully: ${userToDelete.id}");
      } else {
        print("User not found: ${userToDelete.id}");
        throw Exception('User not found');
      }
    } catch (e) {
      print("Error deleting user: $e");
      throw Exception('Failed to delete user: $e');
    }
  }
}
