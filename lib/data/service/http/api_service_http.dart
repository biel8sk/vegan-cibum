import 'dart:convert';

import 'package:http/http.dart';
import 'package:vegan_cibum/data/models/recipe_model.dart';
import 'package:vegan_cibum/data/repository/recipe_repository.dart';



class ApiServiceHttp implements IRecipeRepository{

  final String _baseUrl;
  final Client client;

  ApiServiceHttp(this._baseUrl, this.client);

  
  @override
  Future<List<RecipeModel>> fetchRecipe()async {
    final url = _baseUrl;
    var response  = await client.get(Uri.parse(url));
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