import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegan_cibum/ui/core/shered/view_model/shered_view_model.dart';
import 'package:vegan_cibum/ui/recipe_datail_page/widgets/recipe_datail_page.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: TextFormField(
        decoration: InputDecoration(
          hintText: 'O que você quer hoje?',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          filled: true,
        ),
      ),
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
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
