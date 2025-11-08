import 'package:flutter/material.dart';

class SpukiTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? placeholder;
  final TextEditingController? controller;
  final bool obscureText;

  const SpukiTextField({
    super.key,
    this.onChanged,
    this.placeholder,
    this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChanged?.call(value),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }
}
