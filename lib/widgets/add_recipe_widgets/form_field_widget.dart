import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String hintText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String>? validator;

  final TextInputType? keyboardType;

  const FormFieldWidget({
    super.key,
    required this.hintText,
    required this.onSaved,
    this.validator, this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color.fromARGB(188, 255, 255, 255),
        // labelStyle: const TextStyle(color: Color.fromARGB(255, 12, 126, 16)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Color.fromARGB(255, 12, 126, 16)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Color.fromARGB(255, 12, 126, 16)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Color.fromARGB(255, 12, 126, 16)),
        ),
      ),
      onSaved: onSaved,
      validator: validator,
      keyboardType:keyboardType ,
    );
  }
}
