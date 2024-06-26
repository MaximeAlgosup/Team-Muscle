import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Widgets
import 'package:team_muscle/widgets/selects/select_user_widget.dart';
import 'package:team_muscle/widgets/buttons/icon_button_widget.dart';

// Models
import 'package:team_muscle/models/user_model.dart';

// Tables
import 'package:team_muscle/database/tables/user_table.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  Future<bool> isUsers() async{
    final List<UserModel> usersList = await users();
    if (usersList.isEmpty) {
      return false;
    }
    return true;
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
              (isUsers() == false) ?
              const Text("No users found, please add a new user") :
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: const SelectUserWidget(),
              ),
              IconButtonWidget(
                label: 'Add User',
                icon: Icons.add,
                onPressed: () {
                  context.goNamed('subscribe');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
