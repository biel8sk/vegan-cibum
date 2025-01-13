import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vegan_cibum/domain/entities/recipe_entity.dart';
import 'package:vegan_cibum/routing/router.dart';

class SearchRecipePage extends StatelessWidget {
  SearchRecipePage({super.key});

  final recipes = [
      Recipe(
        id: 1,
        title: 'Salada Vegana',
        picture: 'https://via.placeholder.com/300',
      ),
      Recipe(
        id: 2,
        title: 'Bolo Vegano',
        picture: 'https://via.placeholder.com/300',
      ),
      Recipe(
        id: 3,
        title: 'Smoothie de Frutas',
        picture: 'https://via.placeholder.com/300',
      ),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Recipe Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Receita do Dia
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Receita do Dia', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Card(
                    child: Column(
                      children: [
                        Image.network(recipes[0].picture),
                        ListTile(
                          title: Text(recipes[0].title),
                          trailing: TextButton(
                            onPressed: () {
                              context.go("/search/recipe");
                            },
                            child: const Text('Ver Receita'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Categorias
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Chip(label: Text('Doces')),
                  Chip(label: Text('Salgadas')),
                  Chip(label: Text('Saladas')),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Receitas Padrão
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text('Explore Receitas', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return ListTile(
                  leading: Image.network(recipe.picture, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(recipe.title),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
