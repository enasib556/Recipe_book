import 'dart:io';

import 'package:flutter/material.dart';
import 'package:final_project_recipes/models/recipe_model.dart';

class RecipeHeader extends StatelessWidget {
  final Recipe recipe;
  final Function(Recipe) onDelete;
  final Function(Recipe) onFavorite;
  final VoidCallback onDetails;

  const RecipeHeader({
    super.key,
    required this.recipe,
    required this.onDelete,
    required this.onFavorite,
    required this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: recipe.image != null && recipe.image!.isNotEmpty
              ? FileImage(
                  File(recipe.image!),) // استخدم FileImage للصور المحفوظة
              : const AssetImage("assets/images/spaghetti.jpg")
                  as ImageProvider,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            recipe.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4CAF50),
            ),
            maxLines: 3,
            overflow: TextOverflow.clip,
          ),
        ),
        IconButton(
          onPressed: () => onFavorite(recipe),
          icon: Icon(
            recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: recipe.isFavorite ? Colors.red : Colors.grey,
          ),
        ),
        IconButton(
          onPressed: () => onDetails(),
          icon: const Icon(Icons.arrow_forward_ios),
          color: Colors.grey,
        ),
        IconButton(
          onPressed: () => onDelete(recipe),
          icon: const Icon(
            Icons.close,
            color: Colors.grey,
            size: 20,
          ),
        ),
      ],
    );
  }
}
