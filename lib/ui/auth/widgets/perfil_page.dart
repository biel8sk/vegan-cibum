import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vegan_cibum/routing/routes.dart';
import 'package:provider/provider.dart';
import 'package:vegan_cibum/ui/core/shered/view_model/shered_view_model.dart';

    
class PerfilPage extends StatelessWidget {

  const PerfilPage({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu Perfil"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.dark_mode,
              color: Colors.white70,
            ),
            onPressed: () {
              // Aqui chamaria a ViewModel para alternar o modo
              context.read<SheredViewModel>().toggleTheme();
            },
          ),
        ],
      ),
      body: ProfileScreen(
        showDeleteConfirmationDialog: true,
        actions: [
          SignedOutAction((context) async {
            context.go(MyRoutes.signIn);
          }),
          AccountDeletedAction((context, user) async {
            context.go(MyRoutes.signIn);
          })
          
        ],
      ),
    );
  }
}