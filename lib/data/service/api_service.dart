import 'package:vegan_cibum/data/models/recipe_model.dart';
import 'package:vegan_cibum/data/repository/recipe_use_case_repository.dart';

class ApiService implements RecipeUseCaseRepository{
  @override
  Future<List<RecipeModel>> fetchRecipe() {
    
    throw UnimplementedError();
  }

}