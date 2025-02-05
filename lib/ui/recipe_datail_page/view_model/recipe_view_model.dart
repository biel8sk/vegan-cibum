import 'package:flutter/material.dart';
import 'package:vegan_cibum/domain/entities/recipe_information_entity.dart';
import 'package:vegan_cibum/domain/usecases/get_detail_recipe.dart';
import 'package:vegan_cibum/ui/core/fake.dart';

class RecipeDetailViewModel extends ChangeNotifier {
  final GetDetailRecipe repository;

  RecipeDetailViewModel(this.repository);

  RecipeInformation? _recipeDetail;
  String? _errorMessage;
  bool _isLoading = false;

  RecipeInformation? get recipeDetail => _recipeDetail;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  Future<void> getDetail(int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    

    try {
      
      await Future.delayed(const Duration(seconds: 1));
      _recipeDetail = sampleRecipeInformation;

    } catch (e) {
      _errorMessage = "Erro ao carregar detalhes: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
