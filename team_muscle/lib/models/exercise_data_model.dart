class ExerciseDataModel {
  final DateTime date;
  final double weight;
  final int reps;
  final int sets;
  final bool isPersonalRecord;

  ExerciseDataModel(
      {required this.date,
      required this.weight,
      required this.reps,
      required this.sets,
      required this.isPersonalRecord});
}