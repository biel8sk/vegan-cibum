import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vegan_cibum/domain/entities/recipe_entity.dart';
import 'package:vegan_cibum/ui/core/shered/widgets/app_bar_widget.dart';
import 'package:vegan_cibum/ui/core/theme/theme.dart';
import 'package:vegan_cibum/ui/home/home_screen.dart';

class SearchRecipePage extends StatelessWidget {
  SearchRecipePage({super.key});

  final recipes = [
      Recipe(
        id: 1,
        title: 'Salada Vegana',
        picture: 'https://th.bing.com/th/id/OIP.dTKB9xcQ8A_mpS7r9QxyZQHaJ9?w=188&h=253&c=7&r=0&o=5&dpr=1.4&pid=1.7',
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
      backgroundColor: mytheme.primaryColor,
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            
            // Categorias
            const Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  Chip(label: Text('Salgadas')),
                  Chip(label: Text('Doces')),
                  Chip(label: Text('Saladas')),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Receitas Padrão
            const Padding(
              padding:  EdgeInsets.all(6.0),
              child: Center(child:  Text('Explore Receitas', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),

              shrinkWrap: true,
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(children: [
                              Container(
                                height: 250,
                                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/strogonoff_vegano.webp'),
                      fit: BoxFit.cover),
                                ),
                              ),
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                                ),
                              ),
                              Positioned(
                  bottom: 20,
                  left: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildPlateOfDay("Prato do dia", 35),
                      buildPlateOfDay("Strogonoff de cogumello", 25),
                      buildPlateOfDay("50 min | Dificuldade: fácil", 18)
                    ],
                  )),
                            ]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
