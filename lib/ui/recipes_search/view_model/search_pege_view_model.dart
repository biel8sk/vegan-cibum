import 'package:flutter/material.dart';
import 'package:vegan_cibum/domain/entities/recipe_entity.dart';
import 'package:vegan_cibum/domain/usecases/get_all_recipes.dart';

class RecipePageViewModel extends ChangeNotifier {
  final GetAllRecipes repository;

  RecipePageViewModel(this.repository);

  final List<Recipe> _listRecipes = [];
  bool isLoading = false;

  List<Recipe> get recipes => (_listRecipes);

  Future<void> getRecipes() async {
    isLoading = true;
    //notifyListeners();

    try {
      final list = await repository.getRecipes(10);
      _listRecipes.clear();
      _listRecipes.addAll(list);
    } catch (e) {
      debugPrint('Erro ao carregar receitas: $e');
    } finally {
      isLoading = false;
      //notifyListeners();
    }
  }
}
