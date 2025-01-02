class RecipeEntity {
  final String id;
  final String picture;
  final String title;
  final String dificulty;
  final List<String> ingredients;
  final List<String> instructions;

  RecipeEntity(
    {required this.id,
    required this.picture,
    required this.title, 
    required this.dificulty, 
    required this.ingredients,
    required this.instructions});
}