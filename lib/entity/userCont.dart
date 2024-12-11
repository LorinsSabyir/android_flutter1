import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:android_nga_flutter/entity/userModel.dart';

class UserController {
  final String _fileName = "users.json";

  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_fileName');
  }

  Future<List<User>> _readUsersFromFile() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        final contents = await file.readAsString();
        final List<dynamic> jsonData = json.decode(contents);
        return jsonData.map((data) => User.fromJson(data)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print("Error reading users: $e");
      return [];
    }
  }

  Future<void> _writeUsersToFile(List<User> users) async {
    try {
      final file = await _getLocalFile();
      final jsonData = json.encode(users.map((user) => user.toJson()).toList());
      await file.writeAsString(jsonData);
    } catch (e) {
      print("Error writing users: $e");
    }
  }

  Future<void> createUser(User user) async {
    final users = await _readUsersFromFile();
    users.add(user);
    await _writeUsersToFile(users);
  }

  Future<List<User>> readUsers() async {
    return await _readUsersFromFile();
  }

  Future<void> updateUser(String id, User updatedUser) async {
    final users = await _readUsersFromFile();
    final userIndex = users.indexWhere((user) => user.id == id);
    if (userIndex != -1) {
      users[userIndex] = updatedUser;
      await _writeUsersToFile(users);
    } else {
      print("User with id $id not found.");
    }
  }

  Future<void> deleteUser(String id) async {
    final users = await _readUsersFromFile();
    users.removeWhere((user) => user.id == id);
    await _writeUsersToFile(users);
  }
}
