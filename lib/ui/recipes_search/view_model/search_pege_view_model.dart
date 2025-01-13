import 'package:flutter/material.dart';
import 'package:vegan_cibum/domain/entities/recipe_entity.dart';
import 'package:vegan_cibum/domain/usecases/get_all_recipes.dart';

class RecipePegeViewModel extends ChangeNotifier {
  final GetAllRecipes repository;
  
  RecipePegeViewModel(this.repository);

  final List<Recipe> listRecipes = [];
  bool isLoading = false;

  Future<void> getRecipes() async {

    isLoading = true;

    final list = await repository.getRecipes(100);
    listRecipes.addAll(list);
    isLoading = false;
    notifyListeners();
  }
}