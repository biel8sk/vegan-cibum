import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegan_cibum/domain/entities/recipe_entity.dart';
import 'package:vegan_cibum/ui/core/shered/widgets/app_bar_widget.dart';
import 'package:vegan_cibum/ui/core/theme/theme.dart';

class SearchRecipePage extends StatelessWidget {
  SearchRecipePage({super.key});

  final recipes = [
    Recipe(
      id: 1,
      title: 'Salada Vegana',
      picture:
          'https://th.bing.com/th/id/OIP.dTKB9xcQ8A_mpS7r9QxyZQHaJ9?w=188&h=253&c=7&r=0&o=5&dpr=1.4&pid=1.7',
    ),
    Recipe(
      id: 2,
      title: 'Bolo Vegano',
      picture:
          'https://th.bing.com/th/id/R.2c6c25435a69fc20202c680aed461fbf?rik=5ds7i68Tl2cucA&pid=ImgRaw&r=0',
    ),
    Recipe(
      id: 3,
      title: 'Smoothie de Frutas',
      picture:
          'https://files.adventistas.org/quierovidaysalud.com/2019/07/shutterstock_1108602593.jpg',
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Chip(
                      label: TextButton(
                    onPressed: () {},
                    child: const Text("Salgadas"),
                  )),
                  Chip(
                      label: TextButton(
                    onPressed: () {},
                    child: const Text("Doces"),
                  )),
                  Chip(
                      label: TextButton(
                    onPressed: () {},
                    child: const Text("Pamonha"),
                  )),
                ],
              ),
            ),
            // Categorias
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Center(
                  child: Text('Explore Receitas',
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold,),),),
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
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage(recipe.picture),
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
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.transparent
                          ],
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
                            Text(
                              recipe.title,
                              style: GoogleFonts.jimNightshade(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
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
