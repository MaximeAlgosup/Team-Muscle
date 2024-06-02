import 'package:flutter/material.dart';
import 'package:team_muscle/globals.dart' as globals;

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

  void setFields(UserModel user) {
    name.text = user.name;
    age.text = user.birthYear.toString();
    height.text = user.height.toString();
    weight.text = user.weight.toString();
  }

  void setById(int id) async {
    final UserModel user = await findUserById(id);
    setFields(user);
  }

  void updateUser(int id) async {
    UserModel user = UserModel(
      id: id,
      name: name.text,
      birthYear: int.parse(age.text),
      height: double.parse(height.text),
      weight: double.parse(weight.text),
    );
    updateUserRow(user);
    clearFields();
  }

  void deleteUser() async {
    globals.userIndex = null;
    await deleteUserRow(name.text, int.parse(age.text));
  }

  void saveUser() async{
    // get users number
    int usersNumber = await users().then((value) => value.length);
    int userId = usersNumber + 1;
    final List<UserModel> usersList = await users();
    for (UserModel user in usersList) {
      if (user.name == name.text && user.birthYear == int.parse(age.text)) {
        userId = user.id;
      }
    }
    final UserModel user = UserModel(
      id: userId,
      name: name.text,
      birthYear: int.parse(age.text),
      height: double.parse(height.text),
      weight: double.parse(weight.text),
    );
    insertUser(user);
    clearFields();
  }
}