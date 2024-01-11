class Failure {
  final String name;
  final String? description;

  const Failure({required this.name, this.description});

  @override
  String toString() {
    return '{$runtimeType, $name, $description}';
  }
}
