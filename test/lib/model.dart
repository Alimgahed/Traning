class Person {
  final String name;

  Person({required this.name});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
