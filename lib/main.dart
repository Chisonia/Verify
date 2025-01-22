import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verify/Screens/onboarding_screen1.dart';
import 'package:verify/Screens/splash_screen.dart';
import 'Screens/manual_entry_onboarding.dart';
import 'Screens/manual_screen.dart';
import 'Screens/onboarding_screen2.dart';
import 'Screens/onboarding_screen3.dart';
import 'theme_provider.dart'; // Import the ThemeProvider

import 'Screens/decision_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const VerifyApp(),
    ),
  );
}

class VerifyApp extends StatelessWidget {
  const VerifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Verify',
      theme: themeProvider.themeData,
      home: const SplashScreen(),
      routes: {
        '/onboarding_screen1': (context) => const OnboardingScreen1(),
        '/onboarding_screen2': (context) => const OnboardingScreen2(),
        '/onboarding_screen3': (context) => const OnboardingScreen3(),
        '/decision': (context) => const DecisionScreen(),
        '/manual_screen_onboarding': (context) => const ManualEntryOnboarding(),
        '/manual_screen': (context) => const ManualNafdacEntryPage(),
      },// Set SplashScreen as the initial screen
    );
  }
}