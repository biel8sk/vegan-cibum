import 'package:flutter/material.dart';
import 'package:vegan_cibum/domain/entities/steps_recipe.dart';

class InstructionsWidget extends StatelessWidget {
  final StepsRecipe step;
  const InstructionsWidget({ super.key, required this.step });

   @override
   Widget build(BuildContext context) {
       return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.brown.shade800,
          child: Text(step.id.toString()),
        ),
        title: Text(step.content),
       );
  }
}