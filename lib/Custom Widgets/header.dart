import 'package:flutter/material.dart';

class ReusableHeader extends StatelessWidget {
  final String title;

  const ReusableHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF01031A)),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }
}