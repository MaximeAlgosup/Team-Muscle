import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_muscle/globals.dart' as globals;
import 'package:team_muscle/widgets/buttons/simple_button_widget.dart';

// Widgets
import 'package:team_muscle/widgets/navbar_widget.dart';
import 'package:team_muscle/widgets/buttons/icon_button_widget.dart';

// Models
import 'package:team_muscle/models/user_model.dart';

// Tables
import 'package:team_muscle/tables/user_table.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  bool _isUser = false;

  @override
  void initState() {
    super.initState();
    updateIsUser();
  }

  Future<void> updateIsUser() async {
    final List<UserModel> usersList = await users();
    if (usersList.isNotEmpty) {
      setState(() {
        _isUser = true;
      });
    }
  }

  Future<List<UserModel>> getUsers() async {
    final List<UserModel> usersList = await users();
    return usersList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          onVerticalDragDown: (details) {
            print("Dragged Down");
            updateIsUser();
          },
          child: Container(
            color: Colors.grey[600],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: IconButtonWidget(
                          label: 'Log In',
                          icon: Icons.login,
                          onPressed: () {
                            context.pushNamed('select_user');
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      (_isUser == true)
                          ? Expanded(
                              child: SimpleButtonWidget(
                              label: "See my profile",
                              onPressed: () {
                                // context.goNamed('profile');
                                print("User index: ${globals.userIndex}");
                              },
                            ))
                          : const Text(""),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: Container(
          color: Colors.grey[600],
          child: (_isUser == true)
              ? const NavbarWidget(selectedIndex: 2)
              : const Text(""),
        ));
  }
}
