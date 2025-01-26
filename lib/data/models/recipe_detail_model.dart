import 'package:vegan_cibum/data/models/nutrition_model.dart';
import 'package:vegan_cibum/domain/entities/recipe_information_entity.dart';

class RecipeDetailModel extends RecipeInformation {
  RecipeDetailModel({required super.id, required super.title, required super.instructions, required super.nutrition, required super.summary, required super.image, required super.extendedIngredients});

  factory RecipeDetailModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      instructions: json['instructions'],
      extendedIngredients: (json['extendedIngredients'] as List)
          .map((ingredient) => ingredient['original'] as String)
          .toList(),
      nutrition: json['nutrition'] != null
          ? NutritionModel.fromJson(json['nutrition'])
          : null,
      summary: json['summary'],
    );
  }
}
