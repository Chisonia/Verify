import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:verify/Screens/decision_screen.dart';
import 'dart:convert';

import 'manual_entry_onboarding.dart';

class ManualNafdacEntryPage extends StatefulWidget {
  const ManualNafdacEntryPage({super.key});

  @override
  ManualNafdacEntryPageState createState() => ManualNafdacEntryPageState();
}

class ManualNafdacEntryPageState extends State<ManualNafdacEntryPage> {
  final TextEditingController _nafdacController = TextEditingController();
  bool _isLoading = false;

  Future<Map<String, dynamic>> searchProduct(String nafdacNumber) async {
    const apiUrl = 'http://192.168.126.252:5000/api/verify-product/';
    try {
      final response = await http.get(Uri.parse('$apiUrl$nafdacNumber'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          "status": "success",
          "product": data['product'],
        };
      } else if (response.statusCode == 404) {
        final data = json.decode(response.body);
        return {
          "status": "error",
          "message": data['message'],
          "suggestions": [
            "Double-check the NAFDAC number entered.",
            "Report suspicious products to NAFDAC."
          ]
        };
      } else {
        return {
          "status": "error",
          "message": "An unexpected error occurred. Please try again later.",
        };
      }
    } catch (e) {
      return {
        "status": "error",
        "message": "Failed to connect to the server. Please check your internet connection.",
      };
    }
  }

  void _fetchProductDetails(String nafdacNumber) async {
    setState(() => _isLoading = true);
    final response = await searchProduct(nafdacNumber);
    setState(() => _isLoading = false);

    if (response['status'] == 'success') {
      _showProductDetails(response['product']);
    } else {
      _showErrorDialog(response['message'], response['suggestions'] ?? []);
    }
  }

  void _showProductDetails(Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Product Details"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Product Name: ${product['productName']}"),
            Text("NAFDAC Number: ${product['nafdacNumber']}"),
            Text("Manufacturer: ${product['manufacturer']['name']}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message, List<String> suggestions) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Error"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            const SizedBox(height: 8),
            if (suggestions.isNotEmpty) ...[
              const Text("Suggestions:"),
              for (var suggestion in suggestions) Text("• $suggestion"),
            ]
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/back_icon.png',
            width: 12.0,
            height: 24.0,
          ),
          onPressed: () {
            // Navigate back to Decision screen
            Navigator.pop(context);
          },
        ),
        title: const Text('Manual Entry'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            TextField(
              controller: _nafdacController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Enter NAFDAC number here...',
                labelStyle: Theme.of(context).textTheme.titleSmall,
                filled: true,
                fillColor: Colors.grey[100],
                prefixIcon: Image.asset(
                  'assets/icons/number.png',
                  width: 24.0,
                  height: 24.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF105341),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              ),
              onPressed: _isLoading
                  ? null
                  : () {
                final nafdacNumber = _nafdacController.text;
                if (nafdacNumber.isNotEmpty && nafdacNumber.length == 7) {
                  _fetchProductDetails(nafdacNumber);
                }
              },
              child: _isLoading
                  ? const CircularProgressIndicator(color: Color(0xFF3ACE01))
                  :  Center(
                child: Text(
                  'Check',
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