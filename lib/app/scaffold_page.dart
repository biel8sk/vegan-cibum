import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vegan_cibum/data/service/recipe_repository.dart';
import 'package:vegan_cibum/domain/usecases/get_all_recipes.dart';
import 'package:vegan_cibum/routing/destinations.dart';
import 'package:vegan_cibum/ui/core/theme/theme.dart';
import 'package:vegan_cibum/ui/recipes_search/view_model/search_pege_view_model.dart';

class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('LayoutScaffold'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RecipePageViewModel(
            GetAllRecipes(
              repository: RecipeRepository(),
            ),
          ),
          //child: SearchRecipePage(),
        ),
      ],
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: navigationShell.goBranch,
          selectedItemColor: mytheme.primaryColor,
          items: destinations.toList(),
          type: BottomNavigationBarType.fixed,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          selectedFontSize: 20,
          unselectedItemColor: Colors.black54,
        ),
      ),
    );
  }
}
