import 'package:vegan_cibum/data/models/recipe_model.dart';
import 'package:vegan_cibum/data/repository/recipe_use_case_repository.dart';

class GetRecipes {
  final RecipeUseCaseRepository repository;
  GetRecipes({required this.repository});

  Future<List<RecipeModel>> getRecipes() async {
    final result = await repository.fetchRecipe();
    return result;
  }
}