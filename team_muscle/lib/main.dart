import 'package:flutter/material.dart';
import 'package:team_muscle/routes.dart';
import 'dart:async';
import 'package:team_muscle/database/database_setup.dart';
import 'package:team_muscle/globals.dart' as globals;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:team_muscle/I10n/I10n.dart';

// Table
import 'package:team_muscle/database/tables/last_connection_table.dart';

Future<void> main() async {
  runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();
  globals.database = database();
  if(await isLastConnectionEmpty() == false) {
    globals.userIndex = await getLastConnection().then((value) => value.userId);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Team Muscle',
      supportedLocales: L10n.all,
      locale: const Locale('en'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
