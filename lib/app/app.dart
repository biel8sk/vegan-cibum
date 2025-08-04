import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegan_cibum/routing/router.dart';
import 'package:vegan_cibum/ui/core/shered/theme/theme.dart';
import 'package:vegan_cibum/ui/core/shered/view_model/shered_view_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SheredViewModel(),
      child: Consumer<SheredViewModel>(
        builder: (context, value, child) => 
        MaterialApp.router(
          title: "Vegan Food",
          debugShowCheckedModeBanner: false,
          theme: value.isDark ? darkTheme : mytheme,
          themeMode: ThemeMode.system,
          routerConfig: router,
        ),
      ),
    );
  }
}

