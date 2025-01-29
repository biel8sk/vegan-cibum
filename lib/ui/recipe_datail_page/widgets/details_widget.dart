import 'package:flutter/material.dart';
import 'package:vegan_cibum/domain/entities/recipe_information_entity.dart';

class DetailsWidget extends StatelessWidget {

  const DetailsWidget({ super.key, required this.recipeInformation });
  final RecipeInformation recipeInformation;

   @override
   Widget build(BuildContext context) {
       return Scaffold(
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(recipeInformation.title, style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold),),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  recipeInformation.image,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, color: Colors.red);
                  },
                )),
            
            Text('${recipeInformation.readyInMinutes} porções',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            const Text(
              'Ingredientes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...recipeInformation.extendedIngredients.map((ingredient) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text('- $ingredient', style: TextStyle(fontSize: 16)),
                )),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Adicione lógica para iniciar a receita (timer, modo passo a passo, etc.)
                },
                child: const Text(
                  'Cozinhar',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}