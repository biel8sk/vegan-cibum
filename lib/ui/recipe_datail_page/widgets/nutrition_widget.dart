import 'package:flutter/material.dart';
import 'package:vegan_cibum/domain/entities/nutrient_entity.dart';

class NutritionWidget extends StatelessWidget {
  const NutritionWidget({super.key, required this.nutrients});
  final List<Nutrient> nutrients;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: nutrients.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // title
              Expanded(
                flex: 2,
                child: Text(
                  nutrients[index].title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // amount and unit
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${nutrients[index].amount.toStringAsFixed(2)} ${nutrients[index].unit}'),
                  LinearProgressIndicator(
                    value: nutrients[index].percentOfDailyNeeds! / 100,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  Text('${nutrients[index].percentOfDailyNeeds!.toStringAsFixed(1)}%'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}