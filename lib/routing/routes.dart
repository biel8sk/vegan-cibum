
import 'package:go_router/go_router.dart';
import 'package:vegan_cibum/ui/home/widgets/home_screen.dart';

final router  = GoRouter(
  routes: [
    GoRoute(
      path: '/', 
      builder: (context, state) => const HomeScreen(),
    ),
  ]
);