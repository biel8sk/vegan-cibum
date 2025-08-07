import 'package:flutter/material.dart';
import 'package:vegan_cibum/ui/core/shered/widgets/app_bar_widget.dart';
import 'package:vegan_cibum/ui/core/shered/theme/theme.dart';
import 'package:vegan_cibum/ui/home/widgets/text_decoration_plate_of_day.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //prato do dia
            Stack(children: [
              Container(
                margin: const EdgeInsets.all(12),
                height: 250,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/strogonoff_vegano.webp'),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              const Positioned(
                  bottom: 20,
                  left: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDecorationPlateOfDay(
                          content: "Prato do dia", size: 35),
                      TextDecorationPlateOfDay(
                          content: "Strogonoff de cogumello", size: 25),
                      TextDecorationPlateOfDay(
                          content: "50 min | Dificuldade: fácil", size: 18)
                    ],
                  )),
            ]),

            const Text(
              "Top Receitas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(21),
                  height: 200,
                  width: 300,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.lightGreen
                  ),
                  child: const Column(
                    children: [
                      CircleAvatar(),
                      Text("Receita 1"),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Suas favoritas
            const Text(
              "Suas receitas favoritas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Row(
              children: [
                Container(
                  child: const Column(
                    children: [
                      CircleAvatar(),
                      Text("Receita 1"),
                    ],
                  ),
                )
              ],
            ),
            // Novas receitas
          ],
        ),
      ),
    );
  }
}


