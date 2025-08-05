import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;
  const CustomIcon({required this.color, super.key , required this.icon, required this.onPressed});

   @override
   Widget build(BuildContext context) {
       return IconButton(
        onPressed: onPressed, 
        icon: Icon(icon, size: 30,),
        style:  ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll(Colors.white) ,
      foregroundColor:  WidgetStatePropertyAll(color) ,
    )
      );
  }
}