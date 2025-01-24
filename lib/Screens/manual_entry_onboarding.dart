import 'package:flutter/material.dart';
import 'package:verify/Screens/decision_screen.dart';
import 'manual_screen.dart';

class ManualEntryOnboarding extends StatelessWidget {
  const ManualEntryOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/back_icon.png',
            width: 12.0,
            height: 24.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Manual Entry',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 282,
              child: Text(
                'Locate and enter the NAFDAC number found on the body of '
                    'your product to verify its authenticity.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: Image.asset(
                'assets/images/phone.png',
                width: 227,
                height: 151,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(
                'Please ensure that:',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/mage_scan.png',
                  width: 24.0,
                  height: 24.0,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'The NAFDAC number is properly entered to avoid any '
                        'error in the verification process.',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/internet_antenna.png',
                  width: 24.0,
                  height: 24.0,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'You are connected to a stable internet connection '
                        'to avoid any disruption.',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF105341),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManualNafdacEntryPage(),
                  ),
                );
              },
              child: Center(
                child: Text(
                  'Next',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
