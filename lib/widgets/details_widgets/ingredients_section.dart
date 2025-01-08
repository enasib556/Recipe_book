import 'package:flutter/material.dart';

class IngredientsSection extends StatelessWidget {
  final List<String> ingredients;

  const IngredientsSection({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Text(
            'Ingredients:',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 12, 126, 16)
                ),
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: ingredients.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 5, top: 8),
              child: Text(
                '• ${ingredients[index]}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          },
        ),
      ],
    );
  }
}
