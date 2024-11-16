import 'package:flutter/material.dart';
import 'package:transaction_app/transaction%20details.dart';

import 'Bill details.dart';
import 'Connect Wallet.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool isTransactionsTabActive = true; // Track active tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
        centerTitle: true,
        backgroundColor: const Color(0xFF00796B),
        foregroundColor: Colors.white, // Teal Green
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Column(
        children: [
          // Total Balance Section
          Container(
            color: const Color(0xFF00796B), // Teal Green
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Column(
              children: [
                const Text(
                  "Total Balance",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "PKR 2,54,800",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton(
                      icon: Icons.add,
                      label: "Add",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ConnectWalletScreen()),
                        );
                      },
                    ),
                    _buildActionButton(
                      icon: Icons.payment,
                      label: "Pay",
                      onPressed: () {
                        print("Pay button pressed");
                      },
                    ),
                    _buildActionButton(
                      icon: Icons.send,
                      label: "Send",
                      onPressed: () {
                        print("Send button pressed");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Tab Section
          Container(
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isTransactionsTabActive = true;
                    });
                  },
                  child: _buildTabButton("Transactions",
                      isActive: isTransactionsTabActive),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isTransactionsTabActive = false;
                    });
                  },
                  child: _buildTabButton("Upcoming Bills",
                      isActive: !isTransactionsTabActive),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Tab Content
          Expanded(
            child: isTransactionsTabActive
                ? _buildTransactionsList()
                : _buildUpcomingBillsList(),
          ),
        ],
      ),
    );
  }

  // Reusable Action Button
  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(icon, size: 28, color: const Color(0xFF00796B)),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Reusable Tab Button
  Widget _buildTabButton(String label, {required bool isActive}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.black : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }



// Transactions List
  Widget _buildTransactionsList() {
    return ListView(
      children: [
        _buildTransactionCard(
          title: "Upwork",
          subtitle: "Today",
          amount: "+ PKR 85,000",
          amountColor: Colors.green,
          leadingImagePath: "assets/upwork.PNG",
          onCardPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TransactionDetailsScreen()),
            );
          },
        ),

        _buildTransactionCard(
          title: "Transfer",
          subtitle: "Yesterday",
          amount: "- PKR 8,500",
          amountColor: Colors.red,
          leadingImagePath: "assets/female.PNG",
          onCardPressed: () => print("Transfer card pressed"),
        ),
        _buildTransactionCard(
          title: "Paypal",
          subtitle: "July 30, 2024",
          amount: "+ PKR 1,40,800",
          amountColor: Colors.green,
          leadingImagePath: "assets/paypal.PNG",
          onCardPressed: () => print("Paypal card pressed"),
        ),
        _buildTransactionCard(
          title: "Youtube",
          subtitle: "November 08, 2024",
          amount: "- PKR 1,199",
          amountColor: Colors.red,
          leadingImagePath: "assets/youtube.PNG",
          onCardPressed: () =>TransactionDetailsScreen(),
        ),
      ],
    );
  }

  // Upcoming Bills List
  Widget _buildUpcomingBillsList() {
    return ListView(
      children: [
        _buildBillItem(
          icon: Icons.play_circle_fill,
          iconColor: Colors.red,
          title: "Youtube",
          date: "Feb 28, 2022",
        ),
        _buildBillItem(
          icon: Icons.bolt,
          iconColor: Colors.blue,
          title: "Electricity",
          date: "Mar 28, 2022",
        ),
        _buildBillItem(
          icon: Icons.home,
          iconColor: Colors.teal,
          title: "House Rent",
          date: "Mar 31, 2022",
        ),
        _buildBillItem(
          icon: Icons.music_note,
          iconColor: Colors.green,
          title: "Spotify",
          date: "Feb 28, 2022",
        ),
      ],
    );
  }

  // Reusable Transaction Item
  Widget _buildTransactionCard({
    required String title,
    required String subtitle,
    required String amount,
    required Color amountColor,
    required String leadingImagePath,
    required VoidCallback onCardPressed,
  }) {
    return GestureDetector(
      onTap: onCardPressed, // Handle card press
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4), // Reduced vertical margin
        elevation: 2, // Slight shadow for minimal height impact
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Slightly rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8), // Reduced padding
          child: Row(
            children: [
              CircleAvatar(
                radius: 20, // Reduced avatar size
                backgroundImage: AssetImage(leadingImagePath),
              ),
              const SizedBox(width: 12), // Reduced spacing between avatar and text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14, // Smaller font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 14, // Adjusted font size
                  fontWeight: FontWeight.bold,
                  color: amountColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Reusable Bill Item
  Widget _buildBillItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String date,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        date,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BillDetailsScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00796B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          "Pay",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
