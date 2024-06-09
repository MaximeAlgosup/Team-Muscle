import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_muscle/globals.dart' as globals;

// Controllers
import 'package:team_muscle/controllers/exercise_controller.dart';
import 'package:team_muscle/widgets/buttons/icon_button_widget.dart';

// Tables
import 'package:team_muscle/widgets/fields/text_area_widget.dart';
import 'package:team_muscle/widgets/fields/text_field_widget.dart';

// Widgets
import 'package:team_muscle/widgets/selects/select_exercise_record_widget.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage(
      {required this.exerciseController, required this.exerciseId, super.key});

  final ExerciseController exerciseController;
  final String exerciseId;

  @override
  Widget build(BuildContext context) {
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
              TextFieldWidget(
                label: 'Name',
                hintText: 'Enter the exercise name',
                controller: exerciseController.name,
                isEditable: false,
              ),
              TextAreaWidget(
                label: 'Description',
                hintText: 'Enter the exercise description',
                controller: exerciseController.description,
                isEditable: false,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
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
                      icon: const Icon(Icons.trending_up_outlined),
                      color: Colors.green,
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
    );
  }
}
