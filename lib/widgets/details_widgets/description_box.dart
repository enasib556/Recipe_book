import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  final String description;

  const DescriptionBox({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.only(left: 20.0, bottom: 10, top: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(60, 112, 179, 11),
        // color: const Color.fromARGB(255, 171, 233, 195),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          description,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}