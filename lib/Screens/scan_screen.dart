
// Screens
import 'package:flutter/material.dart';
import '../Custom Widgets/greenbutton.dart';
import '../Custom Widgets/header.dart';
import 'manual_screen.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/phone.png',
                width: 227,
                height: 151,
              ),
            ),
            const SizedBox(height: 32),
            Text(
                'Verification',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 282,
              child: Text(
                  'Choose the method you wish to verify your product with',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF105341),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              onPressed: () {},
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/solar_camera_icon-min.png'),
                    const SizedBox(width: 4),
                    Text(
                      'Camera',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFF9E6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ManualNafdacEntryPage()),
                );
              },
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/icons/number.png'),
                    const SizedBox(width: 4),
                    Text(
                      'Manual Entry',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}