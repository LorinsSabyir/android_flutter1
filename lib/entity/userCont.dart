import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:android_nga_flutter/entity/userModel.dart';

class UserCont {
  static const String _idCounterKey = 'userIdCounter'; // Key for storing the ID counter
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
      id: newId ,
      firstName: firstname,
      lastName: lastname,
      userName: username,
      passWord: password,
    );
    users.add(jsonEncode(newUser.toJson()));
    await prefs.setStringList(_usersKey, users);
    await prefs.setInt(_idCounterKey, userIdCounter);
  }

    // Authenticate user
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
}