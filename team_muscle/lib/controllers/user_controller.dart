import 'package:flutter/material.dart';

// Models
import 'package:team_muscle/models/user_model.dart';

// Tables
import 'package:team_muscle/tables/user_table.dart';

class UserController {
  final name = TextEditingController();
  final age = TextEditingController();
  final height = TextEditingController();
  final weight = TextEditingController();

  void clearFields() {
    name.clear();
    age.clear();
    height.clear();
    weight.clear();
  }

  void dispose() {
    name.dispose();
    age.dispose();
    height.dispose();
    weight.dispose();
  }

  void saveUser() async{
    // get users number
    int usersNumber = await users().then((value) => value.length);
    final UserModel user = UserModel(
      id: usersNumber + 1,
      name: name.text,
      birthYear: int.parse(age.text),
      height: double.parse(height.text),
      weight: double.parse(weight.text),
    );
    insertUser(user);
    clearFields();
  }
}