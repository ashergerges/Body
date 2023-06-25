class MealModel {
  late String name;
  late String calories;
  late String id;
  late String createdAt;

  MealModel({
    required this.name,
    required this.calories,
    required this.id,
    required this.createdAt,
  });

  MealModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    calories = json['calories'];
    id = json['id'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'calories': calories,
      'id': id,
      'createdAt': createdAt,
    };
  }
}