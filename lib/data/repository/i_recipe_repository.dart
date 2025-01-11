import 'package:vegan_cibum/data/models/recipe_detail_model.dart';
import 'package:vegan_cibum/data/models/recipe_model.dart';

abstract class IRecipeRepository {
  Future<List<RecipeModel>> fetchRecipe(int qnt);
  Future<RecipeDetailModel> getDetailRecipe(int id);
}