import 'package:vegan_cibum/data/models/recipe_model.dart';

abstract class IRecipeUseCaseRepository {
  Future<List<RecipeModel>> fetchRecipe();
}