class User {
  final String id;
  final String name;
  final String number;

  User({
    required this.id,
    required this.name,
    required this.number,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '', // Provide an empty string id as the default value
      name: json['name'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'number': number,
    };
  }
}
