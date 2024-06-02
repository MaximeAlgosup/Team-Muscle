import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Widgets
import 'package:team_muscle/widgets/buttons/icon_button_widget.dart';
import 'package:team_muscle/widgets/navbar_widget.dart';
import 'package:team_muscle/widgets/selects/select_exercise_widget.dart';

// Models
import 'package:team_muscle/models/exercise_model.dart';

// Tables
import 'package:team_muscle/tables/exercise_table.dart';

class ExerciseListPage extends StatelessWidget {
  const ExerciseListPage({super.key});

  Future<bool> isExercises() async {
    final List<ExerciseModel> exercisesList = await exercises();
    if (exercisesList.isEmpty) {
      return false;
    }
    return true;
  }

  Future<List<ExerciseModel>> getExercises() async {
    final List<ExerciseModel> exercisesList = await exercises();
    return exercisesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[600],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SelectExerciseWidget(),
              const SizedBox(height: 20),
              Center(
                child: IconButtonWidget(
                  label: 'Add Exercise',
                  icon: Icons.add,
                  onPressed: () {
                    print("Add Exercise");
                    context.goNamed("add_exercise");
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          color: Colors.grey[600],
          child: const NavbarWidget(selectedIndex: 0)
      ),
    );
  }
}