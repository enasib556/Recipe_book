import 'package:final_project_recipes/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RecipeBook());
}

class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
         home: HomeScreen());
  }
}



