import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    isPersonalRecord.text = exerciseData.isPersonalRecord.toString();
    exerciseId.text = exerciseData.exerciseId.toString();
    userId.text = exerciseData.userId.toString();
  }

  ExerciseDataController getExoDataById(int id)  {
    Future<ExerciseDataModel> futureExerciseData = findExerciseDataById(id);
    futureExerciseData.then((exerciseData) => setFields(exerciseData));
    return this;
  }


  void setById(int id) async {
    final ExerciseDataModel exerciseData = await findExerciseDataById(id);
    debugPrint(exerciseData.toString());
    setFields(exerciseData);
  }

  void setPersonalRecord(bool isPersonalRecord) {
    this.isPersonalRecord.text = isPersonalRecord.toString();
  }

  void setBaseData(String exerciseId, String userId) {
    date.text = '2012-12-21';
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

  void deleteExerciseData(int id) async {
    await deleteExerciseDataRow(id);
  }

  void saveExerciseData() async{
    int exerciseDataNumber = await getTableLength();
    int exerciseDataId = exerciseDataNumber + 1;
    String date = this.date.text.replaceAll('/', '-');
    ExerciseDataModel exerciseData = ExerciseDataModel(
      id: exerciseDataId,
      date: DateFormat('yyyy-MM-dd').parse(date),
      weight: double.parse(weight.text),
      reps: int.parse(reps.text),
      sets: int.parse(sets.text),
      isPersonalRecord: isPersonalRecord.text == 'true',
      exerciseId: int.parse(exerciseId.text),
      userId: int.parse(userId.text),
    );
    debugPrint(exerciseData.toString());
    insertExerciseData(exerciseData);
    clearFields();
  }
}