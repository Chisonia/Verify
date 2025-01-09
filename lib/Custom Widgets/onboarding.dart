import 'package:flutter/material.dart';

import '../Custom Widgets/greenbutton.dart';

class ReusableOnboardingScreen extends StatelessWidget {
  final String imagePath;
  final String title1;
  final String description;
  final String button1Text;
  final VoidCallback button1Action;
  final String iconPath;
  final Color backgroundColor;

  const ReusableOnboardingScreen({
    super.key,
    required this.imagePath,
    required this.title1,
    required this.description,
    required this.button1Text,
    required this.button1Action,
    required this.iconPath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height:350,
                child: Image.asset(imagePath)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width:285,
                  child: Text(
                    title1,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 22 , width: 25,
              child: Image.asset(
                iconPath,)
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ReusableGreenButton(
                text: button1Text,
                onPressed: button1Action,
              ),
            ),
          ],
        ),
      ),
    );
  }
}