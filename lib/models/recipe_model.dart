class Recipe {
  final String title;
  final String description;
  final String? image;
  final List<String> ingredients;
  final List<String> steps;
  final String difficulty;
  final double rating;
  final int duration;
  bool isFavorite;

  Recipe({
    required this.difficulty,
    required this.rating,
    required this.duration,
    required this.title,
    required this.description,
    required this.image,
    required this.ingredients,
    required this.steps,
    this.isFavorite = false,
  });
}