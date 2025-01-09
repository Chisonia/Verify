import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.verified, color: Colors.green),
              SizedBox(width: 5),
              Text('Verified', style: TextStyle(fontSize: 12)),
            ],
          ),
          Expanded(
            child: Image.asset('assets/images/nivea2-min.png'),
          ),
          const SizedBox(height: 10),
          const Text('Nivea Lotion', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
