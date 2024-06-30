import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:team_muscle/globals.dart' as globals;
import 'package:go_router/go_router.dart';

// Models
import 'package:team_muscle/models/user_model.dart';
import 'package:team_muscle/models/last_connection_model.dart';
import 'package:team_muscle/widgets/others/loading_widget.dart';

// Tables
import 'package:team_muscle/database/tables/user_table.dart';
import 'package:team_muscle/database/tables/last_connection_table.dart';

class SelectUserWidget extends StatefulWidget {
  const SelectUserWidget({super.key});

  @override
  _SelectUserWidgetState createState() => _SelectUserWidgetState();
}

class _SelectUserWidgetState extends State<SelectUserWidget> {
  Future<List<UserModel>> getUsers() async {
    List<UserModel> usersList = await users();

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
          return RefreshIndicator(
            onRefresh: () async {
              setState(
                () {
                  usersList = getUsers();
                },
              );
            },
            child: ListView.builder(
              itemCount: usersSnapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      usersSnapshot.data![index].name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.how_to_reg,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        globals.userIndex = usersSnapshot.data![index].id;
                        insertLastConnection(
                          LastConnectionModel(
                            id: 1,
                            userId: usersSnapshot.data![index].id,
                            date: DateTime.now(),
                          ),
                        );
                        context.goNamed("profile");
                      },
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const LoadingWidget();
      },
    );
  }
}
