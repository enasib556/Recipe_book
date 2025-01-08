import 'package:final_project_recipes/widgets/add_recipe_widgets/image_picker.dart';
import 'package:final_project_recipes/widgets/add_recipe_widgets/form_field_widget.dart';
import 'package:final_project_recipes/widgets/add_recipe_widgets/recipe_form_fields.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:final_project_recipes/models/recipe_model.dart';

class AddRecipeForm extends StatefulWidget {
  final Function(Recipe) onAddRecipe;

  const AddRecipeForm({super.key, required this.onAddRecipe});

  @override
  // ignore: library_private_types_in_public_api
  _AddRecipeFormState createState() => _AddRecipeFormState();
}

class _AddRecipeFormState extends State<AddRecipeForm> {
  final _formKey = GlobalKey<FormState>();
  File? imageFile;
  String _title = '';
  String _description = '';
  String _difficulty = 'Easy';
  final double _rating = 3.0;
  int _duration = 30;
  List<String> _ingredients = [];
  List<String> _steps = [];

  void _submitForm() {
    if (_formKey.currentState!.validate() && imageFile != null) {
      _formKey.currentState!.save();
      Recipe newRecipe = Recipe(
        title: _title,
        description: _description,
        image: imageFile?.path,
        ingredients: _ingredients,
        steps: _steps,
        difficulty: _difficulty,
        rating: _rating,
        duration: _duration,
      );
      widget.onAddRecipe(newRecipe);
    } else if (imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormFieldWidget(
                hintText: 'Recipe Title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              const SizedBox(height: 10),
              FormFieldWidget(
                hintText: 'Recipe Description',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              const SizedBox(height: 10),
              ImagePickerWidget(
                onImageSelected: (file) {
                  setState(() {
                    imageFile = file;
                  });
                },
              ),
              const SizedBox(height: 10),
              RecipeFormFields(
                formKey: _formKey,
                onDifficultySaved: (value) {
                  _difficulty =
                      (value == null || value.isEmpty) ? 'Easy' : value;
                },
                onDurationSaved: (value) {
                  _duration = int.tryParse(value ?? '30') ?? 30;
                },
                onIngredientsSaved: (value) {
                  _ingredients =
                      value!.split(',').map((e) => e.trim()).toList();
                },
                onStepsSaved: (value) {
                  _steps = value!.split(',').map((e) => e.trim()).toList();
                },
                onSubmit: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
