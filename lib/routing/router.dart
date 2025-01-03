import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vegan_cibum/app/scaffold_page.dart';
import 'package:vegan_cibum/routing/routes.dart';
import 'package:vegan_cibum/ui/home/home_screen.dart';
import 'package:vegan_cibum/ui/recipe_page/recipe_page.dart';
import 'package:vegan_cibum/ui/recipes_search/search_recipe_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: MyRoutes.homePage,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => ScaffoldPage(
        navigationShell: navigationShell, 
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MyRoutes.homePage,
              builder: (context, state) => const HomeScreen(), 
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MyRoutes.recipePage,
              builder: (context, state) => const RecipePage(), 
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MyRoutes.searchPage,
              builder: (context, state) => const SearchRecipePage(),
              /* routes: [
                GoRoute(
                  path: MyRoutes.profilePage,
                  builder: (context, state) => ProfilePage(
                    user: state.extra as User,
                  )
                ),
              ],  */
            ),
          ],
        ),
      ],
    ),
  ],
);