import 'dart:convert';

import 'package:http/http.dart';
import 'package:vegan_cibum/api_key.dart';
import 'package:vegan_cibum/data/models/recipe_detail_model.dart';
import 'package:vegan_cibum/data/models/recipe_model.dart';
import 'package:vegan_cibum/data/repository/i_recipe_repository.dart';



class RecipeRepository implements IRecipeRepository{

  Client client;

  RecipeRepository([Client? externalClient]) : client = externalClient ?? Client();

  
  @override
  Future<List<RecipeModel>> fetchRecipe(int qnt)async {
    const baseUrl = 
      'https://api.spoonacular.com/recipes/complexSearch?diet=vegan&number=10&apiKey=$myApiKey';

    var response  = await client.get(Uri.parse(baseUrl));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final listRecipe = (data['results']as List).map((recipe) => RecipeModel.fromJson(recipe)).toList();
      return listRecipe;
    }else{
      throw Exception('Failed to fetch Recipes');
    }
  }

  @override
  Future<RecipeDetailModel> getDetailRecipe(int id) async{
    final String url =
        'https://api.spoonacular.com/recipes/$id/information?includeNutrition=true&apiKey=$myApiKey';

    final response = await client.get(Uri.parse(url));
    if(response.statusCode == 200){
      return RecipeDetailModel.fromJson(jsonDecode(response.body));
    }
    else {
      throw Exception("Failed to get detail recipes");
    }
  }

}