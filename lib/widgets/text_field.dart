import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputAction inputAction;
  final TextInputType keyboardType;
  const MyTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.inputAction,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: inputAction,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        hintText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
