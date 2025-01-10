import 'package:vegan_cibum/domain/entities/nutrition_entity.dart';
import 'package:vegan_cibum/domain/entities/recipe_entity.dart';

class RecipeDetailEntity extends Recipe{
  final List<String> ingredients;
  final String intructions;
  final Nutrition nutrition;

  RecipeDetailEntity({
    required super.id,
    required super.picture,
    required super.title,
    required this.ingredients,
    required this.intructions,
    required this.nutrition,
  });
}