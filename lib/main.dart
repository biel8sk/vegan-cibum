import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vegan_cibum/app/app.dart';
import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

