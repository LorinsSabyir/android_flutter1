import 'package:flutter/material.dart';
import 'userCont.dart'; // Assume this file contains the UserController class

class UserForm extends StatefulWidget {
  final UserCont controller;

  const UserForm({super.key, required this.controller});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'ID'),
            onChanged: widget.controller.updateId,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an ID';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'First Name'),
            onChanged: widget.controller.updateFirstName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your first name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Last Name'),
            onChanged: widget.controller.updateLastName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your last name';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Username'),
            onChanged: widget.controller.updateUserName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a username';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            onChanged: widget.controller.updatePassWord,
            validator: (value) {
              if (value == null || value.length < 6) {
                return 'Password must be at least 6 characters long';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final json = widget.controller.toJson();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('User data saved: $json')),
                );

                // Save data to a specific file
                await widget.controller.saveToFile('user_data.json');
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
