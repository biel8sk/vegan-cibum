import 'package:vegan_cibum/data/models/nutrition_model.dart';
import 'package:vegan_cibum/domain/entities/recipe_detail_entity.dart';

class RecipeDetailModel extends RecipeDetailEntity {
  RecipeDetailModel(
      {required super.id,
      required super.picture,
      required super.title,
      required super.ingredients,
      required super.intructions,
      required super.nutrition});

  factory RecipeDetailModel.fromJson(dynamic data){
    return RecipeDetailModel(
      id: data['id'],
      ingredients: (data['extendedIngredients'] as List)
          .map((ingredient) => ingredient['originalString'] as String)
          .toList(),
      intructions: data["instructions"] ?? '',
      nutrition: NutritionModel.fromJson(data['nutrition']),
      picture: data['image'],
      title: data['title'],
    );
  }

}