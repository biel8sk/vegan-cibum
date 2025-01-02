import 'package:vegan_cibum/domain/entities/recipe_entity.dart';

class RecipeModel extends RecipeEntity{
  RecipeModel(
    {required super.id, 
    required super.picture, 
    required super.title, 
    required super.dificulty, 
    required super.ingredients, 
    required super.instructions});

    factory RecipeModel.fromJson(dynamic data){
      return RecipeModel(
        id: data['id'], 
        picture: data['picture'], 
        title: data['title'], 
        dificulty: data['dificulty'], 
        ingredients: data['ingredients'], 
        instructions: data['instructions'],
      );
    }

    Map<String,dynamic> toJson(RecipeModel model){
      return {
        'id': model.id,
        'picture': model.picture,
        'title':model.title,
        'dificulty': model.dificulty,
        'ingredients': model.ingredients,
        'instructions': model.instructions,
      };
    }

}