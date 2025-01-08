import 'package:flutter/material.dart';

class StepsSection extends StatelessWidget {
  final List<String> steps;

  const StepsSection({
    super.key,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Text(
            'Steps:',
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
          itemCount: steps.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 5, top: 8),
              child: Text(
                '${index + 1}. ${steps[index]}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          },
        ),
      ],
    );
  }
}
