import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'user.dart';

class UserCont {
  User userModel = User();

  void updateId(String id) {
    userModel.id = id;
  }

  void updateFirstName(String firstName) {
    userModel.firstName = firstName;
  }

  void updateLastName(String lastName) {
    userModel.lastName = lastName;
  }

  void updateUserName(String userName) {
    userModel.userName = userName;
  }

  void updatePassWord(String passWord) {
    userModel.passWord = passWord;
  }

  // Convert the model to JSON
  String toJson() {
    return jsonEncode(userModel.toJson());
  }

  // Save JSON to a file
  Future<void> saveToFile(String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);
      await file.writeAsString(toJson());
      print('Data saved to $filePath');
    } catch (e) {
      print('Error saving data to file: $e'); // Log detailed error message
    }
  }
}
