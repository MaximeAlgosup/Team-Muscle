import 'package:flutter/material.dart';

// Models
import 'package:team_muscle/models/exercise_model.dart';
import 'package:team_muscle/models/tag_model.dart';

// Tables
import 'package:team_muscle/tables/exercise_table.dart';

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

  void setFields(ExerciseModel exercise) {
    name.text = exercise.name;
    description.text = exercise.description;
  }

  void setById(int id) async {
    final ExerciseModel exercise = await findExerciseById(id);
    setFields(exercise);
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
    ExerciseModel exercise = ExerciseModel(
      id: exerciseId,
      name: name.text,
      description: description.text,
    );
    insertExercise(exercise);
    clearFields();
  }
}