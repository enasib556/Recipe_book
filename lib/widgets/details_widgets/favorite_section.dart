import 'package:flutter/material.dart';
import 'package:final_project_recipes/models/recipe_model.dart';

class FavoriteSection extends StatefulWidget {
  final Recipe recipe;
  final Function(Recipe recipe) onFavorite;

  const FavoriteSection({
    super.key,
    required this.recipe,
    required this.onFavorite,
  });

  @override
  State<FavoriteSection> createState() => _FavoriteSectionState();
}

class _FavoriteSectionState extends State<FavoriteSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.recipe.isFavorite ? 'Added to Favorites' : 'Add to Favorites',
          style: TextStyle(
            color: widget.recipe.isFavorite ? const Color.fromARGB(255, 12, 126, 16) : const Color.fromARGB(255, 126, 121, 121),
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          icon: Icon(
            widget.recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: widget.recipe.isFavorite ? Colors.red :  const Color.fromARGB(255, 126, 121, 121),
          ),
          onPressed: () {
            setState(() {
              widget.onFavorite(widget.recipe);
            });
          },
        ),
      ],
    );
  }
}
