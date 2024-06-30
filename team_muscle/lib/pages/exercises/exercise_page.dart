import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_muscle/globals.dart' as globals;

// Controllers
import 'package:team_muscle/controllers/exercise_controller.dart';

// Tables
import 'package:team_muscle/widgets/navbar_widget.dart';
import 'package:team_muscle/widgets/others/loading_widget.dart';

// Widgets
import 'package:team_muscle/widgets/selects/select_exercise_record_widget.dart';

class ExercisePage extends StatefulWidget {
  const ExercisePage(
      {required this.exerciseController, required this.exerciseId, super.key});

  final ExerciseController exerciseController;
  final String exerciseId;

  @override
  _ExercisePageState createState() =>
      _ExercisePageState(exerciseController: exerciseController, exerciseId: exerciseId);
}

class _ExercisePageState extends State<ExercisePage> {
   _ExercisePageState({required this.exerciseController, required this.exerciseId});

  final ExerciseController exerciseController;
  final String exerciseId;
  Widget _body = const LoadingWidget();

  void _setExerciseData() async {
    exerciseController.setById(int.parse(exerciseId)).then((value) {
      setState(() {
        _body = buildExercisePage(context);
      });
    });
  }

   @override
   initState() {
     super.initState();
     _setExerciseData();
   }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  Widget buildExercisePage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {
                      context.goNamed('exercise_list');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.black),
                    onPressed: () {
                      context.goNamed('edit_exercise',
                          queryParameters: {'exerciseId': exerciseId});
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    exerciseController.name.text,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber[800],
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      exerciseController.description.text,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add, size: 40),
                      color: Colors.amber[800],
                      onPressed: () {
                        context.goNamed('add_exo_data', queryParameters: {
                          'exerciseId': exerciseId,
                          'exerciseName': exerciseController.name.text,
                          'userId': globals.userIndex.toString(),
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.query_stats_rounded, size: 40),
                      color: Colors.lightGreenAccent,
                      onPressed: () {
                        debugPrint("data button is pressed");
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.4,
                child: SelectExerciseRecordWidget(
                  exerciseId: int.parse(exerciseId),
                  exerciseName: exerciseController.name.text,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          color: Colors.grey[600], child: const NavbarWidget(selectedIndex: 0)),
    );
  }
}
