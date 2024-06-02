import 'package:sqflite/sqflite.dart';
import 'package:team_muscle/globals.dart' as globals;

// ExerciseModel class
import 'package:team_muscle/models/exercise_model.dart';
// import 'package:team_muscle/models/tag_model.dart';

Future<void> insertExercise(ExerciseModel exercise) async {
  // Get a reference to the database.
  final db = await globals.database;
  await db.insert(
    'exercises',
    exercise.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<ExerciseModel> findExerciseById(int id) async {
  final db = await globals.database;
  final List<Map<String, Object?>> exerciseMaps = await db.query(
    'exercises',
    where: 'id = ?',
    whereArgs: [id],
  );

  return ExerciseModel(
    id: exerciseMaps.first['id'] as int,
    name: exerciseMaps.first['name'] as String,
    description: exerciseMaps.first['description'] as String,
  );
}

Future<void> updateExerciseRow(ExerciseModel exercise) async {
  final db = await globals.database;
  await db.update(
    'exercises',
    exercise.toMap(),
    where: 'id = ?',
    whereArgs: [exercise.id],
  );
}

Future<List<ExerciseModel>> exercises() async {
  final db = await globals.database;
  final List<Map<String, Object?>> exerciseMaps = await db.query('exercises');

  return [
    for (final {
    'id': id as int,
    'name': name as String,
    'description': description as String,
    } in exerciseMaps)
      ExerciseModel(id: id, name: name, description: description),
  ];
}

Future<void> deleteExerciseRow(String name) async {
  final db = await globals.database;
  await db.delete(
    'exercises',
    where: 'name = ?',
    whereArgs: [name],
  );
}