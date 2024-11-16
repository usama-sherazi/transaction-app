import 'package:flutter/material.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  const ConfirmPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00796B), // Teal green background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    "Bill Payment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    onPressed: () {
                      // Handle more actions
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Details Card
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icon Section
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[200],
                      child: Image.asset(
                        'assets/youtube.PNG', // Replace with your asset path
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Payment Details Text
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "You will pay ",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                            text: "Youtube Premium ",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "for one month with 1Link",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Price Details
                    _buildDetailRow("Price", "PKR 1,199"),
                    _buildDetailRow("Fee", "PKR 199"),
                    const Divider(height: 32),
                    _buildDetailRow("Total", "PKR 1,398",
                        isBold: true, fontSize: 18),
                    const Spacer(),
                    // Confirm and Pay Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          _showPaymentDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00796B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: const Text(
                          "Confirm and Pay",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Detail Row Widget
  Widget _buildDetailRow(String title, String value,
      {bool isBold = false, double fontSize = 14}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: fontSize,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }

  // Function to show payment dialog
  Future<void> _showPaymentDialog(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(
                color: const Color(0xFF00796B), // Teal green color
              ),
              const SizedBox(width: 16),
              const Text(
                "Processing Payment...",
                style: TextStyle(color: Colors.teal),
              ),
            ],
          ),
        );
      },
    );

    // Simulate a delay for the payment process
    await Future.delayed(const Duration(seconds: 3));

    // Dismiss the loading dialog
    Navigator.pop(context);

    // Show success dialog with transaction details
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Payment Successful",
            style: TextStyle(color: Colors.black),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTransactionDetail("Payment method", "Debit Card"),
              _buildTransactionDetail("Status", "Completed"),
              _buildTransactionDetail("Time", "08:15 AM"),
              _buildTransactionDetail("Date", "Oct 28, 2024"),
              _buildTransactionDetail("Transaction ID", "2092913832472"),
              const Divider(height: 24),
              _buildTransactionDetail("Price", "PKR 1,199"),
              _buildTransactionDetail("Fee", "PKR 199"),
              _buildTransactionDetail(
                "Total",
                "PKR 1,398",
                isBold: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF00796B), // Teal green background
              ),
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Colors.white, // White text for the button
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Helper to build transaction detail rows in the success dialog
  Widget _buildTransactionDetail(String title, String value,
      {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
