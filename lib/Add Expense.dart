import 'package:flutter/material.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F2F1),
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCard(
                children: [
                  const InputField(
                    label: "NAME",
                    hintText: "Netflix",
                    icon: Icons.movie,
                    iconColor: Colors.red,
                  ),
                  const Divider(height: 24, color: Colors.grey),
                  AmountField(
                    onChanged: (value) => print("Amount entered: $value"),
                  ),
                  const Divider(height: 24, color: Colors.grey),
                  DateField(
                    dateText: "Tue, 22 Oct 2024",
                    onDateTap: () {
                      // Open date picker
                    },
                  ),
                  const Divider(height: 24, color: Colors.grey),
                  InvoiceField(onInvoiceTap: () {
                    // Add invoice action
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF00796B),
      foregroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); // Navigate back
        },
      ),
      title: const Text("Add Expense"),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.more_vert),
        ),
      ],
    );
  }

  Widget _buildCard({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final Color iconColor;

  const InputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: iconColor.withOpacity(0.2),
              child: Icon(icon, color: iconColor),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AmountField extends StatelessWidget {
  final Function(String) onChanged;

  const AmountField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "AMOUNT",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter Amount",
                  border: InputBorder.none,
                ),
                onChanged: onChanged,
              ),
            ),



          ],
        ),
      ],
    );
  }
}

class DateField extends StatelessWidget {
  final String dateText;
  final VoidCallback onDateTap;

  const DateField({
    super.key,
    required this.dateText,
    required this.onDateTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "DATE",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dateText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today_outlined),
              onPressed: onDateTap,
            ),
          ],
        ),
      ],
    );
  }
}

class InvoiceField extends StatelessWidget {
  final VoidCallback onInvoiceTap;

  const InvoiceField({super.key, required this.onInvoiceTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "INVOICE",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.add, color: Colors.black54),
              onPressed: onInvoiceTap,
            ),
            const Text(
              "Add Invoice",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
