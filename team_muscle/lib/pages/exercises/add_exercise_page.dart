import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Widgets
import 'package:team_muscle/widgets/buttons/icon_button_widget.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: Container(
          color: Colors.grey[600],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButtonWidget(
                  label: 'Back',
                  icon: Icons.arrow_back,
                  onPressed: () {
                    context.goNamed("exercise_list");
                  },
                ),
                IconButtonWidget(
                  label: 'Save',
                  icon: Icons.save,
                  onPressed: () {
                    controller.saveExercise();
                    context.goNamed("exercise_list");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[600],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                label: 'Name: ',
                hintText: 'Enter exercise name',
                controller: controller.name,
                isEditable: true,
              ),
              TextAreaWidget(
                label: 'Description: ',
                hintText: 'Enter exercise description',
                controller: controller.description,
                isEditable: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
