import 'package:vegan_cibum/domain/entities/nutrition_entity.dart';

class NutritionModel extends Nutrition{
  NutritionModel(
      {required super.calories,
      required super.protein,
      required super.fat,
      required super.carbohydrates});

  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      calories: json['calories'] * 1.0,
      protein: json['protein'] *1.0,
      fat: json['fat']*1.0,
      carbohydrates: json['carbohydrates']*1.0,
    );
  }
}