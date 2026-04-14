class Meal {
  final String name;
  final int calories;
  final DateTime date;

  Meal({required this.name, required this.calories, required this.date});

  Meal copyWith({String? name, int? calories, DateTime? date}) {
    return Meal(
      name: name ?? this.name,
      calories: calories ?? this.calories,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'calories': calories,
    'date': date.toIso8601String(),
  };

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    name: json['name'],
    calories: json['calories'],
    date: DateTime.parse(json['date']),
  );
}
