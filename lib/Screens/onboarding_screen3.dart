import 'package:flutter/material.dart';
import 'package:verify/Screens/home_screen.dart';
import '../Custom Widgets/onboarding.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return ReusableOnboardingScreen(
      imagePath: 'assets/images/onboarding_screen3.png',
      title1: 'Stay One Step Ahead',
      description: 'Easily monitor your product purchases and ensure you '
          'get genuine items.',
      button1Text: 'Next',
      button1Action: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      iconPath: 'assets/icons/third.png',
      backgroundColor: Colors.greenAccent.shade100,
    );
  }
}
