import 'package:flutter/material.dart';
    
class RecipeDetailPage extends StatelessWidget {

  const RecipeDetailPage({ super.key, required this.id });
  final int id;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Page'),
      ),
      body: Container(),
    );
  }
}