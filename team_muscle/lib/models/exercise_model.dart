// import 'package:team_muscle/models/tag_model.dart';

class ExerciseModel {
  final int id;
  final String name;
  final String description;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.description});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'ExerciseModel{id: $id, name: $name, description: $description}';
  }
}
