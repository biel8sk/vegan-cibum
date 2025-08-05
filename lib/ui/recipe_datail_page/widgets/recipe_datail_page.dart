import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegan_cibum/ui/recipe_datail_page/view_model/recipe_view_model.dart';
import 'package:vegan_cibum/ui/recipe_datail_page/widgets/details_widget.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({super.key, required this.id});
  final int id;

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => loadDetails());
    super.initState();
    
  }

  Future<void> loadDetails() async {
    final provider = context.read<RecipeDetailViewModel>();
    await provider.getDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<RecipeDetailViewModel>(
      builder: (context, viewModel, child) => 
      Scaffold(
        body: viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : viewModel.errorMessage != null
                ? Center(
                    child: Text(
                      viewModel.errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  )
                : viewModel.recipeDetail == null
                    ? const Center(
                        child: Text(
                          "Detalhes da receita não encontrados.",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    : DetailsWidget(recipeInformation: viewModel.recipeDetail!),
      ),
    );
  }
}
