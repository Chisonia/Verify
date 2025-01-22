import 'package:flutter/material.dart';
import 'package:verify/Screens/home_screen.dart';
import 'manual_entry_onboarding.dart';

class DecisionScreen extends StatelessWidget {
  final bool showBackArrow; // Add this parameter to determine arrow visibility

  const DecisionScreen({super.key, this.showBackArrow = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: showBackArrow
            ? IconButton(
          icon: Image.asset(
            'assets/icons/back_icon.png',
            width: 12.0,
            height: 24.0,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }, // Navigate back
        )
            : null, // No back arrow if `showBackArrow` is false
        title: Text(
          '',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
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
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 282,
              child: Text(
                'Choose the method you wish to verify your product with',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF105341),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManualEntryOnboarding(),
                  ),
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
