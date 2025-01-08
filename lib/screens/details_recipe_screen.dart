import 'package:final_project_recipes/widgets/details_widgets/description_box.dart';
import 'package:final_project_recipes/widgets/details_widgets/details_header.dart';
import 'package:final_project_recipes/widgets/details_widgets/favorite_section.dart';
import 'package:final_project_recipes/widgets/details_widgets/ingredients_section.dart';
import 'package:final_project_recipes/widgets/details_widgets/remove_button.dart';
import 'package:final_project_recipes/widgets/details_widgets/steps_section.dart';
import 'package:flutter/material.dart';
import 'package:final_project_recipes/models/recipe_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    required this.title,
    required this.recipe,
    required this.onDelete,
    required this.onFavorite,
  });

  final Recipe recipe;
  final String title;
  final Function(Recipe recipe) onDelete;
  final Function(Recipe recipe) onFavorite;

  @override
  // ignore: library_private_types_in_public_api
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(26, 19, 95, 4),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new,color :Color.fromARGB(255, 12, 126, 16,
        ),),
        ),
        title: Text(
          '${widget.title} Recipe',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17,color :Color.fromARGB(255, 12, 126, 16)),
        ),
      ),
      body: Container(
         decoration: const BoxDecoration(
          color: Color.fromARGB(24, 19, 95, 4)
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                   DetailsHeader(
                    recipe: widget.recipe,
                  ),
                  FavoriteSection(
                    recipe: widget.recipe,
                    onFavorite: widget.onFavorite,
                  ),
                  const Divider(endIndent: 20, indent: 20),
                  const SizedBox(height: 10),
                  DescriptionBox(description: widget.recipe.description),
                  const Divider(endIndent: 20, indent: 20),
                  IngredientsSection(ingredients: widget.recipe.ingredients),
                  const Divider(endIndent: 20, indent: 20),
                  StepsSection(steps: widget.recipe.steps),
                ],
              ),
            ),
            RemoveButton(
              onDelete: widget.onDelete,
              recipe: widget.recipe,
            ),
          ],
        ),
      ),
    );
  }
}
