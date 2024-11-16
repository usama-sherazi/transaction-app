import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'Add Expense.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Statistics",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {
              // Share functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Tab Buttons with smaller padding and size
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTabButton("Day", true),
              _buildTabButton("Week", false),
              _buildTabButton("Month", false),
              _buildTabButton("Year", false),
            ],
          ),
          const SizedBox(height: 20),
          // Expense Dropdown - Updated style
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    value: "Expense", // Initial value
                    underline: Container(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: ["Expense", "Income"]
                        .map((value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ))
                        .toList(),
                    onChanged: (value) {
                      if (value == "Expense") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
                        );
                      } else if (value == "Income") {
                       /* Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const IncomeScreen()),
                        );*/
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Graph Section - Updated styling
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true,
                  horizontalInterval: 1,
                  verticalInterval: 1,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: Colors.grey.shade200,
                      strokeWidth: 1,
                    );
                  },
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.grey.shade200,
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 22,
                      interval: 1,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        const months = ['Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'];
                        int index = value.toInt() % months.length;
                        return Text(
                          months[index],
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 2),
                      const FlSpot(1, 3.5),
                      const FlSpot(2, 2),
                      const FlSpot(3, 4),
                      const FlSpot(4, 3),
                      const FlSpot(5, 4),
                      const FlSpot(6, 3),
                    ],
                    isCurved: true,
                    color: const Color(0xFF00796B),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF00796B).withOpacity(0.2),
                          const Color(0xFF00796B).withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),
          // Top Spending Section - Updated style
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Top Spending",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.filter_list, color: Colors.grey),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Top Spending List - Updated style
          Flexible(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildSpendingItem(
                  icon: Icons.swap_horiz,
                  title: "Transfer",
                  date: "Yesterday",
                  amount: "PKR 8,500",
                  backgroundColor: Color(0xFF00796B),
                  textColor: Colors.white,
                ),
                _buildSpendingItem(
                  icon: Icons.play_circle_filled,
                  title: "Youtube",
                  date: "Jan 16, 2022",
                  amount: "PKR 1,199",
                  isNegative: true,
                  backgroundColor: Colors.white,
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? const Color(0xFF00796B) : Colors.white,
          foregroundColor: isSelected ? Colors.white : Colors.grey,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: isSelected ? Colors.transparent : Colors.grey.shade300,
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }

  Widget _buildSpendingItem({
    required IconData icon,
    required String title,
    required String date,
    required String amount,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
    bool isNegative = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: backgroundColor == Colors.white
            ? Border.all(color: Colors.grey.shade200)
            : null,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: backgroundColor == Colors.white
                  ? Colors.grey.shade100
                  : Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon,
                color: backgroundColor == Colors.white
                    ? Colors.black54
                    : Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    color: textColor.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            isNegative ? "-$amount" : amount,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
