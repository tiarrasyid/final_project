import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final String? initialValue;

  CustomTextField({
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: keyboardType,
    );
  }
}
