// Reusable button Widgets
import 'package:flutter/material.dart';

class ReusableGreenButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const ReusableGreenButton({super.key, required this.text, required this.onPressed, this.color = const Color(0xFF105341)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 358, height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}