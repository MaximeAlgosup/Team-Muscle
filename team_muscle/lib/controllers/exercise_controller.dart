import 'package:flutter/material.dart';

// Models
import 'package:team_muscle/models/exercise_model.dart';
// import 'package:team_muscle/models/tag_model.dart';

// Tables
import 'package:team_muscle/database/tables/exercise_table.dart';

class ExerciseController {

  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();

  void clearFields() {
    name.clear();
    description.clear();
  }

  void dispose() {
    name.dispose();
    description.dispose();
  }

  Future<bool> setFields(ExerciseModel exercise) {
    name.text = exercise.name;
    description.text = exercise.description;
    return Future.value(true);
  }

  Future<bool> setById(int id) async {
    final ExerciseModel exercise = await findExerciseById(id);
    setFields(exercise).then((value) {
      if (value) {
        return true;
      }
      else {
        return false;
      }
    });
    return true;
  }

  void updateExercise(int id) async {
    ExerciseModel exercise = ExerciseModel(
      id: id,
      name: name.text,
      description: description.text,
    );
    updateExerciseRow(exercise);
    clearFields();
  }

  void deleteExercise() async {
    await deleteExerciseRow(name.text);
  }

  void saveExercise() async{
    // get exercises number
    int exercisesNumber = await exercises().then((value) => value.length);
    int exerciseId = exercisesNumber + 1;
    final List<ExerciseModel> exercisesList = await exercises();
    for(ExerciseModel exo in exercisesList) {
      if(exo.name == name.text) {
        updateExercise(exo.id);
        return;
      }
    }
    ExerciseModel exercise = ExerciseModel(
      id: exerciseId,
      name: name.text,
      description: description.text,
    );
    insertExercise(exercise);
    clearFields();
  }
}