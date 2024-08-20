import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool enable;

  const Field({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    required this.inputType,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: hintText,
            label: Text(label),
            enabled: enable,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
