import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Pages
import 'package:team_muscle/pages/home_page.dart';
import 'package:team_muscle/pages/user_page.dart';
import 'package:team_muscle/pages/add_user_page.dart';
import 'package:team_muscle/pages/select_user_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/pages/home_page.dart',
  routes: [
    GoRoute(
      path: '/pages/home_page.dart',
      name: 'home',
      pageBuilder: (BuildContext context, GoRouterState state){
        return const MaterialPage(child: HomePage());
      }
    ),
    GoRoute(
      path: '/pages/user_page.dart',
      name: 'user',
      pageBuilder: (BuildContext context, GoRouterState state){
        return const MaterialPage(child: UserPage());
      }
    ),
    GoRoute(
      path: '/pages/add_user_page.dart',
      name: 'add_user',
      pageBuilder: (BuildContext context, GoRouterState state){
        return const MaterialPage(child: AddUserPage());
      }
    ),
    GoRoute(
      path: '/pages/select_user_page.dart',
      name: 'select_user',
      pageBuilder: (BuildContext context, GoRouterState state){
        return const MaterialPage(child: SelectUserPage());
      }
    ),
  ],
);