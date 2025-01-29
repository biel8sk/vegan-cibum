import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vegan_cibum/ui/core/shered/widgets/app_bar_widget.dart';
import 'package:vegan_cibum/ui/core/shered/theme/theme.dart';
import 'package:vegan_cibum/ui/recipes_search/view_model/search_pege_view_model.dart';
import 'package:vegan_cibum/ui/recipes_search/widgets/recipe_card.dart';

class SearchRecipePage extends StatefulWidget {
  const SearchRecipePage({super.key});

  @override
  State<SearchRecipePage> createState() => _SearchRecipePageState();
}

class _SearchRecipePageState extends State<SearchRecipePage> {

  @override
  void initState()  {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    final viewModel = context.read<RecipePageViewModel>();
    await viewModel.getRecipes(); // Aguarda o carregamento completo
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipePageViewModel>();

    return Scaffold(
      backgroundColor: mytheme.primaryColor,
      appBar: const AppBarWidget(),
      body:

            viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: viewModel.recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = viewModel.recipes[index];

                      return RecipeCard(
                        recipe: recipe,
                        onTap: () async {
                          
                          context.go('/search/${recipe.id}');
                        },
                      );
                    },
                  ),
      
    );
  }
}
