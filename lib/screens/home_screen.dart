import 'package:final_project_recipes/widgets/home_widgets/custom_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:final_project_recipes/models/dummy_recipes.dart';
import 'package:final_project_recipes/models/recipe_model.dart';
import 'package:final_project_recipes/widgets/home_widgets/body_content.dart';

import '../widgets/add_recipe_widgets/add_recipe_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> favoriteRecipes = [];
  int _selectedIndex = 0;

  void _updateFavorites(Recipe recipe) {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
      if (recipe.isFavorite) {
        favoriteRecipes.add(recipe);
      } else {
        favoriteRecipes.remove(recipe);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      // Show the bottom sheet when "Add Recipe" is tapped
      showModalBottomSheet(
        backgroundColor: const Color.fromARGB(203, 238, 247, 237),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: AddRecipeForm(onAddRecipe: (Recipe newRecipe) {
              setState(() {
                dummyRecipes.add(newRecipe);
              });
              Navigator.of(context).pop();
            }),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(29, 19, 95, 4),
        title: const Text(
          'Recipe Book App',
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 12, 126, 16),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children:[ Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(28, 19, 95, 4)
          ),
          child: BodyContent(
            selectedIndex: _selectedIndex,
            favoriteRecipes: favoriteRecipes,
            onDelete: (recipe) {
              setState(() {
                dummyRecipes.remove(recipe);
                favoriteRecipes.remove(recipe);
              });
            },
            onFavorite: _updateFavorites,
          ),
        ),
         Align(
           alignment: Alignment.bottomCenter,
           child: CustomBottomNavigationBar(
                   currentIndex: _selectedIndex,
                   onTap: _onItemTapped,
                 ),
         ),
      ]),
    );
  }
}
