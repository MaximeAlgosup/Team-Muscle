import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Controllers
import 'package:team_muscle/controllers/exercise_controller.dart';

// Tables
import 'package:team_muscle/widgets/fields/text_area_widget.dart';
import 'package:team_muscle/widgets/fields/text_field_widget.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({
    required this.exerciseController,
    required this.ExerciseId,
    super.key});

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
                      context.goNamed('edit_exercise', queryParameters: {'exerciseId': ExerciseId});
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
