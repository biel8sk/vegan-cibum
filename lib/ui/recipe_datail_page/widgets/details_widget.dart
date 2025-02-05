import 'package:flutter/material.dart';
import 'package:vegan_cibum/domain/entities/recipe_information_entity.dart';
import 'package:vegan_cibum/ui/core/fake.dart';
import 'package:vegan_cibum/ui/recipe_datail_page/widgets/nutrition_widget.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.recipeInformation});
  final RecipeInformation recipeInformation;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              recipeInformation.title,
              style: const TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${recipeInformation.readyInMinutes} porções',
              style:const TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
              ),
            ),
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
            const SizedBox(height: 12),
            //ingredientes
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Ingredientes',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ...recipeInformation.extendedIngredients
                        .map((ingredient) => SizedBox(
                          width: 400,
                          child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('- $ingredient',
                                    style: TextStyle(fontSize: 16)),
                              ),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            //instructions
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "Instruções",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    recipeInformation.instructions == null ||
                            recipeInformation.instructions!.isEmpty
                        ? const Center(child:  Text("Sem instruções"))
                        : SizedBox(
                            width: 400,
                            child: Text(recipeInformation.instructions!),
                          ),
                  ],
                ),
              ),
            ),
            // nutrição 
            SizedBox(height: 300,child: NutritionWidget(nutrients: sampleNutrients)),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: IconButton(
                onPressed: () {
                  //logica para salvar
                }, 
                tooltip: 'Salvar receita',
                icon: const Icon(Icons.favorite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
