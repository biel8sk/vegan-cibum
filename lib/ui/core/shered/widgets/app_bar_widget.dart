import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
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
          fillColor: Colors.grey[200],
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
              
            },
          ),
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
