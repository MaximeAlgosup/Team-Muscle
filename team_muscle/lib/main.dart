import 'package:flutter/material.dart';
import 'package:team_muscle/routes.dart';
import 'dart:async';
import "package:path/path.dart" show join;
import 'package:sqflite/sqflite.dart';
import 'package:team_muscle/globals.dart' as globals;

Future<void> main() async {
  runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();
  globals.database = openDatabase(
    join(await getDatabasesPath(), 'team_muscle_db.db'),
    onCreate: (db, version) {
      String sql = '''
        CREATE TABLE users(
          id INTEGER PRIMARY KEY,
          name TEXT,
          birthYear INTEGER,
          weight FLOAT,
          height FLOAT
        ),
        CREATE TABLE tags(
          id INTEGER PRIMARY KEY,
          name TEXT NOT NULL UNIQUE,
          description TEXT
        ),
        CREATE TABLE exerciseDatas(
          id INTEGER PRIMARY KEY,
          date DATE NOT NULL,
          weight FLOAT,
          reps INTEGER,
          sets INTEGER,
          isPersonalRecord BOOLEAN,
          ExerciseId INTEGER,
          UserId INTEGER,
        ),
        CREATE TABLE exercises(
          id INTEGER PRIMARY KEY,
          name TEXT NOT NULL,
          description TEXT,
        ),
      ''';
      var res =  db.execute(sql);
      print('Database creation: ${res.toString()}');
      return res;
    },
    version: 1,
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
