import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vegan_cibum/app/scaffold_page.dart';
import 'package:vegan_cibum/routing/routes.dart';
import 'package:vegan_cibum/ui/auth/view_model/auth_notifier.dart';
import 'package:vegan_cibum/ui/auth/widgets/auth_gate.dart';
import 'package:vegan_cibum/ui/auth/widgets/perfil_page.dart';
import 'package:vegan_cibum/ui/home/widgets/home_screen.dart';
import 'package:vegan_cibum/ui/recipe_datail_page/widgets/recipe_datail_page.dart';
import 'package:vegan_cibum/ui/recipes_search/widgets/search_recipe_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: MyRoutes.homePage,
  refreshListenable: AuthNotifier(FirebaseAuth.instance.authStateChanges()),
  routes: [

    GoRoute(
      path: MyRoutes.signIn,
      builder: (context, state) => const AuthGate(), // Ou SignInScreen diretamente
    ),

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
              path: MyRoutes.searchPage,
              builder: (context, state) => SearchRecipePage(),
              routes: [
                GoRoute(
                  path: ':recipeId',
                  builder: (context, state) {
                    final recipeId = int.parse(
                        state.pathParameters['recipeId']!); // Obtém o ID
                    return RecipeDetailPage(id: recipeId); // Passa o ID
                  },
                ),
              ],
            ),
          ],
        ),
        
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: MyRoutes.profilePage,
              builder: (context, state) => const PerfilPage(),
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
      redirect: (BuildContext context, GoRouterState state) {
        final isAtenticado =  FirebaseAuth.instance.currentUser != null;
        final isSignInRoute = state.matchedLocation == MyRoutes.signIn;

        if(!isAtenticado && !isSignInRoute){ // nao esta autenticado e também não esta na pagina de signIn
          return MyRoutes.signIn; // retorna página de login
        }

        if(isAtenticado && isSignInRoute){
          return MyRoutes.homePage; // retorna página home se está autenticado e tenta acessar o login
        }

        return null; // não redireciona nada se estiver tudo ok
      }
    ),
    
  ],
);