import 'package:vegan_cibum/domain/entities/nutrition_entity.dart';
import 'package:vegan_cibum/domain/entities/steps_recipe.dart';

class RecipeInformation {
  final int id;
  final String title;
  final String image;
  final List<StepsRecipe>? instructions;
  final List<String> extendedIngredients;
  final Nutrition? nutrition;
  final String? summary;
  final int readyInMinutes;

  RecipeInformation( {
    required this.readyInMinutes,
    required this.id,
    required this.title,
    required this.image,
    this.instructions,
    required this.extendedIngredients,
    this.nutrition,
    this.summary,
  });
}