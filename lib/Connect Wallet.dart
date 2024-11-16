import 'package:flutter/material.dart';

class ConnectWalletScreen extends StatefulWidget {
  const ConnectWalletScreen({super.key});

  @override
  State<ConnectWalletScreen> createState() => _ConnectWalletScreenState();
}

class _ConnectWalletScreenState extends State<ConnectWalletScreen> {
  bool isCardsTabActive = true;
  int selectedAccountIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text(
          "Connect Wallet",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF00796B),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Center(
                  child: Row(
                    children: [
                      _buildTab("Cards", isCardsTabActive),
                      const SizedBox(width: 16),
                      _buildTab("Accounts", !isCardsTabActive),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: isCardsTabActive
                  ? _buildCardsTabContent()
                  : _buildAccountsTabContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCardsTabActive = text == "Cards";
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildCardsTabContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF009688), Color(0xFF00796B)],
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Debit Card",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Image.asset('assets/sim.PNG', height: 30),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "6219 8610 2888 8075",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "HIFZA MALIK",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        "24/01",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Add your debit Card",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "This card must be connected to a bank account under your name",
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            const SizedBox(height: 24),
            _buildInputField(
              "NAME ON CARD",
              "HIFZA MALIK",
              margin: const EdgeInsets.only(bottom: 16),
            ),
            _buildInputField(
              "DEBIT CARD NUMBER",
              "",
              margin: const EdgeInsets.only(bottom: 16),
            ),
            Row(
              children: [
                Expanded(
                  child: _buildInputField("CVC", "",
                      margin: const EdgeInsets.only(right: 8)),
                ),
                Expanded(
                  child: _buildInputField("EXPIRATION MM/YY", "",
                      margin: const EdgeInsets.only(left: 8)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInputField("ZIP", ""),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint,
      {EdgeInsetsGeometry? margin}) {
    return Container(
      margin: margin,
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: TextStyle(color: Colors.grey[600], fontSize: 12),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF00796B)),
          ),
        ),
      ),
    );
  }

  Widget _buildAccountsTabContent() {
    return Column(
      children: [
        const SizedBox(height: 16),
        _buildAccountOption(
          icon: Icons.account_balance,
          title: "Bank Link",
          subtitle: "Connect your bank account to deposit & fund",
          index: 0,
        ),
        _buildAccountOption(
          icon: Icons.watch_later_outlined,
          title: "Microdeposits",
          subtitle: "Connect bank in 5-7 days",
          index: 1,
        ),
        _buildAccountOption(
          icon: Icons.payment,
          title: "Paypal",
          subtitle: "Connect your Paypal account",
          index: 2,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle next button tap
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF00796B),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    color: Color(0xFF00796B),
                    width: 1,
                  ),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAccountOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required int index,
  }) {
    final bool isSelected = selectedAccountIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAccountIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF00796B),
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? const Color(0xFF00796B) : Colors.white,
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
              ),
              child: isSelected
                  ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
