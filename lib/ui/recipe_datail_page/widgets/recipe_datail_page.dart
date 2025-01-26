import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegan_cibum/ui/recipe_datail_page/view_model/recipe_view_model.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipeDetailViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Receita'),
      ),
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
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(viewModel.recipeDetail!.image, fit: BoxFit.cover),
                          const SizedBox(height: 8),
                          Text(
                            viewModel.recipeDetail!.title,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),
                          const Text("Instruções:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(viewModel.recipeDetail!.instructions ?? ''),
                          const SizedBox(height: 16),
                          const Text("Informações Nutricionais:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          
                        ],
                      ),
                    ),
    );
  }
}
