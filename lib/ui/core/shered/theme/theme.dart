import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final mytheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    onPrimary: Colors.green,
    seedColor: Colors.green,
    brightness: Brightness.light,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 158, 255, 155),
  textTheme: GoogleFonts.indieFlowerTextTheme(

  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  iconButtonTheme:const IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.green) ,
      foregroundColor:  WidgetStatePropertyAll(Colors.white) ,
    )
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.green,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  
);

final darkTheme = ThemeData(
  //primaryColor: Colors.green,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 26, 131, 29),
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: const Color(0xFF121212),
  textTheme: GoogleFonts.indieFlowerTextTheme(),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 26, 131, 29),
      foregroundColor: Colors.white,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor:  Color.fromARGB(255, 26, 131, 29),
    elevation: 0,
    centerTitle: true,
  ),

  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(Colors.green[900]),
    )
  ),

  bottomAppBarTheme: const BottomAppBarTheme(
    shape: CircularNotchedRectangle(),
    color:   Color.fromARGB(255, 26, 131, 29),
    shadowColor: Colors.white,
    elevation: 1,
  ),
);
