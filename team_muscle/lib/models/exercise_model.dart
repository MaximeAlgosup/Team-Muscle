import 'package:team_muscle/models/tag_model.dart';
import 'package:team_muscle/models/exercise_data_model.dart';

class ExerciseModel {
  final String name;
  final String description;
  final List<TagModel> tags;
  final List<ExerciseDataModel> data = [];


  ExerciseModel(
      {required this.name, required this.description, required this.tags});
}
