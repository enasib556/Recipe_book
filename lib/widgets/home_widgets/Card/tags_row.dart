import 'package:final_project_recipes/models/recipe_model.dart';
import 'package:final_project_recipes/widgets/home_widgets/Card/tag_widget.dart';
import 'package:flutter/material.dart';

class TagsRow extends StatelessWidget {
  final Recipe recipe;

  const TagsRow({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TagWidget(
          text: recipe.difficulty,
          color: Colors.green,
          textColor: Colors.grey[700]!,
        ),
        TagWidget(
          text: "${recipe.duration} min",
          color: Colors.blue,
          textColor: Colors.grey[700]!,
        ),
        TagWidget(
          text: recipe.rating.toStringAsFixed(1),
          color: Colors.orange,
          textColor: Colors.grey[700]!,
          icon: Icons.star,
        ),
      ],
    );
  }
}
