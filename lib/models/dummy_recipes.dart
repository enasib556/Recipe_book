import 'package:final_project_recipes/models/recipe_model.dart';

final List<Recipe> dummyRecipes = [
  Recipe(
    difficulty: 'Easy',
    rating: 4.5,
    duration: 20,
    title: 'Spaghetti Bolognese',
    description: 'A classic Italian pasta dish with a rich tomato sauce.',
    image: 'assets/images/spaghetti.jpg',
    ingredients: ['Spaghetti', 'Tomato Sauce', 'Minced Meat', 'Garlic'],
    steps: [
      'Boil the spaghetti.',
      'Cook the minced meat.',
      'Add the tomato sauce.',
      'Mix everything together.',
    ],
  ),
  Recipe(
    difficulty: 'Medium',
    rating: 4.8,
    duration: 45,
    title: 'Chocolate Cake',
    description: 'A delicious chocolate dessert for any occasion.',
    image: 'assets/images/chocolate cake.jpg',
    ingredients: ['Flour', 'Sugar', 'Cocoa Powder', 'Eggs', 'Butter'],
    steps: [
      'Mix all ingredients.',
      'Pour into a baking tray.',
      'Bake in the oven for 30 minutes.',
    ],
  ),
  Recipe(
    difficulty: 'Easy',
    rating: 4.2,
    duration: 10,
    title: 'Caesar Salad',
    description: 'A fresh salad with Caesar dressing and croutons.',
    image: 'assets/images/casaer salad.jpg',
    ingredients: ['Lettuce', 'Croutons', 'Parmesan', 'Caesar Dressing'],
    steps: [
      'Wash and chop the lettuce.',
      'Add croutons and Parmesan.',
      'Drizzle with Caesar dressing.',
      'Toss everything together.',
    ],
  ),
  Recipe(
    difficulty: 'Hard',
    rating: 4.9,
    duration: 90,
    title: 'Beef Wellington',
    description: 'A gourmet dish perfect for special occasions.',
    image: 'assets/images/beef wellington.jpg',
    ingredients: ['Beef Fillet', 'Puff Pastry', 'Mushrooms', 'Prosciutto'],
    steps: [
      'Sear the beef fillet.',
      'Prepare the mushroom duxelles.',
      'Wrap the beef with prosciutto and puff pastry.',
      'Bake until golden brown.',
    ],
  ),
  Recipe(
    difficulty: 'Medium',
    rating: 4.7,
    duration: 25,
    title: 'Pancakes',
    description: 'Fluffy pancakes served with syrup.',
    image: 'assets/images/pancakes.jpg',
    ingredients: ['Flour', 'Milk', 'Eggs', 'Baking Powder', 'Sugar'],
    steps: [
      'Mix all ingredients into a batter.',
      'Heat a pan and pour the batter.',
      'Cook until golden brown on both sides.',
    ],
  ),
];
