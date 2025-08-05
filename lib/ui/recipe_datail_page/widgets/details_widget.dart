import 'package:flutter/material.dart';
import 'package:vegan_cibum/domain/entities/recipe_information_entity.dart';
import 'package:vegan_cibum/ui/core/fake.dart';
import 'package:vegan_cibum/ui/recipe_datail_page/widgets/chef_info_widget.dart';
import 'package:vegan_cibum/ui/recipe_datail_page/widgets/custom_icon.dart';
import 'package:vegan_cibum/ui/recipe_datail_page/widgets/instructions_widget.dart';
import 'package:vegan_cibum/ui/recipe_datail_page/widgets/nutrition_widget.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.recipeInformation});
  final RecipeInformation recipeInformation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: MediaQuery.of(context).size.height *0.4,
              child: Image.network(
            fit: BoxFit.cover,
            recipeInformation.image,
            errorBuilder: (exception, objetc, st) => const Center(
              child: Icon(Icons.broken_image_rounded),
            ),
          )),
          Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIcon(
                    icon: Icons.arrow_back,
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      CustomIcon(
                        icon: Icons.favorite,
                        onPressed: () {},
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      CustomIcon(
                        icon: Icons.share,
                        onPressed: () {},
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              )),
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  color: Colors.white),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //categoria e avaliação
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // TODO : COLOCAR A CATEGORIA NA MODEL
                        Text("Salada", style: TextStyle(color: Colors.grey)),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            Text('4.9',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    //title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          recipeInformation.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          // Ícone de orgânico/vegano
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(Icons.eco,
                              color: Colors.green, size: 18),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    const ChefInfo(),

                    const SizedBox(height: 20),
                    const Text('Description',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      'Read more',
                      style: TextStyle(color: Color.fromARGB(255, 25, 168, 29)),
                    ),
                    const SizedBox(height: 20),

                    // TODO: WIDGETS DE TEMPO DE PREPARO 

                    const SizedBox(height: 20),
                    //ingredientes
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Ingredients',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                Text('1 Serving',
                                    style: TextStyle(color: Colors.grey, fontSize: 18)),
                              ],
                            ),
                            ...recipeInformation.extendedIngredients
                                .map((ingredient) => SizedBox(
                                      width: 400,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('- $ingredient',
                                            style:
                                                const TextStyle(fontSize: 16)),
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
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            recipeInformation.instructions == null ||
                                    recipeInformation.instructions!.isEmpty
                                ? const Center(child: Text("Sem instruções"))
                                : SizedBox(
                                    width: 400,
                                    child: Column(
                                      children: recipeInformation.instructions!
                                          .map((step) => InstructionsWidget(
                                                step: step,
                                              ))
                                          .toList(),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    // nutrição
                    SizedBox(
                        height: 300,
                        child: NutritionWidget(nutrients: sampleNutrients)),
                    const SizedBox(
                      height: 12,
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      right: 20,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.play_circle),
                        label: const Text('Cozinhar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 25, 168, 29),
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
