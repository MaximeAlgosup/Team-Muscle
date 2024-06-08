import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_muscle/widgets/fields/date_field_widget.dart';

// Widgets
import 'package:team_muscle/widgets/fields/number_field_widget.dart';
import 'package:team_muscle/widgets/buttons/icon_button_widget.dart';

// Controllers
import 'package:team_muscle/controllers/exercise_data_controller.dart';

class EditExerciseDataPage extends StatefulWidget {
  EditExerciseDataPage(
      {required this.exerciseDataId,
      required this.exerciseDataController,
      required this.exerciseName,
      required this.isPersonalRecord,
      super.key});

  final int exerciseDataId;
  final ExerciseDataController exerciseDataController;
  final String exerciseName;
  bool isPersonalRecord;

  @override
  State<EditExerciseDataPage> createState() =>
      _EditExerciseDataPageState(exerciseDataId, exerciseDataController, exerciseName, isPersonalRecord);
}

class _EditExerciseDataPageState extends State<EditExerciseDataPage> {
  final int _exerciseDataId;
  final ExerciseDataController _exerciseDataController;
  final String _exerciseName;
  bool _isPersonalRecord;

  _EditExerciseDataPageState(this._exerciseDataId, this._exerciseDataController, this._exerciseName, this._isPersonalRecord);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isPersonalRecord =  _exerciseDataController.isPersonalRecord.text == 'true';
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('exerciseId: ${_isPersonalRecord.toString()}');
    debugPrint('exerciseId: ${_exerciseDataController.isPersonalRecord.text}');

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
                      context.goNamed('exercise_data', queryParameters: {
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
                      child: Text(
                        "Add new ${_exerciseName.toLowerCase()} record",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                      value:  _isPersonalRecord,
                      activeColor: Colors.amber[800],
                      onChanged: (value) {
                        setState(() {
                          _isPersonalRecord = value;
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
                    label: "Save record",
                    onPressed: () {
                      _exerciseDataController
                          .setPersonalRecord(_isPersonalRecord);
                      debugPrint('exerciseId: ${_exerciseDataController.exerciseId.text}');
                      // _exerciseDataController.updateExerciseData(_exerciseDataId);
                      // context.goNamed('exercise_data_list', queryParameters: {
                      //   'exerciseId': _exerciseDataController.exerciseId.text
                      // });
                    },
                    icon: Icons.save,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButtonWidget(
                        label: "Delete record",
                        onPressed: () {
                          _exerciseDataController.deleteExerciseData(_exerciseDataId);
                          debugPrint('exerciseId: ${_exerciseDataController.exerciseId.text}');
                          context.goNamed('exercise_data_list', queryParameters: {
                            'exerciseId': _exerciseDataController.exerciseId.text
                          });
                        },
                        icon: Icons.delete,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
