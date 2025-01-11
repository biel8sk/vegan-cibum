import 'package:vegan_cibum/data/repository/i_recipe_repository.dart';
import 'package:vegan_cibum/domain/entities/recipe_entity.dart';

class GetAllRecipes {
  final IRecipeRepository repository;
  GetAllRecipes({required this.repository});

  Future<List<Recipe>> getRecipes(int qnt) async {
    try {
      final result = await repository.fetchRecipe(qnt);
      return result;
    } on Exception catch (e) {
      print("Erro ao pegar receitas: $e");
      return [];
    }catch (e){
      print("Erro desconhecido");
      return [];
    }
  }
}