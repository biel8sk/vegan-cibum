import 'package:vegan_cibum/domain/entities/nutrient_entity.dart';
import 'package:vegan_cibum/domain/entities/nutrition_entity.dart';
import 'package:vegan_cibum/domain/entities/recipe_entity.dart';
import 'package:vegan_cibum/domain/entities/recipe_information_entity.dart';

final List<Nutrient> sampleNutrients = [
  Nutrient(title: "Proteína", amount: 25.0, unit: "g", percentOfDailyNeeds: 50.0),
  Nutrient(title: "Carboidratos", amount: 45.0, unit: "g", percentOfDailyNeeds: 15.0),
  Nutrient(title: "Gordura", amount: 10.0, unit: "g", percentOfDailyNeeds: 20.0),
  Nutrient(title: "Fibra", amount: 8.0, unit: "g", percentOfDailyNeeds: 30.0),
  Nutrient(title: "Açúcar", amount: 12.0, unit: "g", percentOfDailyNeeds: 10.0),
];

final Nutrition sampleNutrition = Nutrition(nutrients: sampleNutrients);

final RecipeInformation sampleRecipeInformation = RecipeInformation(
  id: 1,
  title: "Salada de Grão-de-Bico",
  image: "https://th.bing.com/th/id/OIP.teYq_7TsphOkTiQgnpW3kQHaFj?rs=1&pid=ImgDetMain",
  instructions: "Misture todos os ingredientes e sirva gelado.",
  extendedIngredients: ["Grão-de-bico", "Tomate", "Cebola", "Azeite", "Sal"],
  nutrition: sampleNutrition,
  summary: "Uma salada saudável e nutritiva.",
  readyInMinutes: 15,
);

final List<Recipe> sampleRecipes = [
  Recipe(id: 1, picture: "https://th.bing.com/th/id/OIP.qoGuN1Wx26G8PqhYjZQYnAHaFj?rs=1&pid=ImgDetMain", title: "Salada de Quinoa"),
  Recipe(id: 2, picture: "https://th.bing.com/th/id/OIP.qoGuN1Wx26G8PqhYjZQYnAHaFj?rs=1&pid=ImgDetMain", title: "Tofu Grelhado"),
  Recipe(id: 3, picture: "https://th.bing.com/th/id/OIP.qoGuN1Wx26G8PqhYjZQYnAHaFj?rs=1&pid=ImgDetMain", title: "Smoothie Verde"),
];
