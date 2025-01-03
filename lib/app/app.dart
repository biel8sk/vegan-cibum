import 'package:flutter/material.dart';
import 'package:vegan_cibum/routing/router.dart';
import 'package:vegan_cibum/ui/core/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Vegan Food",
      debugShowCheckedModeBanner: false,
      theme: mytheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}

