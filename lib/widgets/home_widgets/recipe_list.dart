import 'package:flutter/material.dart';
import 'package:final_project_recipes/models/recipe_model.dart';
import 'package:final_project_recipes/widgets/home_widgets/card.dart';

class RecipeList extends StatelessWidget {
  final List<Recipe> recipes;
  final Function(Recipe) onDelete;
  final Function(Recipe) onFavorite;

  const RecipeList({
    super.key,
    required this.recipes,
    required this.onDelete,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return recipes.isEmpty
        ? const Center(
            child: Text(
              'No recipes found',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          )
        : ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) => CardRecipe(
              recipe: recipes[index],
              onDelete: onDelete,
              onFavorite: onFavorite,
            ),
          );
  }
}
