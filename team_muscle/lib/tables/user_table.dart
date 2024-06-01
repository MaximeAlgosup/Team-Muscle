import 'package:sqflite/sqflite.dart';
import 'package:team_muscle/globals.dart' as globals;

// UserModel class
import 'package:team_muscle/models/user_model.dart';

Future<void> insertUser(UserModel user) async {
  // Get a reference to the database.
  final db = await globals.database;
  await db.insert(
    'users',
    user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<UserModel> findUserById(int id) async {
  final db = await globals.database;
  final List<Map<String, Object?>> userMaps = await db.query(
    'users',
    where: 'id = ?',
    whereArgs: [id],
  );

  return UserModel(
    id: userMaps.first['id'] as int,
    name: userMaps.first['name'] as String,
    birthYear: userMaps.first['birthYear'] as int,
    height: userMaps.first['height'] as double,
    weight: userMaps.first['weight'] as double,
  );
}

Future<void> updateUserRow(UserModel user) async {
  final db = await globals.database;
  await db.update(
    'users',
    user.toMap(),
    where: 'id = ?',
    whereArgs: [user.id],
  );
}

Future<List<UserModel>> users() async {
  final db = await globals.database;
  final List<Map<String, Object?>> userMaps = await db.query('users');

  return [
    for (final {
    'id': id as int,
    'name': name as String,
    'birthYear': birthYear as int,
    'height': height as double,
    'weight': weight as double,
    } in userMaps)
      UserModel(id: id, name: name, birthYear: birthYear, height: height, weight: weight),
  ];
}

Future<void> deleteUserRow(String name, int year) async {
  final db = await globals.database;
  await db.delete(
    'users',
    where: 'name = ? AND birthYear = ?',
    whereArgs: [name, year],
  );
}