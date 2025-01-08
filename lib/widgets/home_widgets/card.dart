import 'dart:io';

import 'package:final_project_recipes/models/recipe_model.dart';
import 'package:final_project_recipes/screens/details_recipe_screen.dart';
import 'package:flutter/material.dart';

class CardRecipe extends StatefulWidget {
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
  State<CardRecipe> createState() => _CardRecipeState();
}

class _CardRecipeState extends State<CardRecipe> {
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
        child: Stack(
          children: [
            Positioned(
              bottom: 100,
              right: 0,
              child: IconButton(
                  onPressed: () {
                    widget.onDelete(widget.recipe);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 20,
                  )),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // االصورة + النص + السهم
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: widget.recipe.image != null
                          ? (widget.recipe.image!.startsWith("assets/")
                              ? AssetImage(widget
                                  .recipe.image!) // تحميل الصورة من الأصول
                              : FileImage(File(widget.recipe.image!))
                                  as ImageProvider) // تحميل الصورة من الملف
                          : const AssetImage("assets/images/spaghetti.jpg"),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        widget.recipe.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4CAF50),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        widget.onFavorite(widget.recipe);
                      },
                      icon: Icon(
                        widget.recipe.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            widget.recipe.isFavorite ? Colors.red : Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailsScreen(
                            title: widget.recipe.title,
                            recipe: widget.recipe,
                            onFavorite: widget.onFavorite,
                            onDelete: widget.onDelete,
                          );
                        }));
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(width: 44, height: 8),
                // الصعوبة + المدة + التقييم
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTag(widget.recipe.difficulty, Colors.green,
                        Colors.grey[700]!, null),
                    _buildTag("${widget.recipe.duration} min", Colors.blue,
                        Colors.grey[700]!, null),
                    _buildTag(widget.recipe.rating.toStringAsFixed(1),
                        Colors.orange, Colors.grey[700]!, Icons.star),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color color, Color textColor, IconData? icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 1),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (icon != null)
            Icon(
              icon,
              color: const Color.fromARGB(116, 14, 13, 13),
              size: 14,
            )
        ],
      ),
    );
  }
}
