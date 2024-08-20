import 'package:flutter/material.dart';

class Formfield extends StatelessWidget {
  final Icon icon;
  final String label;
  final String helper;
  final bool obscure;
  final TextEditingController controller;

  const Formfield({
    super.key,
    required this.icon,
    required this.label,
    required this.obscure,
    required this.helper,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: icon,
          label: Text(label),
          helperText: helper,
          helperStyle: const TextStyle(),
        ),
        obscureText: obscure,
      ),
    );
  }
}
