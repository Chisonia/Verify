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
            Text("Product Name: ${product['productName']}",
                style: const TextStyle(fontSize: 18)),
            Text("NAFDAC Number: ${product['nafdacNumber']}",
                style: const TextStyle(fontSize: 16)),
            Text("Manufacturer: ${product['manufacturer']['name']}",
                style: const TextStyle(fontSize: 16)),
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
        backgroundColor: Colors.white,
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
        title: const Text('Manual Entry'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // NAFDAC Number Input
            TextField(
              controller: _nafdacController,
              keyboardType: TextInputType.number,
              maxLength: 8, // Set the expected NAFDAC number length
              onChanged: (value) {
                if (value.length == 8) {
                  _fetchProductDetails(value);
                }
              },
              decoration: InputDecoration(
                labelText: "Enter NAFDAC number here...",
                border: const OutlineInputBorder(),
                prefixIcon: Image.asset(
                  'assets/icons/number.png',
                  width: 24.0,
                  height: 24.0,
                ),
              ),
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
                final nafdacNumber = _nafdacController.text;
                if (nafdacNumber.isNotEmpty && nafdacNumber.length == 8) {
                  _fetchProductDetails(nafdacNumber);
                }
              },
              child: Center(
                child: Text(
                  'Check',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            // Numeric Keypad (Sample for entering numbers)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: 12, // 0-9 + delete
                    itemBuilder: (context, index) {
                      String buttonText;
                      if (index < 9) {
                        buttonText = (index + 1).toString();
                      } else if (index == 9) {
                        buttonText = '0';
                      } else {
                        buttonText = index == 10 ? 'OK' : 'X'; // X for delete
                      }

                      return ElevatedButton(
                        onPressed: () {
                          String currentValue = _nafdacController.text;
                          if (index < 9) {
                            _nafdacController.text = currentValue + (index + 1)
                                .toString();
                          } else if (index == 9) {
                            _nafdacController.text = '${currentValue}0';
                          } else if (index == 11) {
                            // Handle backspace
                            _nafdacController.text = currentValue
                                .isNotEmpty ? currentValue
                                .substring(0, currentValue.length - 1) : '';
                          }
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ), backgroundColor: Colors.grey.shade200,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: Text(buttonText,
                            style: const TextStyle(
                                fontSize: 24, color: Colors.black
                            )
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
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
