import 'package:flutter/material.dart';

// Widgets
import 'package:team_muscle/widgets/navbar_widget.dart';

// Models
import 'package:team_muscle/models/user_model.dart';

// Tables
import 'package:team_muscle/tables/user_table.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  void printUsers() async {
    UserModel user = const UserModel(
      id: 1,
      name: 'John Doe',
      birthYear: 1990,
      height: 1.80,
      weight: 80.0,
    );

    await insertUser(user);

    final List<UserModel> usersList = await users();
    for (var element in usersList) {
      debugPrint(element.toString());
    }
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
                const Center(
                  child: Text('User Page',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () => printUsers(),
                    child: const Text('Print users'),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const NavbarWidget(selectedIndex: 2));
  }
}
