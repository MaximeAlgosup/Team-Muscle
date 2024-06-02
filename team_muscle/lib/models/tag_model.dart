class TagModel {
  final int id;
  final String name;
  final String description;

  TagModel({
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
    return 'TagModel{id: $id, name: $name, description: $description}';
  }
}
