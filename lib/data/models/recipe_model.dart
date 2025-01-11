import 'package:vegan_cibum/domain/entities/recipe_entity.dart';

class RecipeModel extends Recipe{
  RecipeModel(
    {required super.id, 
    required super.picture, 
    required super.title, });

    factory RecipeModel.fromJson(dynamic data){
      return RecipeModel(
        id: data['id'], 
        picture: data['image'], 
        title: data['title'], 
      );
    }
}