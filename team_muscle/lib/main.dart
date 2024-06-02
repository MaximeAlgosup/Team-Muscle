import 'package:flutter/material.dart';
import 'package:team_muscle/routes.dart';
import 'dart:async';
import 'package:team_muscle/tables/db_creation.dart';
import 'package:team_muscle/globals.dart' as globals;

Future<void> main() async {
  runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();
  globals.database = database();
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
