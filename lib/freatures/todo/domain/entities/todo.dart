// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final String name;
  final String description;
  final DateTime createdAt;

  Todo({
    required this.name,
    required this.createdAt,
    required this.description,
  });

  @override
  String toString() =>
      'Todo(name: $name, description: $description, createdAt: $createdAt)';
}
