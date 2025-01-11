import 'package:vegan_cibum/data/repository/i_recipe_repository.dart';
import 'package:vegan_cibum/domain/entities/recipe_detail_entity.dart';

class GetDetailRecipe {
  final IRecipeRepository recipeRepository;
  GetDetailRecipe(this.recipeRepository);

  Future<RecipeDetailEntity?> getDetail(int id) async {
    try {
      final datails = await recipeRepository.getDetailRecipe(id);
      return datails;
    }on Exception catch (e){
      print("Erro no service: $e");
      return null;
    }catch (e){
      print("Erro inesperado: $e");
      return null;
    }
  }
}