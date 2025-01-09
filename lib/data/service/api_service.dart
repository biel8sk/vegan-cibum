import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:vegan_cibum/data/models/recipe_model.dart';
import 'package:vegan_cibum/data/repository/recipe_use_case_repository.dart';
import 'package:http/http.dart' as http;


class ApiService implements IRecipeUseCaseRepository{

  final String _baseUrl;

  ApiService(this._baseUrl);

  
  @override
  Future<List<RecipeModel>> fetchRecipe()async {
    final url = _baseUrl;
    var response  = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final listRecipe = (data['results']as List).map((recipe) => RecipeModel.fromJson(recipe)).toList();
      return listRecipe;
    }
    else{
      throw Exception('Failed to fetch Recipes');
    }
  }

}