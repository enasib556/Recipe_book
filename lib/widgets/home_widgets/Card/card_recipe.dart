import 'package:flutter/material.dart';
import 'package:final_project_recipes/models/recipe_model.dart';
import 'package:final_project_recipes/screens/details_recipe_screen.dart';
import 'tags_row.dart';
import 'recipe_header.dart';

class CardRecipe extends StatelessWidget {
  final Recipe recipe;
  final Function(Recipe) onDelete;
  final Function(Recipe) onFavorite;

  const CardRecipe({
    super.key,
    required this.recipe,
    required this.onDelete,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RecipeHeader(
              recipe: recipe,
              onDelete: onDelete,
              onFavorite: onFavorite,
              onDetails: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailsScreen(
                    title: recipe.title,
                    recipe: recipe,
                    onFavorite: onFavorite,
                    onDelete: onDelete,
                  );
                }));
              },
            ),
            const SizedBox(height: 8),
            TagsRow(recipe: recipe),
          ],
        ),
      ),
    );
  }
}
