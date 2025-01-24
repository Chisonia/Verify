import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verify/Screens/home_screen.dart';
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
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
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
      debugShowCheckedModeBanner: false, // Disable debug banner
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding_screen1': (context) => const OnboardingScreen1(),
        '/onboarding_screen2': (context) => const OnboardingScreen2(),
        '/onboarding_screen3': (context) => const OnboardingScreen3(),
        '/home_page': (context) => const HomePage(),
        '/decision': (context) => const DecisionScreen(),
        '/manual_screen_onboarding': (context) => const ManualEntryOnboarding(),
        '/manual_screen': (context) => const ManualNafdacEntryPage(),
      },
    );
  }
}