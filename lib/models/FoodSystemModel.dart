class FoodSystemModel {
  late int code;
  late int fromWeight;
  late int toWeight;
  late String breakfast;
  late String lunch;
  late String dinner;
  late String extraMeal;
  late String notice;
  late String id;
  late String createdAt;

  FoodSystemModel({
    required this.fromWeight,
    required this.toWeight,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.extraMeal,
    required this.notice,
    required this.id,
    required this.createdAt,
    required this.code,
  });

  FoodSystemModel.fromJson(Map<String, dynamic> json) {
    fromWeight = json['fromWeight'];
    toWeight = json['toWeight'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    extraMeal = json['extraMeal'];
    notice = json['notice'];
    id = json['id'];
    createdAt = json['createdAt'];
    code = json['code'];
  }

  Map<String, dynamic> toMap() {
    return {
      'fromWeight': fromWeight,
      'toWeight': toWeight,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
      'extraMeal': extraMeal,
      'notice': notice,
      'id': id,
      'createdAt': createdAt,
      'code': code,
    };
  }
}