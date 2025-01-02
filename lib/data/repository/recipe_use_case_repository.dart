import 'package:vegan_cibum/data/models/recipe_model.dart';

abstract class RecipeUseCaseRepository {
  Future<List<RecipeModel>> fetchRecipe();
}