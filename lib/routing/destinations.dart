import 'package:flutter/material.dart';

class Destination {
  const Destination({required this.label, required this.icon});

  final String label;
  final IconData icon;
}

const destinations = [
  BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_outlined)),
  BottomNavigationBarItem(label: 'Recipe', icon: Icon(Icons.receipt)),
  BottomNavigationBarItem(label: 'Perfil', icon: Icon(Icons.person_2_rounded)),
];