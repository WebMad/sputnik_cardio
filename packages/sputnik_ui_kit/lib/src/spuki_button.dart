import 'package:flutter/material.dart';

class SpukiButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const SpukiButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
