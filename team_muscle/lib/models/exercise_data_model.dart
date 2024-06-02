class ExerciseDataModel {
  final int id;
  final DateTime date;
  final double weight;
  final int reps;
  final int sets;
  final bool isPersonalRecord;
  final int exerciseId;
  final int userId;

  ExerciseDataModel({
    required this.id,
    required this.date,
    required this.weight,
    required this.reps,
    required this.sets,
    required this.isPersonalRecord,
    required this.exerciseId,
    required this.userId});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'weight': weight,
      'reps': reps,
      'sets': sets,
      'isPersonalRecord': isPersonalRecord ? 1 : 0,
      'exerciseId': exerciseId,
      'userId': userId,
    };
  }

  @override
  String toString() {
    return 'ExerciseDataModel{id: $id, date: $date, weight: $weight, reps: $reps, sets: $sets, isPersonalRecord: $isPersonalRecord, exerciseId: $exerciseId, userId: $userId}';
  }
}