import 'package:flutter/material.dart';
import 'package:vegan_cibum/domain/entities/recipe_entity.dart';
import 'package:vegan_cibum/domain/usecases/get_all_recipes.dart';
import 'package:vegan_cibum/ui/core/fake.dart';

class RecipePageViewModel extends ChangeNotifier {
  final GetAllRecipes repository;

  RecipePageViewModel(this.repository);

  final List<Recipe> _listRecipes = [];
  bool isLoading = false;

  List<Recipe> get recipes => (_listRecipes);

  Future<void> getRecipes() async {
    isLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 2));
      _listRecipes.addAll(sampleRecipes);
    } catch (e) {
      debugPrint('Erro ao carregar receitas: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
