import 'package:flutter/material.dart';
import 'package:vegan_cibum/data/repository/i_recipe_repository.dart';
import 'package:vegan_cibum/domain/entities/recipe_information_entity.dart';

class GetDetailRecipe {
  final IRecipeRepository recipeRepository;
  GetDetailRecipe(this.recipeRepository);

  Future<RecipeInformation?> getDetail(int id) async {
    try {
      final datails = await recipeRepository.getDetailRecipe(id);
      debugPrint(datails.toString());
      return datails;
    }on Exception catch (e){
      debugPrint("Erro no service: $e");
      return null;
    }catch (e){
      debugPrint("Erro inesperado: $e");
      return null;
    }
  }
}