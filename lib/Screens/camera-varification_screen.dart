import 'package:flutter/material.dart';

import '../Custom Widgets/greenbutton.dart';
import '../Custom Widgets/header.dart';

class CameraVerificationScreen extends StatelessWidget {
  const CameraVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ReusableHeader(title: "Camera Verification"),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3ACE01).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Icon(Icons.qr_code, size: 80, color: const Color(0xFF01031A).withOpacity(0.5)),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Locate and scan the NAFDAC number found on the body of your product to verify its authenticity.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: const Color(0xFF01031A).withOpacity(0.7)),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCheckItem("The NAFDAC number is properly captured to avoid any error in the verification process."),
                      _buildCheckItem("There is enough lighting and you are not under any shade."),
                      _buildCheckItem("Your hand is steady and avoid shaking while the process is going on."),
                      _buildCheckItem("You are connected to a stable internet connection to avoid any disruption."),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ReusableGreenButton(
              text: "Next",
              onPressed: () {
                print("Next button pressed");
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF3ACE01), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: const Color(0xFF01031A).withOpacity(0.7)),
            ),
          ),
        ],
      ),
    );
  }
}
