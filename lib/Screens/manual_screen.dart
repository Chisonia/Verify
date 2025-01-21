import 'package:flutter/material.dart';

class ManualNafdacEntryPage extends StatefulWidget {
  const ManualNafdacEntryPage({super.key});

  @override
  ManualNafdacEntryPageState createState() => ManualNafdacEntryPageState();
}

class ManualNafdacEntryPageState extends State<ManualNafdacEntryPage> {
  final TextEditingController _nafdacController = TextEditingController();
  bool _isLoading = false;

  // Dummy API logic
  Future<Map<String, dynamic>> searchProduct(String nafdacNumber) async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    // Call your search_product logic
    return search_product(nafdacNumber: nafdacNumber);
  }

  void _fetchProductDetails(String nafdacNumber) async {
    setState(() {
      _isLoading = true;
    });

    final response = await searchProduct(nafdacNumber);

    setState(() {
      _isLoading = false;
    });

    if (response['status'] == 'success') {
      // Display overlay with product details
      _showProductDetails(response['product']);
    } else {
      // Show error message
      _showErrorDialog(response['message'], response['suggestions']);
    }
  }

  void _showProductDetails(Map<String, dynamic> product) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Product Name: ${product['productName']}", style: const TextStyle(fontSize: 18)),
            Text("NAFDAC Number: ${product['nafdacNumber']}", style: const TextStyle(fontSize: 16)),
            Text("Manufacturer: ${product['manufacturer']['name']}", style: const TextStyle(fontSize: 16)),
          ],
        ),
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
          children: [
            Text(message),
            const SizedBox(height: 16),
            const Text("Suggestions:"),
            for (var suggestion in suggestions) Text("• $suggestion"),
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
        title: const Text("Enter NAFDAC Number"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nafdacController,
              keyboardType: TextInputType.number,
              maxLength: 8, // Set the expected NAFDAC number length
              onChanged: (value) {
                if (value.length == 8) {
                  _fetchProductDetails(value);
                }
              },
              decoration: const InputDecoration(
                labelText: "Enter NAFDAC number here...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 16),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(),
          ],
        ),
      ),
    );
  }

  // Dummy search logic
  Map<String, dynamic> search_product({required String nafdacNumber}) {
    final products = [
      {
        "productName": "Paracetamol 500mg",
        "nafdacNumber": "A56789",
        "manufacturer": {"name": "ABC Pharmaceuticals"}
      }
    ];

    for (var product in products) {
      if (nafdacNumber == product["nafdacNumber"]) {
        return {
          "status": "success",
          "message": "Product found and verified.",
          "product": product
        };
      }
    }

    return {
      "status": "error",
      "message": "Product not found in NAFDAC records.",
      "inputProvided": {
        "nafdacNumber": nafdacNumber,
      },
      "suggestions": [
        "Double-check the NAFDAC number entered.",
        "If the product is suspicious, please report it to NAFDAC for investigation."
      ]
    };
  }
}
