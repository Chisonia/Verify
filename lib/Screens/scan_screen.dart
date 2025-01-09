// Screens
import 'package:flutter/material.dart';
import '../Custom Widgets/greenbutton.dart';
import '../Custom Widgets/header.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: "Scan"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notification"),
        ],
        currentIndex: 1,
        selectedItemColor: const Color(0xFF3ACE01),
        unselectedItemColor: Colors.grey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ReusableHeader(title: "Scan"),
          Expanded(
            child: Center(
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xFF3ACE01).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ReusableGreenButton(
              text: "Scan",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
