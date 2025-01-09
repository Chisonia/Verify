import 'package:flutter/material.dart';

import '../Custom Widgets/onboarding.dart';
import 'onboarding_screen3.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableOnboardingScreen(
        imagePath: 'assets/images/onboarding_screen2.png',
        title1: 'Simple. Fast. Reliable',
      description: "Scan the NAFDAC number on the product or enter it manually."
          " We'll verify its authenticity in seconds to keep you safe.",
      iconPath: 'assets/icons/second.png',
      button1Text: 'Next',
      button1Action: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen3()),
        );
      },
      backgroundColor: Colors.blue.shade100,
    );
  }
}
