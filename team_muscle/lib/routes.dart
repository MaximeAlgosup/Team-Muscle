import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Pages
import 'package:team_muscle/pages/home_page.dart';
// Users Pages
import 'package:team_muscle/pages/users/user_page.dart';
import 'package:team_muscle/pages/users/add_user_page.dart';
import 'package:team_muscle/pages/users/select_user_page.dart';
import 'package:team_muscle/pages/users/profile_page.dart';
import 'package:team_muscle/pages/users/edit_profile_page.dart';
// Exercises Pages
import 'package:team_muscle/pages/exercises/exercise_list_page.dart';
import 'package:team_muscle/pages/exercises/add_exercise_page.dart';



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
      path: '/pages/users/user_page.dart',
      name: 'user',
      pageBuilder: (BuildContext context, GoRouterState state){
        return const MaterialPage(child: UserPage());
      }
    ),
    GoRoute(
      path: '/pages/users/add_user_page.dart',
      name: 'add_user',
      pageBuilder: (BuildContext context, GoRouterState state){
        return const MaterialPage(child: AddUserPage());
      }
    ),
    GoRoute(
      path: '/pages/users/select_user_page.dart',
      name: 'select_user',
      pageBuilder: (BuildContext context, GoRouterState state){
        return const MaterialPage(child: SelectUserPage());
      }
    ),
    GoRoute(
      path: '/pages/users/profile_page.dart',
      name: 'profile',
      pageBuilder: (BuildContext context, GoRouterState state){
        return const MaterialPage(child: ProfilePage());
      }
    ),
    GoRoute(
      path: '/pages/users/edit_profile_page.dart',
      name: 'edit_profile',
      pageBuilder: (BuildContext context, GoRouterState state){
        return const MaterialPage(child: EditProfilePage());
      }
    ),
    GoRoute(
      path: '/pages/exercises/exercise_list_page.dart',
      name: 'exercise_list',
      pageBuilder: (BuildContext context, GoRouterState state){
        return const MaterialPage(child: ExerciseListPage());
      }
    ),
    GoRoute(
      path: '/pages/exercises/add_exercise_page.dart',
      name: 'add_exercise',
      pageBuilder: (BuildContext context, GoRouterState state){
        return MaterialPage(child: AddExercisePage());
      }
    ),
  ],
);