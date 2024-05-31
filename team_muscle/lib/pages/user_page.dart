import 'package:flutter/material.dart';

// Widgets
import 'package:team_muscle/widgets/navbar_widget.dart';
import 'package:team_muscle/widgets/new_user_widget.dart';
import 'package:team_muscle/widgets/select_user_widget.dart';

// Models
import 'package:team_muscle/models/user_model.dart';

// Tables
import 'package:team_muscle/tables/user_table.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  void printUsers() async {
    final List<UserModel> usersList = await users();
    debugPrint("number of users: ${usersList.toString()}");
  }

  Future<List<UserModel>> getUsers() async {
    final List<UserModel> usersList = await users();
    return usersList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.grey[600],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SelectUserWidget(usersList: getUsers()),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NavbarWidget(selectedIndex: 2));
  }
}
