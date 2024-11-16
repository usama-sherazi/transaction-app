import 'package:flutter/material.dart';
import 'package:transaction_app/profile%20screen.dart';
import 'package:transaction_app/wallet%20Screen.dart';

import 'Statistics screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Color tealGreen = const Color(0xFF00796B); // Teal green
  final Color lightTeal = const Color(0xFFE0F2F1); // Light teal background for the card

  int _selectedIndex = 0; // Track the currently selected tab

  // Define the screens to navigate between
  final List<Widget> _screens = [
    const HomeScreen(),
    const StatisticsScreen(),
    const Placeholder(), // Placeholder for the Add button
    const WalletScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40, color: tealGreen),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: tealGreen,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 2) {
            // Placeholder action for Add button
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Add Action Placeholder')),
            );
          } else {
            _onItemTapped(index);
          }
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Color tealGreen = const Color(0xFF00796B);
  final Color lightTeal = const Color(0xFFE0F2F1);

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tealGreen,
        toolbarHeight: 0, // Remove the AppBar for a clean look
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            color: tealGreen,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Good afternoon,\nHifza Malik",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                // Balance Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: lightTeal,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Balance",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(Icons.more_horiz, color: Colors.black54),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "PKR 2,54,800",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: tealGreen,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Income",
                                  style: TextStyle(color: Colors.black54)),
                              const SizedBox(height: 4),
                              Text("PKR 1,840.00",
                                  style: TextStyle(
                                      color: tealGreen,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Expenses",
                                  style: TextStyle(color: Colors.black54)),
                              SizedBox(height: 4),
                              Text("PKR 284.00",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Transactions Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Transactions History",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    color: tealGreen,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildTransactionItem(
                  iconPath: 'assets/upwork.PNG',
                  title: "Upwork",
                  date: "Today",
                  amount: "+ PKR 85,000",
                  color: Colors.green,
                ),
                _buildTransactionItem(
                  iconPath: 'assets/female.PNG',
                  title: "Transfer",
                  date: "Yesterday",
                  amount: "- PKR 8,500",
                  color: Colors.red,
                ),
                _buildTransactionItem(
                  iconPath: 'assets/paypal.PNG',
                  title: "Paypal",
                  date: "July 30, 2024",
                  amount: "+ PKR 1,40,600",
                  color: Colors.green,
                ),

                _buildTransactionItem(
                  iconPath: 'assets/youtube.PNG',
                  title: "YouTube",
                  date: "November 09, 2024",
                  amount: "- PKR 1,199",
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required String iconPath,
    required String title,
    required String date,
    required String amount,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: lightTeal,
            radius: 24, // Adjust size if necessary
            child: ClipOval(
              child: Image.asset(
                iconPath,
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}