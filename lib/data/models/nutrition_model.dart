

import 'package:vegan_cibum/domain/entities/nutrient_entity.dart';
import 'package:vegan_cibum/domain/entities/nutrition_entity.dart';

class NutritionModel extends Nutrition {
  NutritionModel({required super.nutrients});



  factory NutritionModel.fromJson(Map<String, dynamic> json) {
    return NutritionModel(
      nutrients: (json['nutrients'] as List)
          .map((nutrient) => NutrientModel.fromJson(nutrient))
          .toList(),
    );
  } 
}

class NutrientModel extends Nutrient{
  NutrientModel({required super.title, required super.amount, required super.unit, required super.percentOfDailyNeeds});
  


  factory NutrientModel.fromJson(Map<String, dynamic> json) {
    return NutrientModel(
      title: json['title'] ?? '',
      amount: json['amount'] ?? '',
      unit: json['unit']?? '',
      percentOfDailyNeeds: json['percentOfDailyNeeds'] ?? '',
    );
  } 
} 