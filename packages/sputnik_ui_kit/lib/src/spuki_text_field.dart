import 'package:flutter/material.dart';

class SpukiTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String? placeholder;
  final TextEditingController? controller;

  const SpukiTextField({
    super.key,
    this.onChanged,
    this.placeholder,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChanged?.call(value),
      controller: controller,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }
}
