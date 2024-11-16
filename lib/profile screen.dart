import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: const Color(0xFF00796B), // Teal Green
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Section
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 140,
                color: const Color(0xFF00796B), // Teal Green
              ),
              const Positioned(
                top: 90,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person, // Replace with your desired icon
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60), // For avatar alignment
          const Text(
            "Hifza Malik",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            "hifza_malik@gmail.com",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          // Options List
          Expanded(
            child: ListView(
              children: [
                _buildOption(
                  icon: Icons.card_giftcard,
                  title: "Invite Friends",
                ),
                _buildOption(
                  icon: Icons.account_circle,
                  title: "Account info",
                ),
                _buildOption(
                  icon: Icons.person_outline,
                  title: "Personal profile",
                ),
                _buildOption(
                  icon: Icons.message_outlined,
                  title: "Message center",
                ),
                _buildOption(
                  icon: Icons.lock_outline,
                  title: "Login and security",
                ),
                _buildOption(
                  icon: Icons.privacy_tip_outlined,
                  title: "Data and privacy",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable method for creating options
  Widget _buildOption({required IconData icon, required String title}) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Handle onTap
      },
    );
  }
}
