// Reusable button Widgets
import 'package:flutter/material.dart';

class ReusableWhiteButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;

  const ReusableWhiteButton({super.key, required this.text, required this.onPressed, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 358, height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF3ACE01), width: 2),
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}