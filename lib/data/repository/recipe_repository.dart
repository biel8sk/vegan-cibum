import 'package:vegan_cibum/data/models/recipe_model.dart';

abstract class IRecipeRepository {
  Future<List<RecipeModel>> fetchRecipe();
}