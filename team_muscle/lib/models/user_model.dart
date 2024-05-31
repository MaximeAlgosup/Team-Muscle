import 'package:sqflite/sqflite.dart';
import 'package:team_muscle/globals.dart' as globals;

class UserModel {
  final int id;
  final String name;
  final int birthYear;
  final double heigth;
  final double weigth;

  const UserModel(
      {required this.id,
      required this.name,
      required this.birthYear,
      required this.heigth,
      required this.weigth});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'birthYear': birthYear,
      'heigth': heigth,
      'weigth': weigth,
    };
  }

  Future<void> insertUser(UserModel user) async {
    // Get a reference to the database.
    await globals.database.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateUser(UserModel user) async {
    await globals.database.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<List<UserModel>> users() async {
    final List<Map<String, Object?>> userMaps = await globals.database.query('users');

    return [
      for (final {
      'id': id as int,
      'name': name as String,
      'birthYear': birthYear as int,
      'heigth': heigth as double,
      'weigth': weigth as double,
      } in userMaps)
        UserModel(id: id, name: name, birthYear: birthYear, heigth: heigth, weigth: weigth),
    ];
  }

  @override
  toString() {
    return 'UserModel{name: $name, birthYear: $birthYear, heigth: $heigth, weigth: $weigth}';
  }
}
