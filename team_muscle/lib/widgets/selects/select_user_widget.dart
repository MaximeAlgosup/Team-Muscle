import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:team_muscle/globals.dart' as globals;
import 'package:go_router/go_router.dart';

// Models
import 'package:team_muscle/models/user_model.dart';

// Tables
import 'package:team_muscle/tables/user_table.dart';

class SelectUserWidget extends StatefulWidget {
  const SelectUserWidget({super.key});

  @override
  _SelectUserWidgetState createState() => _SelectUserWidgetState();
}


class _SelectUserWidgetState extends State<SelectUserWidget> {

  Future<List<UserModel>> getUsers() async {
    List<UserModel> usersList = await users();
    // print all users data
    if(kDebugMode) {
      for (int i = 0; i < usersList.length; i++) {
        debugPrint("User: ${usersList[i].toString()}");
      }
    }
    return usersList;
  }

  Future<List<UserModel>> usersList = Future.value([]);

  @override
  void initState() {
    super.initState();
    usersList = getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      future: usersList,
      builder:
          (BuildContext context, AsyncSnapshot<List<UserModel>> usersSnapshot) {
        if (usersSnapshot.hasData) {
          return Expanded(
              child: RefreshIndicator(
            onRefresh: () async {
              setState(() {
                usersList = getUsers();
              });
            },
            child: ListView.builder(
              itemCount: usersSnapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(usersSnapshot.data![index].name),
                    trailing: IconButton(
                      icon: const Icon(Icons.how_to_reg),
                      onPressed: () {
                        globals.userIndex = usersSnapshot.data![index].id;
                        context.goNamed("profile");
                      },
                    ),
                  ),
                );
              },
            ),
          ));
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
