import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Controllers
import 'package:team_muscle/controllers/exercise_controller.dart';

// Widgets
import 'package:team_muscle/widgets/fields/text_area_widget.dart';
import 'package:team_muscle/widgets/fields/text_field_widget.dart';
import 'package:team_muscle/widgets/buttons/simple_button_widget.dart';
import 'package:team_muscle/widgets/navbar_widget.dart';

class EditExercisePage extends StatelessWidget {
  const EditExercisePage({
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
                      context.goNamed('exercise', queryParameters: {'exerciseId': ExerciseId});
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                "Edit ${exerciseController.name.text.toLowerCase()} record",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextFieldWidget(
                      label: 'Name',
                      hintText: 'Enter the exercise name',
                      controller: exerciseController.name,
                    ),
                    TextAreaWidget(
                      label: 'Description',
                      hintText: 'Enter the exercise description',
                      controller: exerciseController.description,
                    ),
                    SimpleButtonWidget(
                      label: 'Save',
                      onPressed: () {
                        exerciseController.updateExercise(int.parse(ExerciseId));
                        context.goNamed('exercise', queryParameters: {'exerciseId': ExerciseId});
                      },
                    ),
                    SimpleButtonWidget(
                      label: 'Delete',
                      isWarning: true,
                      onPressed: () {
                        exerciseController.deleteExercise();
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
      bottomNavigationBar: Container(
          color: Colors.grey[600], child: const NavbarWidget(selectedIndex: 0)),
    );
  }
}
