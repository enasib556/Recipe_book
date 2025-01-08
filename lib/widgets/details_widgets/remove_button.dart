import 'package:flutter/material.dart';
import 'package:final_project_recipes/models/recipe_model.dart';

class RemoveButton extends StatelessWidget {
  final Function(Recipe recipe) onDelete;
  final Recipe recipe;

  const RemoveButton({
    super.key,
    required this.onDelete,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            onDelete(recipe);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: const Text(
            'Remove Recipe',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
