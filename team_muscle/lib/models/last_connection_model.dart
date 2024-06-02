class LastConnectionModel {
  int id;
  final int userId;
  final DateTime date;

  LastConnectionModel({
    required this.id,
    required this.userId,
    required this.date,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'LastConnectionModel{id: $id, userId: $userId, date: $date}';
  }
}