import 'package:sqflite/sqflite.dart';
import 'package:team_muscle/globals.dart' as globals;

// LastConnectionModel class
import 'package:team_muscle/models/last_connection_model.dart';

Future<bool> isLastConnectionEmpty() async {
  final db = await globals.database;
  final List<Map<String, Object?>> lastConnectionMaps = await db.query(
    'lastConnections',
  );
  for(Object lastConnection in lastConnectionMaps) {
    print(lastConnection.toString());
  }

  return lastConnectionMaps.isEmpty;
}

Future<void> insertLastConnection(LastConnectionModel lastConnection) async {
  // Get a reference to the database.
  final db = await globals.database;
  // Get number of entries in the table
  final List<Map<String, Object?>> lastConnectionMaps = await db.query(
    'lastConnections',
  );
  lastConnection.id = lastConnectionMaps.length + 1;
  await db.insert(
    'lastConnections',
    lastConnection.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<LastConnectionModel> getLastConnection() async {
  final db = await globals.database;
  final List<Map<String, Object?>> lastConnectionMaps = await db.query(
    'lastConnections',
  );

  return LastConnectionModel(
    id: lastConnectionMaps.first['id'] as int,
    userId: lastConnectionMaps.first['userId'] as int,
    date: DateTime.parse(lastConnectionMaps.first['date'] as String),
  );
}