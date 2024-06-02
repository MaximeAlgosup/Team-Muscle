import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Widgets
import 'package:team_muscle/widgets/buttons/simple_button_widget.dart';
import 'package:team_muscle/widgets/fields/text_area_widget.dart';
import 'package:team_muscle/widgets/fields/text_field_widget.dart';

// Controllers
import 'package:team_muscle/controllers/exercise_controller.dart';

class AddExercisePage extends StatelessWidget {
  AddExercisePage({super.key});

  final controller = ExerciseController();

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
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFieldWidget(
                      label: 'Name',
                      hintText: 'Enter the exercise name',
                      controller: controller.name,
                    ),
                    TextAreaWidget(
                      label: 'Description',
                      hintText: 'Enter the exercise description',
                      controller: controller.description,
                    ),
                    SimpleButtonWidget(
                      label: 'Save',
                      onPressed: () {
                        controller.saveExercise();
                        context.goNamed('exercise_list');
                      },
                    ),
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
