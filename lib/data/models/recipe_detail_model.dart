import 'package:vegan_cibum/domain/entities/recipe_detail_entity.dart';

class RecipeDetailModel extends RecipeDetailEntity {
  RecipeDetailModel(
      {required super.id,
      required super.picture,
      required super.title,
      required super.ingredients,
      required super.intructions,
      required super.nutrition});

}