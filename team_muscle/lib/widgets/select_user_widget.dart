import 'package:flutter/material.dart';
import 'package:team_muscle/globals.dart' as globals;

// Models
import 'package:team_muscle/models/user_model.dart';

// Tables
import 'package:team_muscle/tables/user_table.dart';

class SelectUserWidget extends StatelessWidget {
  const SelectUserWidget({super.key, required this.usersList});

  final Future<List<UserModel>> usersList;

  @override
    Widget build(BuildContext context) {
      return FutureBuilder<List<UserModel>>(
      future: usersList,
      builder: (BuildContext context, AsyncSnapshot<List<UserModel>> usersSnapshot) {
        if (usersSnapshot.hasData) {
          return Expanded(
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
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
                  ),
            );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}