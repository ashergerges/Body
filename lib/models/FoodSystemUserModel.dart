class FoodSystemUserModel {
  late String weight;
  late String age;
  late String gender;
  late String height;
  late String bmi;
  late String fat;
  late String water;
  late String muscle;
  late String bone;
  late String bmr;
  late String data;
  late String breakfast;
  late String lunch;
  late String dinner;
  late String extraMeal;
  late String notice;
  late String id;
  late String createdAt;

  FoodSystemUserModel({
    required this.weight,
    required this.gender,
    required this.age,
    required this.height,
    required this.bmi,
    required this.bmr,
    required this.bone,
    required this.fat,
    required this.muscle,
    required this.water,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.extraMeal,
    required this.notice,
    required this.id,
    required this.createdAt,
    required this.data,
  });

  FoodSystemUserModel.fromJson(Map<String, dynamic> json) {
    bone = json['bone'];
    water = json['water'];
    muscle = json['muscle'];
    fat = json['fat'];
    bmr = json['bmr'];
    height = json['height'];
    gender = json['gender'];
    weight = json['weight'];
    bmi = json['bmi'];
    age = json['age'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    extraMeal = json['extraMeal'];
    notice = json['notice'];
    id = json['id'];
    createdAt = json['createdAt'];
    data = json['data'];
  }

  Map<String, dynamic> toMap() {
    return {
      'bone': bone,
      'water': water,
      'muscle': muscle,
      'fat': fat,
      'bmr': bmr,
      'height': height,
      'gender': gender,
      'weight': weight,
      'bmi': bmi,
      'age': age,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
      'extraMeal': extraMeal,
      'notice': notice,
      'id': id,
      'createdAt': createdAt,
      'data': data,
    };
  }
}