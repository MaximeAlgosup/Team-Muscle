import 'package:sqflite/sqflite.dart';
import 'package:team_muscle/globals.dart' as globals;

// ExerciseDataModel class
import 'package:team_muscle/models/exercise_data_model.dart';

Future<void> insertExerciseData(ExerciseDataModel exerciseData) async {
  // Get a reference to the database.
  final db = await globals.database;
  await db.insert(
    'exerciseDatas',
    exerciseData.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<ExerciseDataModel> findExerciseDataById(int id) async {
  final db = await globals.database;
  final List<Map<String, Object?>> exerciseDataMaps = await db.query(
    'exerciseDatas',
    where: 'id = ?',
    whereArgs: [id],
  );

  return ExerciseDataModel(
    id: exerciseDataMaps.first['id'] as int,
    date: DateTime.parse(exerciseDataMaps.first['date'] as String),
    weight: exerciseDataMaps.first['weight'] as double,
    reps: exerciseDataMaps.first['reps'] as int,
    sets: exerciseDataMaps.first['sets'] as int,
    isPersonalRecord: exerciseDataMaps.first['isPersonalRecord'] == 1,
    exerciseId: exerciseDataMaps.first['exerciseId'] as int,
    userId: exerciseDataMaps.first['userId'] as int,
  );
}

Future<void> updateExerciseDataRow(ExerciseDataModel exerciseData) async {
  final db = await globals.database;
  await db.update(
    'exerciseDatas',
    exerciseData.toMap(),
    where: 'id = ?',
    whereArgs: [exerciseData.id],
  );
}

Future<List<ExerciseDataModel>> exerciseDatas() async {
  final db = await globals.database;
  final List<Map<String, Object?>> exerciseDataMaps = await db.query('exerciseDatas');

  return [
    for (final {
      'id': id as int,
      'date': date as String,
      'weight': weight as double,
      'reps': reps as int,
      'sets': sets as int,
      'isPersonalRecord': isPersonalRecord as int,
      'exerciseId': exerciseId as int,
      'userId': userId as int,
    } in exerciseDataMaps)
      ExerciseDataModel(
        id: id,
        date: DateTime.parse(date),
        weight: weight,
        reps: reps,
        sets: sets,
        isPersonalRecord: isPersonalRecord == 1,
        exerciseId: exerciseId,
        userId: userId,
      ),
  ];
}

Future<void> deleteExerciseDataRow(int id) async {
  final db = await globals.database;
  await db.delete(
    'exerciseDatas',
    where: 'id = ?',
    whereArgs: [id],
  );
}

Future<void> deleteExerciseDataRowsByExerciseId(int exerciseId) async {
  final db = await globals.database;
  await db.delete(
    'exerciseDatas',
    where: 'exerciseId = ?',
    whereArgs: [exerciseId],
  );
}
