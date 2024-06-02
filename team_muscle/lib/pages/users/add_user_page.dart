import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';

// Widgets
import 'package:team_muscle/widgets/new_user_widget.dart';
import 'package:team_muscle/widgets/buttons/back_app_bar_widget.dart';

// Models
import 'package:team_muscle/models/user_model.dart';

// Tables
import 'package:team_muscle/database/tables/user_table.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({super.key});

  Future<List<UserModel>> getUsers() async {
    final List<UserModel> usersList = await users();
    return usersList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: BackAppBarWidget(
          onTape: () {
            context.goNamed("select_user");
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: NewUserWidget(),
        ),
      ),
    );
  }
}
