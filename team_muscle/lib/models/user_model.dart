class UserModel {
  final int id;
  final String name;
  final int birthYear;
  final double height;
  final double weight;

  const UserModel(
      {required this.id,
      required this.name,
      required this.birthYear,
      required this.height,
      required this.weight});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'birthYear': birthYear,
      'height': height,
      'weight': weight,
    };
  }

  @override
  toString() {
    return 'UserModel{id: $id, name: $name, birthYear: $birthYear, height: $height, weight: $weight}';
  }
}
