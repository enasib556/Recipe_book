import 'package:flutter/material.dart';
import 'package:final_project_recipes/models/dummy_recipes.dart';
import 'package:final_project_recipes/models/recipe_model.dart';
import 'package:final_project_recipes/widgets/home_widgets/search_field.dart';
import 'package:final_project_recipes/widgets/home_widgets/recipe_list.dart';

class BodyContent extends StatefulWidget {
  final int selectedIndex;
  final List<Recipe> favoriteRecipes;
  final Function(Recipe) onDelete;
  final Function(Recipe) onFavorite;

  const BodyContent({
    super.key,
    required this.selectedIndex,
    required this.favoriteRecipes,
    required this.onDelete,
    required this.onFavorite,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BodyContentState createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  final TextEditingController _searchController = TextEditingController();
  List<Recipe> _filteredRecipes = dummyRecipes;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      final query = _searchController.text.toLowerCase();
      if (query.isEmpty) {
        _filteredRecipes = dummyRecipes;
      } else {
        _filteredRecipes = dummyRecipes
            .where((recipe) => recipe.title.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.selectedIndex == 1
        ? RecipeList(
            recipes: widget.favoriteRecipes,
            onDelete: widget.onDelete,
            onFavorite: widget.onFavorite,
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SearchField(
                  controller: _searchController,
                  onChanged: (value) => _onSearchChanged(),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: RecipeList(
                    recipes: _filteredRecipes,
                    onDelete: widget.onDelete,
                    onFavorite: widget.onFavorite,
                  ),
                ),
              ],
            ),
          );
  }
}
