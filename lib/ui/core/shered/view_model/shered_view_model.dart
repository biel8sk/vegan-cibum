import 'package:flutter/material.dart';

class SheredViewModel  extends ChangeNotifier {
  bool isDark = false;

  // trocar o tema
  void toggleTheme(){
    isDark = !isDark;
    notifyListeners();
  }
}