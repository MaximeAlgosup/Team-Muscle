import 'package:flutter/material.dart';

// Models
import 'package:team_muscle/models/exercise_data_model.dart';

// Tables
import 'package:team_muscle/database/tables/exercise_data_table.dart';

class ExerciseDataController {

  final TextEditingController date = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController reps = TextEditingController();
  final TextEditingController sets = TextEditingController();
  final TextEditingController isPersonalRecord = TextEditingController();
  final TextEditingController exerciseId = TextEditingController();
  final TextEditingController userId = TextEditingController();

  void clearFields() {
    date.clear();
    weight.clear();
    reps.clear();
    sets.clear();
    isPersonalRecord.clear();
    exerciseId.clear();
    userId.clear();
  }

  void dispose() {
    date.dispose();
    weight.dispose();
    reps.dispose();
    sets.dispose();
    isPersonalRecord.dispose();
    exerciseId.dispose();
    userId.dispose();
  }

  void setFields(ExerciseDataModel exerciseData) {
    date.text = exerciseData.date.toString();
    weight.text = exerciseData.weight.toString();
    reps.text = exerciseData.reps.toString();
    sets.text = exerciseData.sets.toString();
    isPersonalRecord.text = exerciseData.isPersonalRecord.toString();
    exerciseId.text = exerciseData.exerciseId.toString();
    userId.text = exerciseData.userId.toString();
  }



  void setById(int id) async {
    final ExerciseDataModel exerciseData = await findExerciseDataById(id);
    setFields(exerciseData);
  }

  void setPersonalRecord(bool isPersonalRecord) {
    this.isPersonalRecord.text = isPersonalRecord.toString();
  }

  void setBaseData(String exerciseId, String userId) {
    date.text = '';
    weight.text = '0';
    reps.text = '0';
    sets.text = '0';
    isPersonalRecord.text = 'false';
    this.exerciseId.text = exerciseId;
    this.userId.text = userId;
  }

  void updateExerciseData(int id) async {
    ExerciseDataModel exerciseData = ExerciseDataModel(
      id: id,
      date: DateTime.parse(date.text),
      weight: double.parse(weight.text),
      reps: int.parse(reps.text),
      sets: int.parse(sets.text),
      isPersonalRecord: isPersonalRecord.text == 'true',
      exerciseId: int.parse(exerciseId.text),
      userId: int.parse(userId.text),
    );
    updateExerciseDataRow(exerciseData);
    clearFields();
  }

  void deleteExerciseData() async {
    await deleteExerciseDataRow(int.parse(date.text));
  }

  void saveExerciseData() async{
    // get exerciseDatas number
    int exerciseDatasNumber = await exerciseDatas().then((value) => value.length);
    int exerciseDataId = exerciseDatasNumber + 1;
    ExerciseDataModel exerciseData = ExerciseDataModel(
      id: exerciseDataId,
      date: DateTime.parse(date.text..replaceAll('/', '-')),
      weight: double.parse(weight.text),
      reps: int.parse(reps.text),
      sets: int.parse(sets.text),
      isPersonalRecord: isPersonalRecord.text == 'true',
      exerciseId: int.parse(exerciseId.text),
      userId: int.parse(userId.text),
    );
    insertExerciseData(exerciseData);
    clearFields();
  }
}