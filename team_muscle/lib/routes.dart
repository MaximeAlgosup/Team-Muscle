import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_muscle/globals.dart' as globals;

// Users Pages
import 'package:team_muscle/pages/users/user_page.dart';
import 'package:team_muscle/pages/users/add_user_page.dart';
import 'package:team_muscle/pages/users/select_user_page.dart';
import 'package:team_muscle/pages/users/profile_page.dart';
import 'package:team_muscle/pages/users/edit_profile_page.dart';

// Exercises Pages
import 'package:team_muscle/pages/exercises/exercise_list_page.dart';
import 'package:team_muscle/pages/exercises/add_exercise_page.dart';
import 'package:team_muscle/pages/exercises/exercise_page.dart';
import 'package:team_muscle/pages/exercises/edit_exercise_page.dart';

// Exercises Data Pages
import 'package:team_muscle/pages/exercise_datas/add_exercise_data_page.dart';
import 'package:team_muscle/pages/exercise_datas/edit_exercise_data_page.dart';
import 'package:team_muscle/pages/exercise_datas/exercise_data_list_page.dart';
import 'package:team_muscle/pages/exercise_datas/exercise_data_page.dart';

// Controllers
import 'package:team_muscle/controllers/exercise_controller.dart';
import 'package:team_muscle/controllers/exercise_data_controller.dart';

// Table
import 'package:team_muscle/database/tables/exercise_table.dart';

final GoRouter router = GoRouter(
  initialLocation: '/pages/users/user_page.dart',
  routes: [
    GoRoute(
        path: '/pages/users/user_page.dart',
        name: 'user',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: UserPage());
        }),
    GoRoute(
        path: '/pages/users/add_user_page.dart',
        name: 'add_user',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: AddUserPage());
        }),
    GoRoute(
        path: '/pages/users/select_user_page.dart',
        name: 'select_user',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: SelectUserPage());
        }),
    GoRoute(
        path: '/pages/users/profile_page.dart',
        name: 'profile',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(child: ProfilePage());
        }),
    GoRoute(
        path: '/pages/users/edit_profile_page.dart',
        name: 'edit_profile',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: EditProfilePage());
        }),
    GoRoute(
        path: '/pages/exercises/exercise_list_page.dart',
        name: 'exercise_list',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: ExerciseListPage());
        }),
    GoRoute(
        path: '/pages/exercises/add_exercise_page.dart',
        name: 'add_exercise',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(child: AddExercisePage());
        }),
    GoRoute(
        path: '/pages/exercises/exercise_page.dart',
        name: 'exercise',
        pageBuilder: (BuildContext context, GoRouterState state) {
          var exerciseId = state.uri.queryParameters['exerciseId'];
          if (exerciseId == null) {
            return const MaterialPage(child: ExerciseListPage());
          }
          ExerciseController exerciseController = ExerciseController();
          exerciseController.setById(int.parse(exerciseId));
          return MaterialPage(
              child: ExercisePage(
                  exerciseController: exerciseController,
                  ExerciseId: exerciseId));
        }),
    GoRoute(
        path: '/pages/exercises/edit_exercise_page.dart',
        name: 'edit_exercise',
        pageBuilder: (BuildContext context, GoRouterState state) {
          var exerciseId = state.uri.queryParameters['exerciseId'];
          if (exerciseId == null) {
            return const MaterialPage(child: ExerciseListPage());
          }
          ExerciseController exerciseController = ExerciseController();
          exerciseController.setById(int.parse(exerciseId));
          return MaterialPage(
              child: EditExercisePage(
                  exerciseController: exerciseController,
                  ExerciseId: exerciseId));
        }),
    GoRoute(
        path: '/pages/exercise_datas/add_exercise_data_page.dart',
        name: 'add_exo_data',
        pageBuilder: (BuildContext context, GoRouterState state) {
          var exerciseId = state.uri.queryParameters['exerciseId'];
          var userId = state.uri.queryParameters['userId'];
          var exerciseName = state.uri.queryParameters['exerciseName'];
          if (exerciseId == null || userId == null) {
            return const MaterialPage(child: ExerciseListPage());
          }
          ExerciseDataController exerciseDataController =
              ExerciseDataController();
          exerciseDataController.setBaseData(exerciseId, userId);
          return MaterialPage(
              child: AddExerciseDataPage(
                  exerciseDataController: exerciseDataController,
                  exerciseName: exerciseName.toString()));
        }),
    GoRoute(
        path: '/pages/exercise_datas/exercise_data_list_page.dart',
        name: 'exercise_data_list',
        pageBuilder: (BuildContext context, GoRouterState state) {
          var exerciseId = state.uri.queryParameters['exerciseId'];
          if (exerciseId == null) {
            return const MaterialPage(child: ExerciseListPage());
          }
          return MaterialPage(
              child: ExerciseDataListPage(exerciseId: int.parse(exerciseId)));
        }),
    GoRoute(
      path: '/pages/exercise_datas/exercise_data_page.dart',
      name: 'exercise_data',
      pageBuilder: (BuildContext context, GoRouterState state) {
        var exerciseDataId = state.uri.queryParameters['exerciseDataId'];
        if (exerciseDataId == null) {
          return const MaterialPage(child: ExerciseListPage());
        }
        ExerciseDataController exerciseDataController =
            ExerciseDataController();
        exerciseDataController.setById(int.parse(exerciseDataId));

        return MaterialPage(
          child: FutureBuilder<String>(
            future: getExerciseNameById(int.parse(exerciseDataId)),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                String name = snapshot.data ?? "Unknown exercise";
                return ExerciseDataPage(
                  exerciseDataId: int.parse(exerciseDataId),
                  controller: exerciseDataController,
                  exerciseName: name,
                );
              }
              ;
            },
          ),
        );
      },
    ),
    GoRoute(
      path: '/pages/exercise_datas/edit_exercise_data_page.dart',
      name: 'edit_exo_data',
      pageBuilder: (BuildContext context, GoRouterState state) {
        var exerciseDataId = state.uri.queryParameters['exerciseDataId'];
        var exerciseName = state.uri.queryParameters['exerciseName'];
        var isPersonalRecord = state.uri.queryParameters['isPersonalRecord'];
        ExerciseDataController exerciseDataController =
            ExerciseDataController();
        exerciseDataController.setById(int.parse(exerciseDataId!));
        exerciseDataController.setPersonalRecord(isPersonalRecord == 'true');
        return MaterialPage(
          child: EditExerciseDataPage(
            exerciseDataId: int.parse(exerciseDataId),
            exerciseDataController: exerciseDataController,
            exerciseName: exerciseName.toString(),
            isPersonalRecord: isPersonalRecord== 'true',
          ),
        );
      },
    ),
  ],
);
