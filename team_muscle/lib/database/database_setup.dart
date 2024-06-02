import "package:path/path.dart" show join;
import 'package:sqflite/sqflite.dart';

Future<dynamic> database() async {
  return await openDatabase(
    join(await getDatabasesPath(), 'team_muscle_db.db'),
    onOpen: (db) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS users( id INTEGER PRIMARY KEY, name TEXT, birthYear INTEGER, weight FLOAT, height FLOAT);');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS exercises( id INTEGER PRIMARY KEY, name TEXT NOT NULL UNIQUE, description TEXT);');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS tags( id INTEGER PRIMARY KEY, name TEXT NOT NULL UNIQUE, description TEXT);');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS exerciseDatas( id INTEGER PRIMARY KEY, date DATE NOT NULL, weight FLOAT, reps INTEGER, sets INTEGER, isPersonalRecord BOOLEAN, ExerciseId INTEGER, UserId INTEGER);');
    },
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS users( id INTEGER PRIMARY KEY, name TEXT, birthYear INTEGER, weight FLOAT, height FLOAT);');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS exercises( id INTEGER PRIMARY KEY, name TEXT NOT NULL UNIQUE, description TEXT);');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS tags( id INTEGER PRIMARY KEY, name TEXT NOT NULL UNIQUE, description TEXT);');
      await db.execute(
          'CREATE TABLE IF NOT EXISTS exerciseDatas( id INTEGER PRIMARY KEY, date DATE NOT NULL, weight FLOAT, reps INTEGER, sets INTEGER, isPersonalRecord BOOLEAN, ExerciseId INTEGER, UserId INTEGER);');
    },
    version: 1,
  );
}
