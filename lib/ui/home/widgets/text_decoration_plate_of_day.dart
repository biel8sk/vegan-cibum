import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDecorationPlateOfDay extends StatelessWidget {
  final String content;
  final double size;
  const TextDecorationPlateOfDay({ super.key, required this.content, required this.size });

   @override
   Widget build(BuildContext context) {
       return Text(
        content,
        style: GoogleFonts.jimNightshade(
        fontSize: size,
        color: Colors.white,
      ),
    );
  }
}