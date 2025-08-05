import 'package:flutter/material.dart';

class ChefInfo extends StatelessWidget {
  const ChefInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      //TODO IMPLEMENTAR O USER
      children: [
        CircleAvatar(

        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dianne Russell', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Chef', style: TextStyle(color: Colors.grey)),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 8,),
            Icon(Icons.message),
          ],
        ),
      ],
    );
  }
}