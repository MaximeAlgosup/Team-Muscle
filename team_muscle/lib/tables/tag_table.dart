import 'package:sqflite/sqflite.dart';
import 'package:team_muscle/globals.dart' as globals;

// TagModel class
import 'package:team_muscle/models/tag_model.dart';

Future<void> insertTag(TagModel tag) async {
  // Get a reference to the database.
  final db = await globals.database;
  await db.insert(
    'tags',
    tag.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<TagModel> findTagById(int id) async {
  final db = await globals.database;
  final List<Map<String, Object?>> tagMaps = await db.query(
    'tags',
    where: 'id = ?',
    whereArgs: [id],
  );

  return TagModel(
    id: tagMaps.first['id'] as int,
    name: tagMaps.first['name'] as String,
    description: tagMaps.first['description'] as String,
  );
}

Future<TagModel> findTagByName(String name) async {
  final db = await globals.database;
  final List<Map<String, Object?>> tagMaps = await db.query(
    'tags',
    where: 'name = ?',
    whereArgs: [name],
  );

  return TagModel(
    id: tagMaps.first['id'] as int,
    name: tagMaps.first['name'] as String,
    description: tagMaps.first['description'] as String,
  );
}

Future<void> updateTagRow(TagModel tag) async {
  final db = await globals.database;
  await db.update(
    'tags',
    tag.toMap(),
    where: 'id = ?',
    whereArgs: [tag.id],
  );
}

Future<List<TagModel>> tags() async {
  final db = await globals.database;
  final List<Map<String, Object?>> tagMaps = await db.query('tags');

  return [
    for (final {
    'id': id as int,
    'name': name as String,
    'description': description as String,
    } in tagMaps)
      TagModel(id: id, name: name, description: description),
  ];
}

Future<void> deleteTagRow(String name) async {
  final db = await globals.database;
  await db.delete(
    'tags',
    where: 'name = ?',
    whereArgs: [name],
  );
}