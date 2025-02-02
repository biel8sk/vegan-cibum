import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegan_cibum/ui/core/shered/widgets/app_bar_widget.dart';
import 'package:vegan_cibum/ui/core/shered/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const double myBorder = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mytheme.primaryColor,
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          //prato do dia
          Stack(children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
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
          // categorias
          Expanded(
            child: ListView(
              children: [
                _buildCategoryFood(
                  context,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(myBorder))),
                  title: "Variedade",
                  description: "Diferentes pratos para você degustar",
                  icon: Icons.restaurant,
                ),
                _buildCategoryFood(
                  context,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(myBorder))),
                  title: "Saúde",
                  description: "Informações nutricionais incluídas",
                  icon: Icons.health_and_safety_outlined,
                ),
                _buildCategoryFood(
                  context,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(myBorder))),
                  title: "Confiabilidade",
                  description: "Instruções de como fazer a receita",
                  icon: Icons.content_paste_search_rounded,
                ),
                _buildCategoryFood(
                  context,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(myBorder))),
                  title: "Facilidade",
                  description: "Pesquise por ingrediente ou nutrição",
                  icon: Icons.add_task_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildPlateOfDay(String text, double fontSize) {
  return TextButton(
    onPressed: () {
      // chama a receita do dia
    },
    child: Text(
      text,
      style: GoogleFonts.jimNightshade(
        fontSize: fontSize,
        color: Colors.white,
      ),
    ),
  );
}

Widget _buildCategoryFood(
  BuildContext context, {
  required String title,
  required String description,
  required IconData icon,
  required ShapeBorder shape,
  
}) {
  return Card(
    shape: shape,
    child: ListTile(
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      trailing: CircleAvatar(
        
        child: Icon(icon),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),),
      subtitle: Text(description),
      onTap: () {
        //navega para página de receitas
      },
    ),
  );
}
