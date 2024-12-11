import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:android_nga_flutter/entity/userModel.dart';

class UserCont {
  static const String _idCounterKey =
      'userIdCounter'; // Key for storing the ID counter
  static const String _usersKey = 'users';

  // Save a new user
  Future<void> registerUser(
    String firstname,
    String lastname,
    String username,
    String password,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> users = prefs.getStringList(_usersKey) ?? [];
    int userIdCounter = prefs.getInt(_idCounterKey) ?? 0;

    print('User saved in $prefs'); // Debugging output

    // Check if username already exists
    for (String userJson in users) {
      final userMap = jsonDecode(userJson);
      if (userMap['username'] == username) {
        throw Exception('User already exists');
      }
    }

    // Increment ID counter for new user
    final newId = (++userIdCounter).toString();

    // Add new user
    final newUser = User(
      id: newId,
      firstName: firstname,
      lastName: lastname,
      userName: username,
      passWord: password,
    );
    users.add(jsonEncode(newUser.toJson()));
    await prefs.setStringList(_usersKey, users);
    await prefs.setInt(_idCounterKey, userIdCounter);
  }

  // Read user
  Future<bool> loginUser(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> users = prefs.getStringList(_usersKey) ?? [];

    for (String userJson in users) {
      final userMap = jsonDecode(userJson);
      if (userMap['username'] == username && userMap['password'] == password) {
        return true;
      }
    }
    return false;
  }

  // Fetch user
  Future<User?> fetchCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? currentUserId = prefs.getString('loggedInUserId');
    if (currentUserId == null) return null;

    List<String> users = prefs.getStringList('users') ?? [];
    for (String userJson in users) {
      final userMap = jsonDecode(userJson);
      if (userMap['id'] == currentUserId) {
        return User.fromJson(userMap);
      }
    }
    return null;
  }

  // Update user
  Future<void> updateUser(
      String userId, Map<String, dynamic> updatedFields) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> users = prefs.getStringList(_usersKey) ?? [];

    // Find the user by ID and update
    for (int i = 0; i < users.length; i++) {
      final userMap = jsonDecode(users[i]);
      if (userMap['id'] == userId) {
        // Remove the `id` key if it's present in the updatedFields to prevent modification
        updatedFields.remove('id');

        // Merge updated fields with existing user data
        userMap.addAll(updatedFields);

        // Replace the old user data with the updated data
        users[i] = jsonEncode(userMap);
        await prefs.setStringList(_usersKey, users);
        return;
      }
    }

    throw Exception('User with ID $userId not found');
  }

  // Delete user
  Future<void> deleteUser(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> users = prefs.getStringList(_usersKey) ?? [];

    // Filter out the user with the matching ID
    users = users.where((userJson) {
      final userMap = jsonDecode(userJson);
      return userMap['id'] != userId;
    }).toList();

    // Save the updated user list
    await prefs.setStringList(_usersKey, users);
  }
}
