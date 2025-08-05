import 'package:vegan_cibum/domain/entities/recipe_entity.dart';

sealed class User {
  factory User.createChef({required String restaurant, required List<Recipe> recipes}) = Chef;
  
  factory User.createAdmin({required List<String> permissions}) = Admin;
  
  factory User.createCommonUser({required String username}) = CommonUser;
  
  factory User.createAnonymousUser() = AnonymousUser;
}

class Chef implements User {
  final String restaurant;
  final List<Recipe> recipes;
  Chef({required this.restaurant, required this.recipes});
}

class Admin implements User {
  final List<String> permissions;
  Admin({required this.permissions});
}

class CommonUser implements User {
  final String username, email, photo;
  final List<Recipe> favoritesRecipe;

  CommonUser({required this.username,required this.email,required this.photo, List<Recipe>? recipes}): favoritesRecipe = recipes ?? [];
}

class AnonymousUser implements User {
}