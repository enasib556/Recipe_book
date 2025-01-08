import 'package:final_project_recipes/widgets/add_recipe_widgets/form_field_widget.dart';
import 'package:flutter/material.dart';

class RecipeFormFields extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function(String?) onDifficultySaved;
  final Function(String?) onDurationSaved;
  final Function(String?) onIngredientsSaved;
  final Function(String?) onStepsSaved;
  final VoidCallback onSubmit;

  const RecipeFormFields({
    super.key,
    required this.formKey,
    required this.onDifficultySaved,
    required this.onDurationSaved,
    required this.onIngredientsSaved,
    required this.onStepsSaved,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        FormFieldWidget(
          hintText: 'Difficulty (e.g., Easy, Medium, Hard)',
          onSaved: onDifficultySaved,
        ),
        const SizedBox(height: 10),
        FormFieldWidget(
          hintText: 'Duration (in minutes)',
          onSaved: onDurationSaved,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        FormFieldWidget(
            hintText: 'Ingredients (comma separated)',
            onSaved: onIngredientsSaved),
        const SizedBox(height: 10),
        FormFieldWidget(
            hintText: 'Steps (comma separated)', onSaved: onStepsSaved),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 12, 126, 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onSubmit,
          child: const Text(
            'Add Recipe',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
