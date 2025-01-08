import 'package:final_project_recipes/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class DetailsHeader extends StatelessWidget {
  final Recipe recipe;

  const DetailsHeader({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: recipe.image != null && File(recipe.image!).existsSync()
          ? Image.file(
              File(recipe.image!),
              fit: BoxFit.fill,
              height: 250,
              width: double.infinity,
            )
          : Image.asset(
              recipe.image ?? 'assets/images/default_image.jpg', // Default asset if null
              fit: BoxFit.fill,
              height: 250,
              width: double.infinity,
            ),
    );
  }
}
