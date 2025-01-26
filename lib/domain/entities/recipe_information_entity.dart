import 'package:vegan_cibum/domain/entities/nutrition_entity.dart';

class RecipeInformation {
  final int id;
  final String title;
  final String image;
  final String? instructions;
  final List<String> extendedIngredients;
  final Nutrition? nutrition;
  final String? summary;

  RecipeInformation({
    required this.id,
    required this.title,
    required this.image,
    this.instructions,
    required this.extendedIngredients,
    this.nutrition,
    this.summary,
  });
}