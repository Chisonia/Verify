import 'package:flutter/material.dart';
import 'package:verify/Screens/onboarding_screen2.dart';

import '../Custom Widgets/onboarding.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableOnboardingScreen(
      imagePath: 'assets/images/onboarding_screen1.png',
      title1: 'Verify Products with Confidence',
      description: 'Protect your health by ensuring the products you use are '
          'authentic. With Verify, you can check any NAFDAC-registered '
          'item instantly.',
      iconPath: 'assets/icons/first.png',
      button1Text: 'Get Started',
      button1Action: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen2()),
        );
      },
      backgroundColor: Colors.white,
    );
  }
}
