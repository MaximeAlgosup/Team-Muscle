import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_muscle/globals.dart' as globals;

// Controllers
import 'package:team_muscle/controllers/exercise_controller.dart';
import 'package:team_muscle/widgets/buttons/icon_button_widget.dart';

// Tables
import 'package:team_muscle/widgets/fields/text_area_widget.dart';
import 'package:team_muscle/widgets/fields/text_field_widget.dart';


class ExercisePage extends StatelessWidget {
  const ExercisePage(
      {required this.exerciseController, required this.ExerciseId, super.key});

  final ExerciseController exerciseController;
  final String ExerciseId;

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
                          queryParameters: {'exerciseId': ExerciseId});
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
              IconButtonWidget(
                label: "Add Data",
                onPressed: () {
                  context.goNamed('add_exo_data', queryParameters: {
                    'exerciseId': ExerciseId,
                    'userId': globals.userIndex.toString(),
                    'exerciseName': exerciseController.name.text.toString()
                  });
                },
                icon: Icons.add,
              ),
              IconButtonWidget(
                label: "View Data",
                onPressed: () {
                  context.goNamed('exercise_data_list',
                      queryParameters: {'exerciseId': ExerciseId});
                },
                icon: Icons.visibility,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
