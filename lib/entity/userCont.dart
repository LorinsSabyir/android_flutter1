import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
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
      String id, String firstName, String lastName, String passWord) async {
    print("Attempting to update user with ID: $id");
    try {
      final users = await _readUsersFromFile();

      // Find the user and update their data
      final index = users.indexWhere((user) => user.id == id);
      if (index != -1) {
        users[index] = User(
          id: id, // ID remains the same
          firstName: firstName,
          lastName: lastName,
          userName: users[index].userName, // Retain existing username
          passWord: passWord,
        );

        // Write the updated user list to the file
        await _writeUsersToFile(users);
        print("User updated successfully: $id");
      } else {
        print("User not found: $id");
        throw Exception('User not found');
      }
    } catch (e) {
      print("Error during updating user: $e");
      rethrow;
    }
  }
  // Deletes the specified user from the JSON file
  Future<void> deleteUser(User userToDelete) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/users.json');

      if (await file.exists()) {
        final content = await file.readAsString();
        final List<dynamic> users = jsonDecode(content);

        // Remove the user from the list
        users.removeWhere((user) => user['id'] == userToDelete.id);

        // Write the updated list back to the file
        await file.writeAsString(jsonEncode(users));
      } else {
        throw Exception('User data file not found');
      }
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }

}
