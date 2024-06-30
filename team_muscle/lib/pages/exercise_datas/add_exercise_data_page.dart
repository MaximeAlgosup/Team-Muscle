import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_muscle/widgets/fields/date_field_widget.dart';

// Widgets
import 'package:team_muscle/widgets/fields/number_field_widget.dart';
import 'package:team_muscle/widgets/buttons/icon_button_widget.dart';

// Controllers
import 'package:team_muscle/controllers/exercise_data_controller.dart';
import 'package:team_muscle/widgets/navbar_widget.dart';

class AddExerciseDataPage extends StatefulWidget {
  const AddExerciseDataPage(
      {required this.exerciseDataController,
      required this.exerciseName,
      super.key});

  final ExerciseDataController exerciseDataController;
  final String exerciseName;

  @override
  State<AddExerciseDataPage> createState() =>
      _AddExerciseDataPageState(exerciseDataController, exerciseName);
}

class _AddExerciseDataPageState extends State<AddExerciseDataPage> {
  bool isPersonalRecord = false;
  final ExerciseDataController _exerciseDataController;
  final String _exerciseName;

  _AddExerciseDataPageState(this._exerciseDataController, this._exerciseName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {
                      context.goNamed('exercise', queryParameters: {
                        'exerciseId': _exerciseDataController.exerciseId.text
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          "Add new ${_exerciseName.toLowerCase()} record",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ),
                  ),
                ],
              ),
              DateFieldWidget(
                  label: "Select the record date",
                  hintText: "Pick a date",
                  controller: _exerciseDataController.date),
              NumberFieldWidget(
                label: 'Weight: ',
                hintText: 'Enter the weight you lifted',
                controller: _exerciseDataController.weight,
              ),
              NumberFieldWidget(
                label: 'Reps: ',
                hintText: 'Enter the reps you did',
                controller: _exerciseDataController.reps,
              ),
              NumberFieldWidget(
                label: 'Sets: ',
                hintText: 'Enter the sets you did',
                controller: _exerciseDataController.sets,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Switch(
                      value: isPersonalRecord,
                      activeColor: Colors.amber[800],
                      onChanged: (value) {
                        setState(() {
                          isPersonalRecord = value;
                        });
                      },
                    ),
                  ),
                  const Text(
                    "Was it a PR ?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButtonWidget(
                    label: "Add Record",
                    onPressed: () {
                      _exerciseDataController
                          .setPersonalRecord(isPersonalRecord);
                      _exerciseDataController.saveExerciseData();
                      context.goNamed('exercise', queryParameters: {
                        'exerciseId': _exerciseDataController.exerciseId.text
                      });
                    },
                    icon: Icons.add,
                  ),
                ],
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
