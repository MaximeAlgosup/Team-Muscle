import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

Future<int> getTableLength() async {
  final db = await globals.database;
  final List<Map<String, Object?>> exerciseDataMaps = await db.query('exerciseDatas');
  return exerciseDataMaps.length;
}

Future<List<ExerciseDataModel>> exerciseDatas() async {
  final db = await globals.database;
  final List<Map<String, Object?>> exerciseDataMaps = await db.query('exerciseDatas');
  for(var i = 0; i < exerciseDataMaps.length; i++) {
    print(exerciseDataMaps[i].toString());
  }
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

Future<List<ExerciseDataModel>> exerciseDatasByUserAndExerciseId(int exerciseId, int userId) async {
  debugPrint("Exercise ID: $exerciseId");
  debugPrint("User ID: $userId");
  final db = await globals.database;
  final List<Map<String, Object?>> exerciseDataMaps = await db.query(
    'exerciseDatas',
    where: 'exerciseId = ? AND userId = ?',
    whereArgs: [exerciseId, userId],
  );
  // print result length
  debugPrint("Exercise Data Length: ${exerciseDataMaps.length}");
  for(var i = 0; i < exerciseDataMaps.length; i++) {
    debugPrint("Exercises found: ${exerciseDataMaps[i].toString()}");
  }

  return exerciseDataMaps.map((map) {
    return ExerciseDataModel(
      id: map['id'] as int,
      date: DateFormat('yyyy-MM-dd').parse(map['date'] as String),
      weight: map['weight'] as double,
      reps: map['reps'] as int,
      sets: map['sets'] as int,
      isPersonalRecord: (map['isPersonalRecord'] as int) == 1,
      exerciseId: exerciseId,
      userId: userId,
    );
  }).toList();
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
