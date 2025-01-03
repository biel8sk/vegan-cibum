import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vegan_cibum/routing/destinations.dart';
import 'package:vegan_cibum/ui/core/theme/theme.dart';
import 'package:vegan_cibum/ui/home/home_screen.dart';
import 'package:vegan_cibum/ui/recipe_page/recipe_page.dart';
import 'package:vegan_cibum/ui/recipes_search/search_recipe_page.dart';

class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('LayoutScaffold'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
        selectedItemColor: mytheme.primaryColor,
        items: destinations.toList(),
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      ), 
    );
  }
}
