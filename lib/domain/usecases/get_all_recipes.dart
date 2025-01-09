import 'package:vegan_cibum/data/models/recipe_model.dart';
import 'package:vegan_cibum/data/repository/recipe_use_case_repository.dart';

class GetAllRecipes {
  final IRecipeUseCaseRepository repository;
  GetAllRecipes({required this.repository});

  Future<List<RecipeModel>> getRecipes() async {
    final result = await repository.fetchRecipe();
    return result;
  }
}