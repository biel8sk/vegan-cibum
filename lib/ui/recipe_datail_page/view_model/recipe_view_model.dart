import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:vegan_cibum/data/service/recipe_repository.dart';
import 'package:vegan_cibum/domain/entities/recipe_information_entity.dart';
import 'package:vegan_cibum/domain/usecases/get_detail_recipe.dart';
import 'package:vegan_cibum/ui/recipe_datail_page/view_model/teste_sem_api.dart';

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
    

    try {
      _recipeDetail = await repository.getDetail(id);
      print(_recipeDetail);
    } catch (e) {
      _errorMessage = "Erro ao carregar detalhes: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
